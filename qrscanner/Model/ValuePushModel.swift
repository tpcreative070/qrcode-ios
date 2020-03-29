//
//  ValuePushModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ValuePushModel : Codable {
    var createDateTime: Int?
    var typeCode: String?
    var isSeen: Int?
    var isUpdate: Int?
    init(createDateTime: Int, typeCode : String, isSeen : Int, isUpdate : Int) {
        self.createDateTime = createDateTime
        self.typeCode = typeCode
        self.isSeen = isSeen
        self.isUpdate = isUpdate
    }
    init(){}
}
