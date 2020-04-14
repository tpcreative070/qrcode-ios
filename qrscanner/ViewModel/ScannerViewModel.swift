//
//  ScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/8/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class ScannerViewModel : ScannerViewModelDelegate {
    var cameraBinding: Bindable<Bool> = Bindable(false)
    var transactionIdBinding: Bindable<String> = Bindable("")
    var responseToView: ((String) -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var dictionaryList: [Int : ContentModel] = [Int : ContentModel]()
    var resultScan: Bindable<String> = Bindable("")
    var itemScanner : GenerateEntityModel = GenerateEntityModel()
    var listItemScanner : [GenerateEntityModel] = [GenerateEntityModel]()
    var listItemContent : [ContentViewModel] = [ContentViewModel]()
    var listTransaction : [ContentViewModel] = [ContentViewModel]()
    var listResult : [ZXResult] = [ZXResult]()
    var navigate: (() -> ())?
    var isScanner : Bool = false
    var isQRCode : Int = 0
    var dateTime : String?
    var isVibrate: Bool?
    var listScanner : [ScannerModel] = [ScannerModel]()
    var isChoosePhoto : Bool = false
    var listImage : [UIImage] = [UIImage]()

    
    
    let userService : UserService
    init(userService : UserService = UserService()) {
        self.userService = userService
    }
    init(userService : UserService = UserService(), data: SettingModel) {
        self.userService = userService
        self.isVibrate = data.isVibrate
    }
    
    func askCameraPermission() {
        DispatchQueue.main.async {
            let check = GrantPermission.checkCameraPermission()
            if check == .authorized {
                self.cameraBinding.value = true
            } else if check == .notDetermined {
                GrantPermission.requestCameraPermission { granted in
                    self.cameraBinding.value = granted
                }
            } else {
                self.cameraBinding.value = false
            }
        }
    }
    
    func openAppSetting() {
        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    func scannerResult(mValue : String, mType: String){
        print(mValue)
        print(mType)
        var typeCode = ""
        var value_content : String = ""
        listTransaction.removeAll()
        
        if ((mValue.range(of: "http://", options: .caseInsensitive)) != nil || (mValue.range(of: "https://", options: .caseInsensitive)) != nil)
        {
            typeCode = EnumType.URL.rawValue
            let content = UrlModel(url: mValue)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
        else if (mValue.contains("geo")) {
            typeCode = EnumType.LOCATION.rawValue
            if mValue.count > 0 {
                if mValue.contains(":") {
                    let arr_split_colon = mValue.split(separator: ":")
                    if arr_split_colon.count > 1 {
                        let arr_split_comma = arr_split_colon[1].split(separator: ",")
                        if arr_split_comma.count > 1{
                            let arr_split_question = arr_split_comma[1].split(separator: "?")
                            if arr_split_question.count > 1 {
                                let lat = Float(arr_split_comma[0]) ?? 0
                                let lon = Float(arr_split_question[0]) ?? 0
                                let arr_split_equal = arr_split_question[1].split(separator: "=")
                                let query = arr_split_equal[1]
                                
                                let content = LocationModel(latitude: lat, longtitude: lon, query: String(query))
                                let jsonData = try! JSONEncoder().encode(content)
                                value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
                            }
                        }
                    }
                }
            }
            
        }
        else if ((mValue.range(of: "mailto", options: .caseInsensitive)) != nil) || ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil){
            typeCode = EnumType.EMAIL.rawValue
            var email : String = ""
            var sub : String = ""
            var body : String = ""
            if ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil) {
                let arr_semi_colon = mValue.split(separator: ";")
                let arr_first = arr_semi_colon[0].split(separator: ":")
                if arr_first.count > 2
                {
                email = String(arr_first[2])
               
                }
                if arr_semi_colon.count > 1 {
                sub = String((arr_semi_colon[1].split(separator: ":"))[1])
                    if arr_semi_colon.count > 2{
                    body = String((arr_semi_colon[2]).split(separator: ":")[1])
                    }
                }
            }
            if ((mValue.range(of: "mailto", options: .caseInsensitive)) != nil) {
                if mValue.contains("?"){
                    let arr_ques = mValue.split(separator: "?")
                    email = String((arr_ques[0].split(separator: ":"))[1])
                    if arr_ques.count > 1{
                        if arr_ques[1].contains("&"){
                            let arr_and = arr_ques[1].split(separator: "&")
                            sub = String((arr_and[0].split(separator: "="))[1])
                            if (arr_and.count > 1 && arr_and.contains("=")){
                                body = String((arr_and[1].split(separator: "="))[1])
                                
                            }
                            
                        }
                    }
                }
                else{
                    if mValue.split(separator: ":").count > 1 {
                    email = String(mValue.split(separator: ":")[1])
                    }
                }
                
            }
            let content = EmailModel(email: String(email ), objectEmail: String(sub), messageEmail: String(body))
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if (mValue.contains("BEGIN:VCALENDAR")) || (mValue.contains("BEGIN:VEVENT")){
            typeCode = EnumType.EVENT.rawValue
            var summary : String = ""
            var location : String = ""
            var description : String = ""
            var dtstart : String = ""
            var dtend : String = ""
            var arr_space : Array<Substring>
            if  mValue.contains("\r"){
                arr_space = mValue.split(separator: "\r\n")
            }
            else {
                arr_space = mValue.split(separator: "\n")
            }
            
            if arr_space.count > 0{
                for item in arr_space {
                    if(item.contains("SUMMARY")){
                        if item.split(separator: ":").count > 1
                        {
                        summary = String((item.split(separator: ":"))[1])
                        }
                    }
                    if(item.contains("LOCATION"))
                    {
                        if item.split(separator: ":").count > 1
                        {
                        location = String(item.split(separator: ":")[1])
                        }
                    }
                    if(item.contains("DESCRIPTION")){
                        if item.split(separator: ":").count > 1
                        {
                        description = String(item.split(separator: ":")[1])
                        }
                    }
                    if (item.contains("DTSTART")){
                        if item.split(separator: ":").count > 1
                        {
                        dtstart = String((item.split(separator: ":"))[1])
                        }
                    }
                    if (item.contains("DTEND")){
                        if item.split(separator: ":").count > 1
                        {
                        dtend = String((item.split(separator: ":"))[1])
                        }
                    }
                }
            }
            
            let datestart = TimeHelper.getDate(timeString: dtstart)!
            let dateend = TimeHelper.getDate(timeString: dtend)!
            let content = EventModel(title: summary, location: location, description: description, beginTime: datestart, endTime: dateend)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if ((mValue.range(of: "SMS", options: .caseInsensitive)) != nil)
        {
            var to : String = ""
             var message : String = ""
            typeCode = EnumType.MESSAGE.rawValue
            let arr_mess = mValue.split(separator: ":")
            if arr_mess.count > 1 {
                to = String(arr_mess[1])
            }
            if arr_mess.count > 2 {
                 message = String(arr_mess[2])
            }
            let content = MessageModel(to: to , message: message)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if ((mValue.range(of: "WIFI", options: .caseInsensitive)) != nil) {
            typeCode = EnumType.WIFI.rawValue
            var ssid : String = ""
            var protect : String = ""
            var pass : String = ""
            
            let start = mValue.index(mValue.startIndex, offsetBy: 5)
            let end = mValue.index(mValue.endIndex, offsetBy: 0)
            let new_mValue = String(mValue[start..<end])
            let arr_semi_colon = new_mValue.split(separator: ";")
            for item in arr_semi_colon {
                print(item)
                if (item.contains("S"))
                {
                    if item.split(separator: ":").count > 1
                    {
                    ssid = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("T"))
                {
                    if item.split(separator: ":").count > 1
                    {
                    protect = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("P"))
                {
                    if item.split(separator: ":").count > 1
                    {
                    pass = String((item.split(separator: ":"))[1])
                    }
                }
            }
            let content = WifiModel(ssid: ssid, password: pass, protect: protect)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if (mValue.contains("MECARD")) || (mValue.contains("VCARD")) || (mValue.contains("MCARD")) {
            typeCode = EnumType.CONTACT.rawValue
            var fullName : String = ""
            var address : String = ""
            var phone : String = ""
            var email : String = ""
            
            if mValue.contains("MCARD") || mValue.contains("MECARD"){
                let start = mValue.index(mValue.startIndex, offsetBy: 6)
                let end = mValue.index(mValue.endIndex, offsetBy: 0)
                let new_mValue = String(mValue[start..<end])
                let arr_semi_colon = new_mValue.split(separator: ";")
                for item in arr_semi_colon {
                    if item.split(separator: ":").count > 1
                    {
                    if (item.contains("N"))
                    {
                        fullName = String((item.split(separator: ":"))[1])
                    }
                    if (item.contains("TEL"))
                    {
                        phone = String((item.split(separator: ":"))[1])
                    }
                    if (item.contains("EMAIL"))
                    {
                        email = String((item.split(separator: ":"))[1])
                    }
                    if (item.contains("ADR"))
                    {
                        address = String((item.split(separator: ":"))[1])
                    }
                    }
                }
            }
            if mValue.contains("VCARD"){
                let arr_space = mValue.split(separator: "\n")
                if arr_space.count > 0{
                    for item in arr_space {
                        if item.split(separator: ":").count > 1
                        {
                        if(item == "N"){
                            fullName = String((item.split(separator: ":"))[1])
                        }
                        if(item.contains("EMAIL"))
                        {
                            email = String(item.split(separator: ":")[1])
                        }
                        if(item.contains("TEL")){
                            phone += String(item.split(separator: ":")[1])
                        }
                        if (item.contains("ADR")){
                            address = String((item.split(separator: ":"))[1])
                        }
                        }
                    }
                }
                
            }
            let content = ContactModel(fullNameContact: fullName, addressContact: address, phoneContact: phone, emailContact: email)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if (mValue.caseInsensitiveCompare("tel") == .orderedSame || (mValue.range(of: "TEL", options: .caseInsensitive)) != nil) {
            typeCode = EnumType.TELEPHONE.rawValue
            var tel : String = ""
            if mValue.split(separator: ":").count > 1
            {
                tel = String(mValue.split(separator: ":")[1])
            }
            let content = PhoneModel(phone: tel)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if ((mType.range(of: "EAN-13", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: EnumType.EAN_13.rawValue)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
        }
        else if ((mType.range(of: "EAN-8", options: .caseInsensitive)) != nil){
                  typeCode = EnumType.BARCODE.rawValue
                  let content = BarcodeModel(productID: mValue, type: EnumType.EAN_8.rawValue)
                  let jsonData = try! JSONEncoder().encode(content)
                  value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
              }
        else
        {
            typeCode = EnumType.TEXT.rawValue
            let content = TextModel(text: String(mValue))
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        
        //        if let json = try? JSONSerialization.data(withJSONObject: mValue) {
        //        if let content = String(data: json, encoding: .utf8) {
        //            print(content)
        //        }
        //        }
        if (typeCode.count == 0 || value_content.count == 0 || typeCode == "" || value_content == "")
        {
            print("Empty value")
        }
        else
        {
            print("giatr :\(value_content)")
            let createDateTime = Date().millisecondsSince1970
            if isScanner {
                if UserDefaults.standard.bool(forKey:KeyUserDefault.MultiScan){
                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime!, isCode: ""))
                                   if result {
                                       print("insert success")
                                   }
                }
                else{
                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: "", isCode: ""))
                if result {
                    itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime)!
                    let typeCode = itemScanner.typeCode?.lowercased()
                    let content = itemScanner.content
                    let value = ContentViewModel(data: ContentModel(typeCode : typeCode!, content: content!))
                    listTransaction.append(value)
                    self.navigate?()
                }
                }
            }
            else{
                let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime!, isCode: ""))
                if result {
                    print("insert success")
                }
            }
        }
        
        
    }
    
    func defaultValue(){
        self.itemScanner = GenerateEntityModel()
        self.listItemScanner.removeAll()
        self.listItemContent.removeAll()
        self.listResult.removeAll()
        self.isScanner = false
    }
    func doAsync(list : [UIImage]){
        defaultValue()
         AppConstants.isCam = 1
        self.showLoading.value = true
        var flag : Bool = false
        var vstring: String?
        let myGroup = DispatchGroup()
        if list.count > 0{
            for index in list {
                myGroup.enter()
                //Do something and leave
                if let mData = index.toCGImage(){
                    CommonService.onReaderQRcode(tempImage: mData, countList : list.count) { (value) in
                        if value == nil {
                            flag = true
                        }
                        if let mValue = value {
                            if mValue.count > 1
                            {
                                if list.count > 0{
                                    self.listResult.append(contentsOf: mValue)
                                }
                            }
                            else if mValue.count == 1
                            {
                                vstring = mValue[0].text
                                let type = self.barcodeFormatToString(format: ZXBarcodeFormat(rawValue: mValue[0].barcodeFormat.rawValue))
                                self.scannerResult(mValue: mValue[0].text, mType:type)
                            }
                            else{
                                
                                //myGroup.leave()
                                
                            }
                        }
                        else{
                            //                            let okAlert = SingleButtonAlert(
                            //                                title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
                            //                                message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
                            //                                action: AlertAction(buttonTitle: "Ok", handler: {
                            //                                    print("Ok pressed!")
                            //                                    //self.defaultValue()
                            //                                })
                            //                            )
                            //                            self.onShowError?(okAlert)
                            //                            print("kllpl")
                        }
                        
                    }
                }
            }
            //            self.navigate?()
        }
        if listResult.count > 0{
            self.showLoading.value = false
            self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
//            if valueResult == nil {
//                let okAlert = SingleButtonAlert(
//                    title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
//                    message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
//                    action: AlertAction(buttonTitle: "Ok", handler: {
//                        print("Ok pressed!")
//                    })
//                )
//                self.onShowError?(okAlert)
//            }
        }
            else{
                print(listResult)
            if flag {
                    let okAlert = SingleButtonAlert(
                        title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
                        message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
                        action: AlertAction(buttonTitle: "Ok", handler: {
                            print("Ok pressed!")
                            
                            if vstring != nil || vstring == ""{
                                self.navigate?()
                            }
                            
                            //self.defaultValue()
                        })
                    )
                    self.showLoading.value = false
                    self.onShowError?(okAlert)
                }
            }

        myGroup.notify(queue: .main) {
            print("Finished all requests.")
            self.navigate?()
            self.showLoading.value = false
        }
        
    }
    func doGetListTransaction(){
        listTransaction.removeAll()
        if let mList = SQLHelper.getListTransaction(transaction: dateTime!){
            var index = 0
            self.listTransaction = mList.map({ (data) -> ContentViewModel in
                index += 1
                return ContentViewModel(typeCode: data.typeCode!, content: data.content!)
            })
        }
        listScanner.removeAll()
        self.navigate?()
    }
    func barcodeFormatToString(format: ZXBarcodeFormat) -> String {
        switch (format) {
        case kBarcodeFormatAztec:
            return LanguageKey.Aztec
            
        case kBarcodeFormatCodabar:
            return LanguageKey.CODABAR
            
        case kBarcodeFormatCode39:
            return LanguageKey.Code_39
            
        case kBarcodeFormatCode93:
            return LanguageKey.Code_93
            
        case kBarcodeFormatCode128:
            return LanguageKey.Code_128
            
        case kBarcodeFormatDataMatrix:
            return LanguageKey.Data_Matrix
            
        case kBarcodeFormatEan8:
            return LanguageKey.EAN_8
            
        case kBarcodeFormatEan13:
            return LanguageKey.EAN_13
            
        case kBarcodeFormatITF:
            return LanguageKey.ITF
            
        case kBarcodeFormatPDF417:
            return LanguageKey.PDF417
            
        case kBarcodeFormatQRCode:
            return LanguageKey.QR_Code
            
        case kBarcodeFormatRSS14:
            return LanguageKey.RSS_14
            
        case kBarcodeFormatRSSExpanded:
            return LanguageKey.RSS_Expanded
            
        case kBarcodeFormatUPCA:
            return LanguageKey.UPCA
            
        case kBarcodeFormatUPCE:
            return LanguageKey.UPCE
            
        case kBarcodeFormatUPCEANExtension:
            return LanguageKey.UPC_EAN_extension
            
        default:
            return LanguageKey.Unknown
        }
    }
}
