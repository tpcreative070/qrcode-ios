//
//  UrlModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class UrlModel : Codable {
    var url : String?
    init() {
        
    }
    init(url: String) {
        self.url = url
    }
}
