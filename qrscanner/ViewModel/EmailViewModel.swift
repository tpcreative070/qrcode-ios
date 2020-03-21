//
//  EmailViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class EmailViewModel : Codable , EmailViewModelDelegate{
    
   
    var toTxtView : String {
        return to
    }
    var subjectView : String{
        return subject
    }
    var messageView : String{
        return message
    }

     var to: String
   var subject: String
     var message: String
    init(to: String, subject: String, message: String) {
        self.to = to
        self.message = message
        self.subject = subject
     }
    
}
