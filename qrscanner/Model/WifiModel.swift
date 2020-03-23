//
//  WifiModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class WifiModel : Codable {
    var ssid: String?
    var password: String?
    var protect: String?
    var hidden : Bool = false
    init(ssid: String, password: String, protect: String) {
        self.ssid = ssid
         self.protect = protect
         self.password = password
      
    }
    init(){}
}
