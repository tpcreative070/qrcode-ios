//
//  ScannerModel.swift
//  qrscanner
//
//  Created by Mac10 on 4/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ScannerModel : Codable {
    var value : String?
    var typeScan : String?
    
    init() {
        
    }
    init(value: String, typeScan: String) {
        self.value = value
        self.typeScan = typeScan
    }
}
