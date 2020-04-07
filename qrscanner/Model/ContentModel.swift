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
           self.typeCode = EnumType.URL.rawValue
           self.content = JSONSerializerHelper.toJson(data)
       }
       init(data: TextModel) {
           self.content = JSONSerializerHelper.toJson(data)
           self.typeCode = EnumType.TEXT.rawValue
       }
       init(data: EmailModel) {
      
           self.typeCode = EnumType.EMAIL.rawValue
           self.content = JSONSerializerHelper.toJson(data)
       
       }
       init(data: ContactModel) {
           self.typeCode = EnumType.CONTACT.rawValue
           self.content = JSONSerializerHelper.toJson(data)
       }
   init(data: MessageModel) {
       self.typeCode = EnumType.MESSAGE.rawValue
       self.content = JSONSerializerHelper.toJson(data)
   }
    init(data: LocationModel) {
          self.typeCode = EnumType.LOCATION.rawValue
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: EventModel) {
          self.typeCode = EnumType.EVENT.rawValue
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: PhoneModel) {
          self.typeCode = EnumType.TELEPHONE.rawValue
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: WifiModel) {
          self.typeCode = EnumType.WIFI.rawValue
          self.content = JSONSerializerHelper.toJson(data)
      }
    init(data: BarcodeModel) {
             self.typeCode = EnumType.BARCODE.rawValue
             self.content = JSONSerializerHelper.toJson(data)
         }
    init(typeCode: String, content : String) {
        self.typeCode = typeCode
        self.content = content
    }
    init() {
          
      }
}
