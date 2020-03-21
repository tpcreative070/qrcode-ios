//
//  String+ToObject.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
extension String {
    func toObject<T : Codable>(value : T.Type) ->T? {
        do {
            guard let mData = self.toData() else {
                return nil
            }
            let f = try JSONDecoder().decode(value.self, from: mData)
            return f
        } catch {
            print(error)
        }
        return nil
    }

}
