//
//  HistoryEntityModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ContentModel : Codable {
 
    var typeCode : String?
    var content: String?
    
    init(data: UrlModel) {
        self.typeCode = "url"
        self.content = JSONSerializerHelper.toJson(data)
    }
    init(data: TextModel) {
        self.content = JSONSerializerHelper.toJson(data)
        self.typeCode = "text"
    }
    init(data: EmailModel) {
   
        self.typeCode = "email"
        self.content = JSONSerializerHelper.toJson(data)
    
    }
    init(data: ContactModel) {
        self.typeCode = "contact"
        self.content = JSONSerializerHelper.toJson(data)
    }
   init(data: MessageModel) {
       self.typeCode = "message"
       self.content = JSONSerializerHelper.toJson(data)
   }
    init(data: LocationModel) {
          self.typeCode = "location"
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: EventModel) {
          self.typeCode = "event"
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: PhoneModel) {
          self.typeCode = "phone"
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: WifiModel) {
          self.typeCode = "wifi"
          self.content = JSONSerializerHelper.toJson(data)
      }
    init() {
          
      }
}
