//
//  TextViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TextViewModel : Codable , TextViewModelDelegate{
    
   
  var textTxtView: String{
         return textTxt
     }

     var textTxt: String
  
     init(text: String) {
         textTxt = text
     }
    
}
