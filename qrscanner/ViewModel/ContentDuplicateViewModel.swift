//
//  ContentDuplicateViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ContentDuplicateViewModel  : Codable ,ContentDuplicateViewModelDeletegate{
    var isCodeView: String{
        return isCode ?? ""
    }
    
    var typeCodeView: String{
        return typeCode ?? ""
    }
    
    var contentView: String{
        return content ?? ""
    }
    var typeCode : String?
    var content: String?
    var isCode: String?
    
    init(typeCode: String, content: String, isCode: String) {
        self.typeCode = typeCode
        self.content = content
    }
   
    init() {
    }
    
    
}
