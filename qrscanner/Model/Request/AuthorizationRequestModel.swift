//
//  AuthorizationModelRequest.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class AuthorizationModelRequest : Codable{
    var user_id: String?
    var refresh_token: String?
    var public_key : String?
    init(user_id: String, refresh_token: String, public_key: String ) {
        self.user_id = user_id
        self.refresh_token = refresh_token
        self.public_key = public_key
    }
    init() {
        
    }
}
