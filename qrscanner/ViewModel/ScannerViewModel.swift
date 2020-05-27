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
    var listResultScanner : [GenerateEntityModel] = [GenerateEntityModel]()
    
    var listResult : [ZXResult] = [ZXResult]()
    var navigate: (() -> ())?
    var isScanner : Bool = false
    var isMultiLoad : Bool = false
    var isQRCode : Int = 0
    var dateTime : String = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
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
        var typeCode = ""
        var value_content : String = ""
        var isCode = "QRCode"
        var flagDuplicate = false
        listTransaction.removeAll()
        if ((mValue.range(of: "http://", options: .caseInsensitive)) != nil || (mValue.range(of: "https://", options: .caseInsensitive)) != nil)
        {
            typeCode = EnumType.URL.rawValue
            let content = UrlModel(url: mValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
                                guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
                            body = String((arr_and[1].split(separator: "="))[1])
                            
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
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
            
            guard let datestart = TimeHelper.getDate(timeString: dtstart), let dateend = TimeHelper.getDate(timeString: dtend) else {return}
            
            let content = EventModel(title: summary, location: location, description: description, beginTime: datestart, endTime: dateend)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if ((mValue.range(of: "WIFI", options: .caseInsensitive)) != nil) {
            typeCode = EnumType.WIFI.rawValue
            var ssid : String = ""
            var protect : String = ""
            var pass : String = ""
            var hidden : Bool = false
            let start = mValue.index(mValue.startIndex, offsetBy: 5)
            let end = mValue.index(mValue.endIndex, offsetBy: 0)
            let new_mValue = String(mValue[start..<end])
            let arr_semi_colon = new_mValue.split(separator: ";")
            for item in arr_semi_colon {
                print(item)
                if (item.contains("S:"))
                {
                    ssid = item.replacingOccurrences(of: "S:", with: "", options: NSString.CompareOptions.literal, range: nil)
                       

                }
                if (item.contains("T:"))
                {
                    if item.split(separator: ":").count > 1
                    {
                        protect = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("P:"))
                {
                    if item.split(separator: ":").count > 1
                    {
                        pass = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("H:")){
                    let value = item.replacingOccurrences(of: "H:", with: "", options: NSString.CompareOptions.literal, range: nil)
                    if (value.caseInsensitiveCompare("True") == .orderedSame) {
                        hidden = true
                    }
                    else {
                        hidden = false
                    }
                }
            }
            print(ssid)
            let content = WifiModel(ssid: ssid, password: pass, protect: protect, hidden: hidden)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
                        if (item.contains("N:"))
                        {
                            fullName = item.replacingOccurrences(of: "N:", with: "", options: NSString.CompareOptions.literal, range: nil)
                        }
                        if (item.contains("FN:"))
                        {
                            fullName = item.replacingOccurrences(of: "FN:", with: "", options: NSString.CompareOptions.literal, range: nil)
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
                            if (item.contains("N:"))
                            {
                                fullName = item.replacingOccurrences(of: "N:", with: "", options: NSString.CompareOptions.literal, range: nil)
                            }
                            if (item.contains("FN:"))
                            {
                                fullName = item.replacingOccurrences(of: "FN:", with: "", options: NSString.CompareOptions.literal, range: nil)
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
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
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
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
        else if ((mType.range(of: "EAN-13", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.EAN_13.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "EAN_13"
        }
        else if ((mType.range(of: "EAN-8", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.EAN_8.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "EAN_8"
        }
        else if ((mType.range(of: "PDF417", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.PDF417.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "PDF417"
        }
        else if ((mType.range(of: "Aztec", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.Aztec.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "Aztec"
        }
        else if ((mType.range(of: "UPCE", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.UPCE.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "UPCE"
        }
        else if ((mType.range(of: "UPCA", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.UPCA.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "UPCA"
        }
        else if ((mType.range(of: "Code 128", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.CODE128.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "Code 128"
        }
        else if ((mType.range(of: "Code 93", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.CODE93.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "Code 93"
        }
        else if ((mType.range(of: "Code 39", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.CODE39.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "Code 39"
        }
        else if ((mType.range(of: "Codabar", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.CODABAR.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "Codabar"
        }
        else if ((mType.range(of: "ITF", options: .caseInsensitive)) != nil){
            typeCode = EnumType.BARCODE.rawValue
            let content = BarcodeModel(productID: mValue, type: BarcodeType.ITF.rawValue)
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            isCode = "ITF"
        }
        else
        {
            typeCode = EnumType.TEXT.rawValue
            let content = TextModel(text: String(mValue))
            guard let jsonData = try? JSONEncoder().encode(content) else {return}
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            
        }
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
                    if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
                        if listResultScanner.count > 0 {
                            for item in listResultScanner {
                                if !(item.content! == value_content && item.typeCode! == typeCode && item.isCode! == isCode){
                                    
                                    flagDuplicate = true
                                }
                                else{
                                    flagDuplicate = false
                                    break
                                }
                                
                            }
                            if flagDuplicate {
                                listResultScanner.append(GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                                let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
                                if !checkItemExist(mValue: mValue){
                                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                                    if result {
                                        print("insert success")
                                    }
                                }
                                
                            }
                        }
                        else{
                            listResultScanner.append(GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                            let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
                            if !checkItemExist(mValue: mValue){
                                let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                                if result {
                                    print("insert success")
                                }
                            }
                        }
                    }
                    else
                    {
                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                        if result {
                            print("insert success")
                        }
                    }
                    
                    
                }
                else{
                    if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
                        let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: "", isCode: isCode)
                        if !checkItemExist(mValue: mValue){
                            let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                            if result {
                                if result {
                                    guard let itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime) else {return}
                                    guard let typeCode = itemScanner.typeCode?.lowercased(), let content = itemScanner.content else {return}
                                    let value = ContentViewModel(data: ContentModel(typeCode : typeCode, content: content))
                                    listTransaction.append(value)
                                    self.navigate?()
                                }
                            }
                        }
                        else{
                            self.navigate?()
                        }
                    }
                    else
                    {
                        print("value content scanner :\(value_content)")
                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                        if result {
                            if result {
                                guard let itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime) else {return}
                                guard let typeCode = itemScanner.typeCode?.lowercased(), let content = itemScanner.content else {return}
                                let value = ContentViewModel(data: ContentModel(typeCode : typeCode, content: content))
                                listTransaction.append(value)
                                self.navigate?()
                            }
                        }
                    }
                }
            }
            else{
                //                let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime!, isCode: isCode))
                //                if result {
                //                    print("insert success")
                //                }
                
                
                
                if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
                    let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
                    if !checkItemExist(mValue: mValue){
                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                        if result {
                            print("insert success")
                        }
                    }
                    else{
                        
                        
                    }
                    
                }
                else
                {
                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
                    if result {
                        print("insert success")
                    }
                    
                    
                }
            }
        }
        
        
    }
    func checkItemExist (mValue : GenerateEntityModel) -> Bool {
        let result = SQLHelper.checkItemExist(data: mValue)
        if result > 0 {
            
            doUpdate(mCreateDateTime: Int(result), mValue: mValue)
           
            guard let itemScanner = SQLHelper.getItemScanner(createDateTime: Int(result)) else {return false}
            guard let typeCode = itemScanner.typeCode?.lowercased(), let content = itemScanner.content else {return false}
            let value = ContentViewModel(data: ContentModel(typeCode : typeCode, content: content))
            
            listTransaction.append(value)
            return true
        }
        return false
    }
    func doUpdate(mCreateDateTime: Int,mValue : GenerateEntityModel){
        SQLHelper.updatedScanner(data: GenerateEntityModel(createdDateTime: mCreateDateTime, typeCode: mValue.typeCode ?? "", content: mValue.content ?? "", isHistory: true, isSave: false, updatedDateTime: Int(mValue.updatedDateTime ?? Int64(mCreateDateTime)), bookMark: false, transactionID: mValue.transactionID ?? "", isCode: mValue.isCode ?? ""))
        
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
        //  self.showLoading.value = true
        var flag : Bool = false
        var vstring: String?
        let myGroup = DispatchGroup()
        if list.count > 0{
            for index in list {
                //                print(index.pngData()!.base64EncodedString())
                myGroup.enter()
                //Do something and leave
                if let mData = index.toCGImage(){
                    //                    print(mData)
                    CommonService.onReaderQRcode(tempImage: mData, countList : list.count) { (value) in
                        if value == nil {
                            flag = true
                        }
                        if let mValue = value {
                            //                            print(mValue.count)
                            if mValue.count > 1
                            {
                                if list.count > 0{
                                    self.listResult.append(contentsOf: mValue)
                                }
                            }
                            else if mValue.count == 1
                            {
                                vstring = mValue[0].text
                                
                                let type = CommonService.barcodeFormatToString(format: ZXBarcodeFormat(rawValue: mValue[0].barcodeFormat.rawValue))
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
            //  self.showLoading.value = false
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
            //            print(listResult)
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
            //  self.showLoading.value = false
        }
        
    }
    func doGetListTransaction(){
        listTransaction.removeAll()
        if let mList = SQLHelper.getListTransaction(transaction: dateTime){
            var index = 0
            self.listTransaction = mList.map({ (data) -> ContentViewModel in
                index += 1
                return ContentViewModel(typeCode: data.typeCode!, content: data.content!)
            })
            
        }
        listScanner.removeAll()
        self.navigate?()
    }
    
}
