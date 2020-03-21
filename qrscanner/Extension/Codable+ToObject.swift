//
//  Codable+ToObject.swift
//  qrscanner
//
//  Created by Mac10 on 3/13/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension Encodable {
    func get<T : Codable>(value : T.Type) ->T?{
        do{
            let jsonData = JSONSerializerHelper.toJson(self).data(using: .utf8)
            if let jsonDataValue = jsonData{
                return try JSONDecoder().decode(value.self, from: jsonDataValue)
            }
        }catch{
            Utils.logMessage(message: "Could not cast data")
        }
        return value as? T
    }
}
