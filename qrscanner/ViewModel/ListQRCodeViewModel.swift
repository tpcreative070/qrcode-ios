//
//  URLScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ListQRCodeViewModel  : Codable ,QRCodeViewModelDeletegate{
  var checkShowView: Bool {
     return check
  }
    var isHistoryView: Bool
    {
        return isHistory
    }
    
    var isSaveView: Bool{
        return isSave
    }
    var check : Bool = false

    var isHistory: Bool
    var isSave: Bool
    var typeCode: String
    var content: String
    var contents: String
    var bookMark : Bool
    var createdDateTime : String
    var updatedDateTime: String
    var typeCodeView: String {
        return typeCode
    }
    var contentView: String {
        return content
    }
    var updatedDateTimeView : String
    {
        return updatedDateTime
    }
    var createdDateTimeView: String {
        return createdDateTime
    }
   
    init(data : GenerateModel) {
        let date_create = TimeHelper.getTimeSince1970(time:Int(data.createdDateTime!))
        let date_update = TimeHelper.getTimeSince1970(time:Int(data.updatedDateTime!))

        self.typeCode = data.typeCode?.uppercased() ?? ""
        
        self.createdDateTime = date_create
        self.updatedDateTime = date_update
        self.isHistory = data.isHistory!
        self.isSave = data.isSave!
        self.bookMark = data.bookMark!
        self.contents = ""
        print(data.content!)
        let content = data.content!
        let typeCode = data.typeCode?.uppercased()
      let jsonData = content.data(using: .utf8)!
        if typeCode == LanguageKey.Url{
            let blogPost: UrlModel = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            self.contents = blogPost.url ?? ""
            self.content = blogPost.url ?? ""
        }
        
        else if typeCode == LanguageKey.Text{
            let blogPost: TextModel = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            self.content = blogPost.text ?? ""
            self.contents = "[text:\(blogPost.text ?? "")]"
        }
        else if typeCode == LanguageKey.Location{
            let blogPost: LocationModel = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            self.content = "[lat:\(blogPost.latitude!),lon:\(blogPost.longtitude!),query:\(blogPost.query!)]"
        }
        else if typeCode == LanguageKey.Email{
            let blogPost: EmailModel = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
             self.content = blogPost.email ?? ""
           
self.contents = "[email:\(blogPost.email ?? ""),objectEmail:\(blogPost.objectEmail ?? ""),messageEmail:\(blogPost.messageEmail ?? "")]"
        }
        else if typeCode == LanguageKey.Event{
            let blogPost: EventModel = try! JSONDecoder().decode(EventModel.self, from: jsonData)
                 self.content = blogPost.title ?? ""
              self.contents = "[title:\(blogPost.title ?? ""),location:\(blogPost.location ?? ""),description:\(blogPost.description ?? ""),beginTime:\(blogPost.beginTime!),endTime:\(blogPost.endTime!)]"
        }
        else if typeCode == LanguageKey.Message{
            let blogPost: MessageModel = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
             self.content = blogPost.message ?? ""
            self.contents = "[to:\(blogPost.to ?? ""),message:\(blogPost.message ?? "")]"
        }
        else if typeCode == LanguageKey.Wifi{
            let blogPost: WifiModel = try! JSONDecoder().decode(WifiModel.self, from: jsonData)

            self.content = blogPost.ssid ?? ""
            self.contents = "[ssid:\(blogPost.ssid ?? ""),password:\(blogPost.password ?? ""),protect:\(blogPost.protect ?? "")]"
        }
        else if typeCode == LanguageKey.Telephone{
            let blogPost: PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)

            self.content = blogPost.phone ?? ""
            self.contents = "[phone:\(blogPost.phone ?? "")]"
        }
        else if typeCode == LanguageKey.Contact{
            let blogPost: ContactModel = try! JSONDecoder().decode(ContactModel.self, from: jsonData)

            self.content = blogPost.fullNameContact ?? ""
            self.contents = "[fullNameContact:\(blogPost.fullNameContact ?? ""),addressContact:\(blogPost.addressContact ?? ""),phoneContact:\(blogPost.phoneContact ?? ""),emailContact:\(blogPost.emailContact ?? "")]"
        }
        else
        {

            self.content = ""
            self.contents = ""
        }
    }
    

}
