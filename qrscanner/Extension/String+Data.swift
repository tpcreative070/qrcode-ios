//
//  String+Data.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
extension String {
    func toData() -> Data?{
        return self.data(using: .utf8)
    }
}
