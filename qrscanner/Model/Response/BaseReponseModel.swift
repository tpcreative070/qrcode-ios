//
//  BaseReponseModel.swift
//  vietlifetravel
//
//  Created by Mac10 on 7/3/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import Foundation
class BaseResponseModel : Decodable{
    var error: Bool?
    var responseCode : Int?
    var responseMessage : String?
    private enum CodingKeys: String, CodingKey {
        case error = "error"
        case responseCode  = "responseCode"
        case responseMessage = "responseMessage"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
         error = try container.decodeIfPresent(Bool.self, forKey: .error)
        responseCode = try container.decodeIfPresent(Int.self, forKey : .responseCode)
        responseMessage = try container.decodeIfPresent(String.self, forKey : .responseMessage)
        if let mResponseCode = responseCode {
            if String(mResponseCode) == EnumResponseCode.SESSION_NOT_EXISTED.rawValue {
                 NotificationCenter.default.post(name: .didRecieveUnauthorized, object: nil)
                 debugPrint("SESSION_NOT_EXISTED....")
            }
        }
    }
}
