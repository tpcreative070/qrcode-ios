//
//  AuthorizationModel.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class AuthorizationModel : Codable{
    var session_token: String?
    var refresh_token: String?
    init(session_token: String, refresh_token: String) {
        self.session_token = session_token
        self.refresh_token = refresh_token
    }
    init(data: AuthoModel) {
        self.session_token = data.session_token
        self.refresh_token = data.refresh_token
    }
}
