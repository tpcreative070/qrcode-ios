//
//  ScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/8/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
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
     var navigate: (() -> ())?
    var isScanner : Bool = false
    private let userService : UserService
    init(userService : UserService = UserService()) {
        self.userService = userService
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
    func scannerResult(mValue : String){
        var typeCode = ""
        var value_content = ""
        print(mValue)
        if mValue.contains("http://") || mValue.contains("https://"){
            typeCode = LanguageKey.Url
            let content = UrlModel(url: mValue)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
        }
        else if (mValue.contains("geo")) {
            typeCode = LanguageKey.Location
            if mValue != nil || mValue != "" {
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
                                print(value_content)
                            }
                        }
                    }
                }
            }
            
        }
        else if ((mValue.range(of: "mailto", options: .caseInsensitive)) != nil) || ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil){
            typeCode = LanguageKey.Email
            var email : String = ""
            var sub : String = ""
            var body : String = ""
            if ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil) {
                let arr_semi_colon = mValue.split(separator: ";")
                let arr_first = arr_semi_colon[0].split(separator: ":")
                email = String(arr_first[2])
                sub = String((arr_semi_colon[1].split(separator: ":"))[1])
                body = String((arr_semi_colon[2]).split(separator: ":")[1])
                
                
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
                
            }
            let content = EmailModel(email: String(email ), objectEmail: String(sub), messageEmail: String(body))
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        else if (mValue.contains("BEGIN:VCALENDAR")) || (mValue.contains("BEGIN:VEVENT")){
            typeCode = LanguageKey.Event
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
                    print("Item value : \(item)")
                    if(item.contains("SUMMARY")){
                        summary = String((item.split(separator: ":"))[1])
                    }
                    if(item.contains("LOCATION"))
                    {
                        location = String(item.split(separator: ":")[1])
                    }
                    if(item.contains("DESCRIPTION")){
                        description = String(item.split(separator: ":")[1])
                    }
                    if (item.contains("DTSTART")){
                        dtstart = String((item.split(separator: ":"))[1])
                    }
                    if (item.contains("DTEND")){
                        dtend = String((item.split(separator: ":"))[1])
                    }
                }
            }
            
            let datestart = TimeHelper.getDate(timeString: dtstart)!
            let dateend = TimeHelper.getDate(timeString: dtend)!
            let content = EventModel(title: summary, location: location, description: description, beginTime: datestart, endTime: dateend)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        else if ((mValue.range(of: "SMS", options: .caseInsensitive)) != nil)
        {
            typeCode = LanguageKey.Message
            let arr_mess = mValue.split(separator: ":")
            let content = MessageModel(to: String(arr_mess[1]) , message: String(arr_mess[2]))
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        else if ((mValue.range(of: "WIFI", options: .caseInsensitive)) != nil) {
            typeCode = LanguageKey.Wifi
            var ssid : String = ""
            var protect : String = ""
            var pass : String = ""
            
            let start = mValue.index(mValue.startIndex, offsetBy: 5)
            let end = mValue.index(mValue.endIndex, offsetBy: 0)
            let new_mValue = String(mValue[start..<end])
            let arr_semi_colon = new_mValue.split(separator: ";")
            for item in arr_semi_colon {
                if (item.contains("S"))
                {
                    ssid = String((item.split(separator: ":"))[1])
                }
                if (item.contains("T"))
                {
                    protect = String((item.split(separator: ":"))[1])
                    
                }
                if (item.contains("P"))
                {
                    pass = String((item.split(separator: ":"))[1])
                    
                }
            }
            let content = WifiModel(ssid: ssid, password: pass, protect: protect)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        else if (mValue.contains("MECARD")) || (mValue.contains("VCARD")) || (mValue.contains("MCARD")) {
            typeCode = LanguageKey.Contact
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
            if mValue.contains("VCARD"){
                let arr_space = mValue.split(separator: "\n")
                if arr_space.count > 0{
                    for item in arr_space {
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
            let content = ContactModel(fullNameContact: fullName, addressContact: address, phoneContact: phone, emailContact: email)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        else if (mValue.caseInsensitiveCompare("tel") == .orderedSame || (mValue.range(of: "TEL", options: .caseInsensitive)) != nil) {
            typeCode = LanguageKey.Telephone
            let tel = String(mValue.split(separator: ":")[1])
            let content = PhoneModel(phone: tel)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
            
        else
        {
            typeCode = LanguageKey.Text
            let content = TextModel(text: mValue)
            let jsonData = try! JSONEncoder().encode(content)
            value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(value_content)
            
        }
        
        //        if let json = try? JSONSerialization.data(withJSONObject: mValue) {
        //        if let content = String(data: json, encoding: .utf8) {
        //            print(content)
        //        }
        //        }
        if (typeCode == nil || value_content == nil || typeCode == "" || value_content == "")
        {
            print("Empty value")
        }
        else
        {
            print("value insert: \(value_content)")
            let createDateTime = Date().millisecondsSince1970
           let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false))
            if result {
                itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime)!
                let typeCode = itemScanner.typeCode?.lowercased()
                print(typeCode)
                let content = itemScanner.content
                print(content)
                 let value = ContentViewModel(data: ContentModel(typeCode : typeCode!, content: content!))
                listItemContent.append(value)
//                listItemScanner.append(itemScanner)
//                print(listItemScanner.count)
//                if listItemScanner.count > 1 {
//                    self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
//                }
//                if listItemScanner.count == 1{
//
//                }
                print(isScanner)
                if isScanner {
                   self.navigate?()
                }
            }
        }
        
    }
    func defaultValue(){
        self.itemScanner = GenerateEntityModel()
           self.listItemScanner.removeAll()
        self.listItemContent.removeAll()
        self.isScanner = false
       }
    func doAsync(list : [UIImage]){
      //  showLoading.value = true
        defaultValue()
        let myGroup = DispatchGroup()
        if list.count > 1{
            for index in list {
                myGroup.enter()
                //Do something and leave
                if let mData = index.toCGImage(){
                    CommonService.onReaderMultiQRcode(tempImage: mData) { (value) in
                        if let mValue = value {
                            self.scannerResult(mValue: mValue)
                        }else {
                            let okAlert = SingleButtonAlert(
                                title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
                                message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
                                action: AlertAction(buttonTitle: "Ok", handler: {
                                    print("Ok pressed!")
                                    //  self.defaultValue()
                                })
                            )
                            self.onShowError?(okAlert)
                        }
                        //            myGroup.leave()
                    }
                }
            }
            self.navigate?()

        }
        if list.count == 1 {
            if let mData = list[0].toCGImage(){
                CommonService.onReaderQRcode(tempImage: mData) { (value) in
                    if let mValue = value {
                        self.scannerResult(mValue: mValue)
                    }
//                    else {
//                        let okAlert = SingleButtonAlert(
//                            title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
//                            message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
//                            action: AlertAction(buttonTitle: "Ok", handler: {
//                                print("Ok pressed!")
//                                //  self.defaultValue()
//                            })
//                        )
//                        self.onShowError?(okAlert)
//                    }
                    //            myGroup.leave()
                }
            }
        }
        myGroup.notify(queue: .main) {
            print("Finished all requests.")
             self.navigate?()
            self.showLoading.value = false
        }
    }
    
}
