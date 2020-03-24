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
        return network ?? ""
    }
    var ssidView : String {
        return ssid ?? ""
    }
    var passwordView : String{
        return protect ?? ""
    }
    var hiddenView : Bool{
        return hidden ?? false
    }
    var ssid: String?
    var hidden: Bool?
    var protect: String?
    var network: String?
    
    init(ssid: String, hidden: Bool, protect: String, network: String) {
        self.ssid = ssid
        self.hidden = hidden
        self.protect = protect
        self.network = network
    }
    init(data : WifiModel) {
        self.ssid = data.ssid ?? ""
        self.hidden = data.hidden
        self.protect = data.password ?? ""
        self.network = data.protect ?? ""
    }
    init() {
        
    }
}
