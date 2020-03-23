//
//  SaveViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/19/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class SaveViewModel  : Codable ,GenerateViewModelDeletegate{
    var checkShowView: Bool? {
          return check
      }
      var contentView: String {
          return valueShowContent
      }

      var isHistoryView: Bool
      {
          return isHistory
      }

      var isSaveView: Bool{
          return isSave
      }
      var valueShowContent = ""
      var isHistory: Bool
      var isSave: Bool
      var typeCode: String
      var bookMark : Bool
      var content = ContentModel()
      var createdDateTime : Int
      var updatedDateTime: Int
      var check : Bool = false

      var typeCodeView: String {
          return typeCode
      }
      
      var updatedDateTimeView : String
      {
          return TimeHelper.getTimeSince1970(time:Int(createdDateTime))
      }
      var createdDateTimeView: String {
          return TimeHelper.getTimeSince1970(time:Int(updatedDateTime))
      }
      
      init(data : GenerateEntityModel) {
          self.typeCode = data.typeCode?.uppercased() ?? ""
          self.createdDateTime = Int(data.createdDateTime!)
          self.updatedDateTime = Int(data.updatedDateTime!)
          self.isHistory = data.isHistory!
          self.isSave = data.isSave!
          self.bookMark = data.bookMark!
          if typeCode == LanguageKey.Url{
              self.content = ContentModel(data :(data.content?.toObject(value: UrlModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent!)
              valueShowContent = urlModel.url ?? ""
              
          }
          else if typeCode == LanguageKey.Text{
              self.content = ContentModel(data: (data.content?.toObject(value: TextModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent!)
              valueShowContent = textModel.text ?? ""
          }
          else if typeCode == LanguageKey.Location{
              self.content = ContentModel(data: (data.content?.toObject(value: LocationModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent!)
              valueShowContent = "\(locationModel.latitude ?? 0),\(locationModel.longtitude ?? 0),(\(locationModel.query ?? ""))"
          }
          else if typeCode == LanguageKey.Email{
              self.content = ContentModel(data: (data.content?.toObject(value: EmailModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let emailModel : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent!)
              valueShowContent = emailModel.email ?? ""
          }
          else if typeCode == LanguageKey.Event{
              
              self.content = ContentModel(data: (data.content?.toObject(value: EventModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let eventModel : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent!)
              valueShowContent = eventModel.title ?? ""
              
          }
          else if typeCode == LanguageKey.Message{
              
              self.content = ContentModel(data: (data.content?.toObject(value: MessageModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let messageModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent!)
              valueShowContent = messageModel.message ?? ""
          }
          else if typeCode == LanguageKey.Wifi{
              
              self.content = ContentModel(data: (data.content?.toObject(value: WifiModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let wifiModel : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent!)
              valueShowContent = wifiModel.ssid ?? ""
          }
          else if typeCode == LanguageKey.Telephone{
              
              self.content = ContentModel(data: (data.content?.toObject(value: PhoneModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let phoneModel : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent!)
              valueShowContent = phoneModel.phone ?? ""
          }
          else if typeCode == LanguageKey.Contact{
              
              self.content = ContentModel(data: (data.content?.toObject(value: ContactModel.self))!)
              let stringContent = content.content?.data(using: .utf8 )
              let contactModel : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent!)
              valueShowContent = contactModel.fullNameContact ?? ""
          }
        
      }
}

