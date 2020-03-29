//
//  TextModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class TextModel : Codable {
    var text : String?
   
    init(text: String) {
        self.text = text
    }
    init() {
        
    }
}
