//
//  ContactViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
class LocationViewModel : Codable , LocationViewModelDelegate{
    var latView: String{return latitude ?? "0"}
    
    var longView: String{return longtitude ?? "0"}
    
    var queryView: String{return query ?? ""}
    
   
     var latitude: String?
   var longtitude: String?
     var query: String?

    init(data: LocationModel) {
        self.latitude = String(data.latitude!)
        self.longtitude = String(data.longtitude!)
        self.query = data.query!
     }
    init() {
        
    }
    
}
