//
//  PhoneViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class PhoneViewModel : Codable , PhoneViewModelDelegate{
    
   
  var phoneTxtView: String{
         return phone ?? ""
     }

     var phone: String?
  var createDateTime: Int?
     var typeCode : String?
     var isSeen : Int? = 0
     var isUpdate: Int?
     init(phone: PhoneModel) {
        self.phone = phone.phone ?? ""
     }
    init() {
        
    }
    init(data: ValuePushModel) {
              self.createDateTime = data.createDateTime
              self.typeCode = data.typeCode
              self.isSeen = data.isSeen
           self.isUpdate = data.isUpdate
          }
}
