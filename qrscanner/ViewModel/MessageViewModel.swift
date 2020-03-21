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
        return toMessage
    }
    
    var messageView: String {
        return message
    }
    
   
     var toMessage: String
   var message: String
  

    init(data: MessageModel) {
        self.toMessage = data.to!
        self.message = data.message!
    
     }
    
}
