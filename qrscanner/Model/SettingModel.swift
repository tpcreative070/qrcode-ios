//
//  ValuePushModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class SettingModel : Codable {
    var isVibrate: Bool?
    var isBeep: Bool?
    var color: String?
    var isCopy: Bool?
    var isOpenWeb: Bool?

    init(isVibrate : Bool, isBeep: Bool, color: String, isCopy: Bool, isOpenWeb: Bool) {
        self.isVibrate = isVibrate
        self.isBeep = isBeep
        self.color = color
        self.isCopy = isCopy
        self.isOpenWeb = isOpenWeb
    }
   
    
    init(){}
}
