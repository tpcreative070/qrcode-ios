//
//  EmailModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class EmailModel : Codable {
    var email : String?
    var objectEmail : String?
    var messageEmail : String?
    init(email: String, objectEmail: String, messageEmail: String) {
        self.email = email
        self.objectEmail = objectEmail
        self.messageEmail = messageEmail
    }
}
