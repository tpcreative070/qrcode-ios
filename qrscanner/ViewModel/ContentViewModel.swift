//
//  ContentViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ContentViewModel  : Codable ,ContentViewModelDeletegate{
    var typeCodeView: String{
        return typeCode ?? ""
    }
    
    var contentView: String{
        return content ?? ""
    }
    var typeCode : String?
    var content: String?
    init(data: ContentModel) {
        self.typeCode = data.typeCode
        self.content = data.content
    }
    init() {
        
    }
    
    
}
