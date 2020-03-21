//
//  TypeCodeEntityModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TypeCodeModel  : Codable{
    var identify : Int?
    var name  : String?
    var iconImage : String?
    init(identify : Int, name : String, icon : String) {
        self.identify = identify
        self.name =  name;
        self.iconImage = icon
    }
    
    
    
 
    init() {}
 
}
