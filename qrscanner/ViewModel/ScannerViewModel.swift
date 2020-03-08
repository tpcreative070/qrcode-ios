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
    
    var dictionaryList: [Int : ScannerEntityModel] = [Int : ScannerEntityModel]()
    var resultScan: Bindable<String> = Bindable("")
    
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
        let currentDateTime = TimeHelper.getString(time: Date(),dateFormat: "dd'/'MM'/'yyyy HH:mm:ss")
        var typeCode = ""
        var content = ""
        if mValue.contains("http://") || mValue.contains("https://"){
            typeCode = LanguageKey.Url
            content = "{\"url\":\"\(mValue)\"}"
        }
        else if (mValue.contains("geo")) {
            typeCode = LanguageKey.Location
            content = "{\"\":\"\(mValue)\"}"
        }
        else if (mValue.contains("mailto")) || (mValue.contains("@")) || (mValue.contains("subject")){
//            var arr_email = mValue.split(separator: ";")
            
//            for i in arr_email{
//                var arr_v = i.split(separator: ":")
//                for item in arr_v {
//                     content = "{\"email\":\"\(arr_v)\"}"
//                }
//            }
            typeCode = LanguageKey.Email
            content = "{\"email\":\"\(mValue)\"}"

        }
        else if (mValue.contains("BEGIN:VCALENDAR")) || (mValue.contains("BEGIN:VEVENT")){
            typeCode = LanguageKey.Event
        }
        else if (mValue.contains("SMSTO")) {
            typeCode = LanguageKey.Message
            let arr_mess = mValue.split(separator: ":")
           
            content = "{\"to\":\"\(arr_mess[1])\",\"message\":\"\(arr_mess[2])\"}"

        }
        else if (mValue.contains("WIFI")) {
            typeCode = LanguageKey.Wifi
            let arr = mValue.split(separator: ":")
            

        }
        else if (mValue.contains("tel")) {
            typeCode = LanguageKey.Telephone
        }
        else if (mValue.contains("MECARD")) || (mValue.contains("VCARD")) {
            typeCode = LanguageKey.Contact
        }
        else
        {
            typeCode = LanguageKey.Text
        }
       
//        if let json = try? JSONSerialization.data(withJSONObject: mValue) {
//        if let content = String(data: json, encoding: .utf8) {
//            print(content)
//        }
//        }
        if (typeCode == nil || content == nil || typeCode == "" || content == "")
        {
            print("Empty value")
        }
        else
        {
             SQLHelper.insertedScanner(data: ScannerEntityModel(createdDateTime: currentDateTime, typeCode: "url", content: content, isHistory: Int(true), isSave: Int(false), updateDateTime: currentDateTime))
        }
       
    }
    
}
