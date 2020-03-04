//
//  HistoryEntityModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
struct ScannerEntityModel : Codable{
    var createdDateTime : String?
    var typeCode : String?
    var content : String?
    var isHistory : Int?
    var isSave : Int?
    var url : String?
    var text : String?
    var productId : String?
    var ISBN : String?
    var phone : String?
    var email : String?
    var object : String?
    var message : String?
    var latitude : String?
    var longtitude : String?
    var query : String?
    var title : String?
    var location : String?
    var description : String?
    var startEvent : String?
    var endEvent : String?
    var fullName : String?
    var address : String?
    var SSID : String?
    var password : String?
    var networkEncryption : String?
    var updatedDateTime : String?
    /*Type URL*/
       init(data : ScannerViewModel) {
         let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSaveContact)
        self.createdDateTime = data.createdDateTime
         self.typeCode = data.typeCode 
         self.url = data.content
        self.updatedDateTime = data.updateDateView
     }
    init(createdDateTime : String, typeCode : String, content : String, isHistory : Int, isSave : Int, updateDateTime: String) {
        self.createdDateTime = createdDateTime
         self.typeCode = typeCode
         self.content = content
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = updateDateTime
    }

}
