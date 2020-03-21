//
//  LocationModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation

class LocationModel : Codable {
    var latitude: Float?
    var longtitude: Float?
    var query: String?
    init(latitude: Float, longtitude: Float, query: String) {
        self.latitude = latitude
         self.longtitude = longtitude
         self.query = query
    }
}
