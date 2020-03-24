//
//  ContactViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
class ContactViewModel : Codable , ContactViewModelDelegate{
    var fullnameView: String{
        return fullNameContact ?? ""
    }
    
    var addressView: String{
        return addressContact ?? ""
    }
    
    var phoneView: String{
        return phoneContact ?? ""
    }
    
    var emailView: String{
        return emailContact ?? ""
    }
    
    
     var fullNameContact: String?
   var addressContact: String?
     var phoneContact: String?
    var emailContact: String?

    init(data: ContactModel) {
        self.fullNameContact = data.fullNameContact!
        self.addressContact = data.addressContact!
        self.phoneContact = data.phoneContact!
        self.emailContact = data.emailContact!
     }
    init() {}
    
}
