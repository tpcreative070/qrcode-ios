//
//  UrlModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class UrlViewModel : Codable , UrlViewModelDelegate{
    
   
  
    var urlTxtView: String{
        return urlTxt 
    }
 
  
    var urlTxt: String
 
    init(url: String) {
        urlTxt = url
    }

    
}
