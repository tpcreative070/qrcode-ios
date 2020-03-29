//
//  PhoneModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class PhoneModel : Codable{
    var phone : String?
    init(phone: String) {
        self.phone = phone
    }
    init(){
        
    }
}
