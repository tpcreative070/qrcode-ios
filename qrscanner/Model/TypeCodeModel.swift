//
//  TypeCodeEntityModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TypeCodeModel  : Codable{
    var nameView : String{
        return name ?? ""
    }
    var identify : Int?
    var name  : String?
    var iconImage : String?
    var description : String?
    init(identify : Int, name : String, icon : String, description : String) {
        self.identify = identify
        self.name =  name;
        self.iconImage = icon
        self.description = description
    }
    
    
    
 
    init() {}
 
}
