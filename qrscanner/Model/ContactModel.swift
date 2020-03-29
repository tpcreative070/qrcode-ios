//
//  ContactModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ContactModel : Codable {
    var fullNameContact: String?
    var addressContact: String?
    var phoneContact: String?
    var emailContact: String?
    init(fullNameContact: String, addressContact: String, phoneContact: String, emailContact: String) {
        self.fullNameContact = fullNameContact
         self.addressContact = addressContact
         self.phoneContact = phoneContact
         self.emailContact = emailContact
      
    }
    init() {
        
    }
}
