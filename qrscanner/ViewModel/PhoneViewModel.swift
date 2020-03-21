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
         return phoneTxt
     }

     var phoneTxt: String
  
     init(text: String) {
         phoneTxt = text
     }
    
}
