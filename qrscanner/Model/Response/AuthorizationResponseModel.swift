//
//  AuthorizationModelResponse.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class AuthorizationResponseModel : BaseResponseModel {
    var data: AuthoModel
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(AuthoModel.self, forKey: .data) ?? AuthoModel()
    try super.init(from: decoder)
    }
}
class AuthoModel : Decodable{
    var session_token : String?
    var refresh_token: String?
    private enum CodingKeys: String, CodingKey {
        case  session_token = "session_token"
        case refresh_token = "refresh_token"
    }
    init() {
        
    }
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        session_token = try container.decodeIfPresent(String.self, forKey: .session_token)
        refresh_token = try container.decodeIfPresent(String.self, forKey: .refresh_token)
        
    }
}
