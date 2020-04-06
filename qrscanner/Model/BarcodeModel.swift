//
//  BarcodeViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 4/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class BarcodeModel : Codable {
    var barcodetype : String?
    var productID : String?
    
    init() {
        
    }
    init(productID: String, type: String) {
        self.productID = productID
        self.barcodetype = type
    }
}
