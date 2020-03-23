//
//  MessageModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class MessageModel : Codable {
    var to : String?
    var message : String?
   
    init(to: String, message: String) {
        self.to = to
        self.message = message
    }
    init() {
        
    }
}
