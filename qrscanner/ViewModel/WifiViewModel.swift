//
//  EmailViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class WifiViewModel : Codable , WifiViewModelDelegate{
    var networkView: String{
        return protect ?? ""
    }
    var ssidView : String {
        return ssid ?? ""
    }
    var passwordView : String{
        return password ?? ""
    }
    var hiddenView : Bool{
        return hidden ?? false
    }
    var ssid: String?
    var hidden: Bool?
    var password: String?
    var protect: String?
    
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    init(ssid: String, hidden: Bool, protect: String, network: String) {
        self.ssid = ssid
        self.hidden = hidden
        self.password = protect
        self.protect = network
    }
    init(data : WifiModel) {
        self.ssid = data.ssid ?? ""
        self.hidden = data.hidden
        self.password = data.password ?? ""
        self.protect = data.protect ?? ""
    }
    init(data: ValuePushModel) {
        self.createDateTime = data.createDateTime
        self.typeCode = data.typeCode
        self.isSeen = data.isSeen
        self.isUpdate = data.isUpdate
    }
    init() {
        
    }
}
