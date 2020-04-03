//
//  ListQRCodeViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class QRCodeViewModel : Codable , QRCodeViewModelDelegate{
    var imgCodeView: String{
        return imgCode ?? ""
    }
    var typeCodeView: Int{
        return typeCode ?? 0
    }

    var checkShowView: Bool?{
        return check
    }
    var dateTime : String?
    var imgCode : String?
    var stringCode: String?
    var check : Bool = false
    var typeCode: Int?
    var identify : Int?
    init(identify: Int,imgCode : String, stringCode: String, typeCode: Int, check : Bool, dateTime: String) {
        self.identify = identify
        self.imgCode = imgCode
        self.check = check
        self.typeCode = typeCode
        self.stringCode = stringCode
        self.dateTime = dateTime
    }
    init() {
        
    }
}
