//
//  URLScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ScannerViewModel  : Codable ,ScannerViewModelDeletegate{
    
    var isHistory: Int
    var isSave: Int
    var typeCode: String
    var content: String
    var createdDateTime : String
    var updatedDateTime: String
    var typeCodeView: String {
        return typeCode
    }
    var contentView: String {
        return content
    }
    var updateDateView : String
    {
        return updatedDateTime
    }
    var createDateView: String {
        return createdDateTime
    }
   
     
    init(data : ScannerEntityModel) {
        self.typeCode = data.typeCode?.uppercased() ?? ""
        self.content = data.content ?? ""
        self.createdDateTime = data.createdDateTime ?? ""
        self.updatedDateTime = data.updatedDateTime ?? ""
        self.isHistory = data.isHistory ?? 0
        self.isSave = data.isSave ?? 0
    }
    
  
}
