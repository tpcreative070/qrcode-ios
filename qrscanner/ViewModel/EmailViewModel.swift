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
        return email ?? ""
    }
    var subjectView : String{
        return objectEmail ?? ""
    }
    var messageView : String{
        return messageEmail ?? ""
    }

     var email: String?
   var messageEmail: String?
     var objectEmail: String?
    init(to: String, subject: String, message: String) {
        self.email = to
        self.messageEmail = message
        self.objectEmail = subject
     }
    init(data: EmailModel){
        self.email = data.email!
        self.messageEmail = data.messageEmail!
        self.objectEmail = data.objectEmail!
    }
    init() {
        
    }
    
}
