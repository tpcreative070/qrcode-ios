//
//  MessageViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
class MessageViewModel : Codable , MessageViewModelDelegate{
    var toView: String {
        return to ?? ""
    }
    
    var messageView: String {
        return message ?? ""
    }
    var to: String?
    var message: String?
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    
    init(data: MessageModel) {
        self.to = data.to!
        self.message = data.message!
        
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
