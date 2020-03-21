//
//  EmailViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class WifiViewModel : Codable , WifiViewModelDelegate{
    
    
    
   
    var ssidView : String {
        return ssid
    }
    var passwordView : String{
        return protect
    }
    var hiddenView : String{
        return hidden
    }
    var networkView : String{
           return network
       }

     var ssid: String
   var hidden: String
     var protect: String
    var network: String

    init(ssid: String, hidden: String, protect: String, network: String) {
        self.ssid = ssid
        self.hidden = hidden
        self.protect = protect
        self.network = network
     }
    
}
