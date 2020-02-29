//
//  ConfigurationStoreModel.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
struct ConfigurationStoreModel: Codable {
    var isAutoLogin: Bool
    var isUseDefault: Bool
    var serverUrl: String
    init(isAutoLogin: Bool, isUseDefault: Bool, serverUrl: String) {
        self.isAutoLogin = isAutoLogin
        self.isUseDefault = isUseDefault
        self.serverUrl = serverUrl
    }
}

