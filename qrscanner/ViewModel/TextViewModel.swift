//
//  TextViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TextViewModel : Codable , TextViewModelDelegate{
    
    
    var textTxtView: String{
        return text ?? ""
    }
    
    var text: String?
    
    init(text: String) {
        self.text = text
    }
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    init(data : TextModel) {
        self.text = data.text ?? ""
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
