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
  
     init(phone: PhoneModel) {
        self.phone = phone.phone ?? ""
     }
    init() {
        
    }
    
}
