//
//  TranslationEntityModel.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class TranslationEntityModel  : Codable{
    var identify : String?
    var lang  : String?
    var translations : String?
    init(key : String, data : String) {
         let mIdentify = UUID().uuidString + "-" + String(Date().getCurrentTimeUnix())
        self.identify = mIdentify
        self.lang = key
        self.translations = data
    }
    init(identify : String,lang : String,translations : String) {
        self.identify = identify
        self.lang = lang
        self.translations = translations
    }
}
