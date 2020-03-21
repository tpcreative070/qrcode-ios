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
        return fullname
    }
    
    var addressView: String{
        return address
    }
    
    var phoneView: String{
        return phone
    }
    
    var emailView: String{
        return email
    }
    
    
     var fullname: String
   var address: String
     var phone: String
    var email: String

    init(data: ContactModel) {
        self.fullname = data.fullNameContact!
        self.address = data.addressContact!
        self.phone = data.phoneContact!
        self.email = data.emailContact!
     }
    
}
