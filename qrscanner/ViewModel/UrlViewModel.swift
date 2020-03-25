//
//  UrlModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class UrlViewModel : Codable , UrlViewModelDelegate{
    
    
    var urlTxtView: String{
        return url ?? ""
    }
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    
    var url: String?
    
    init(url: String) {
        self.url = url
    }
    init() {
        
    }
    
    init(data: ValuePushModel) {
        self.createDateTime = data.createDateTime
        self.typeCode = data.typeCode
        self.isSeen = data.isSeen
        self.isUpdate = data.isUpdate
    }
}
