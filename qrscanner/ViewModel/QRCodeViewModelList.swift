//
//  QRCodeViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class QRCodeViewModelList : QRCodeViewModelListDelegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listItem: [QRCodeViewModel] = [QRCodeViewModel]()
    var listQRResult : [ZXResult] = []
    var currentCell: QRCodeViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
     var listItemSelected: [QRCodeViewModel] = [QRCodeViewModel]()
    var listContent: [ContentViewModel] = [ContentViewModel]()
    var itemScanner : GenerateEntityModel = GenerateEntityModel()
    var listItemScanner : [GenerateEntityModel] = [GenerateEntityModel]()
    var listTransaction : [ContentViewModel] = [ContentViewModel]()

    var countItemSelected: Int = 0
    var navigate: (() -> ())?
    var isQRCodelist : Int = 0
    var dateTime: String?
    func doSelectItem(coable : Codable){
        if let value = coable.get(value: QRCodeViewModel.self){
            //    Utils.logMessage(object: listSave)
            for (index, element) in listItem.enumerated() {
                if element.imgCodeView == value.imgCodeView {
                    debugPrint(index)
                    let mObject = listItem[index]
                    mObject.check = !value.check
                    if mObject.check == true {
                        countItemSelected += 1
                        
                    }
                    else{
                        if countItemSelected > 0
                        {
                            countItemSelected -= 1
                        }
                    }
                    
                    print(listItem)
                    responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
                }
            }
        }
    }
    func convertStringToQRCode(mValue : [ZXResult]){
        for item in mValue {
            print(item.text)
            listItem.append(QRCodeViewModel(imgCode: item.text, stringCode: item.text, typeCode: Int(item.barcodeFormat.rawValue), check: false, dateTime: ""))
        }
         responseToView!(EnumResponseToView.GET_DATA_SOURCE.rawValue)
    }
    func doConvertQRtoString(){
        for item in listItemSelected {
            print(item.stringCode)
            if item.check == true{
                scannerResult(mValue: item.stringCode!)
            }
        }
     //   self.navigate?()
    }
      func scannerResult(mValue : String){
            var typeCode = ""
            var value_content = ""
            print(mValue)
            if mValue.contains("http://") || mValue.contains("https://"){
                typeCode = EnumType.URL.rawValue
                let content = UrlModel(url: mValue)
                let jsonData = try! JSONEncoder().encode(content)
                value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
                print(value_content)
            }
            else if (mValue.contains("geo")) {
                typeCode = EnumType.LOCATION.rawValue
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
                typeCode = EnumType.EMAIL.rawValue
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
                print(dtstart)
                print(dtstart)

                let datestart = TimeHelper.getDate(timeString: dtstart)!
                let dateend = TimeHelper.getDate(timeString: dtend)!
                let content = EventModel(title: summary, location: location, description: description, beginTime: datestart, endTime: dateend)
                let jsonData = try! JSONEncoder().encode(content)
                value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
                print(value_content)
                
            }
            else if ((mValue.range(of: "SMS", options: .caseInsensitive)) != nil)
            {
                typeCode = EnumType.MESSAGE.rawValue
                let arr_mess = mValue.split(separator: ":")
                let content = MessageModel(to: String(arr_mess[1]) , message: String(arr_mess[2]))
                let jsonData = try! JSONEncoder().encode(content)
                value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
                print(value_content)
                
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
                typeCode = EnumType.TELEPHONE.rawValue
                let tel = String(mValue.split(separator: ":")[1])
                let content = PhoneModel(phone: tel)
                let jsonData = try! JSONEncoder().encode(content)
                value_content = String(data: jsonData, encoding: String.Encoding.utf8)!
                print(value_content)
                
            }
                
            else
            {
                typeCode = EnumType.TEXT.rawValue
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
                let createDateTime = Date().millisecondsSince1970
                print("value dateTime: \(dateTime)")
                let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime!))
                
            }
        }
    func doGetListTransaction(){
    
           if let mList = SQLHelper.getListTransaction(transaction: dateTime!){
               var index = 0
               self.listTransaction = mList.map({ (data) -> ContentViewModel in
                   index += 1
                return ContentViewModel(typeCode: data.typeCode!, content: data.content!)
               })
           }
           print(listTransaction)
        self.navigate?()
       }
     func doSelectedAll(isValue : Bool){
               for index in listItem {
                   index.check = isValue
               }
               checkedList()
               responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
           }
           
           func checkedList(){
               countItemSelected = 0;
               var count = 0
               for index in listItem{
                   if index.check {
                       count += 1
                       countItemSelected = count
                   }
               }
               if count > 0 {
                   isVisible.value = true
               }else{
                   isVisible.value = false
               }
               Utils.logMessage(object: listItem)
           }
}

