//
//  GenerateModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class GenerateEntityModel : Codable {
    var createdDateTime : Int64?
    var typeCode : String?
    var content: String?
    var isHistory: Bool?
    var isSave: Bool?
    var updatedDateTime: Int64?
    var bookMark: Bool?
    var transactionID: String?
    var isCode: String?

    init(data: UrlModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.URL.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
    }
    init(data: TextModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.content = JSONSerializerHelper.toJson(data)
        self.typeCode = EnumType.TEXT.rawValue
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
    }
    init(data: EmailModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.EMAIL.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: ContactModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.CONTACT.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
    }
    init(data: MessageModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.MESSAGE.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: LocationModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.LOCATION.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: EventModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.EVENT.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: PhoneModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.TELEPHONE.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: WifiModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.WIFI.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
        
    }
    init(data: BarcodeModel, isCode: String, isHistory : Bool, isSave: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)

        self.typeCode = EnumType.BARCODE.rawValue
        self.content = JSONSerializerHelper.toJson(data)
        self.isCode = isCode
        self.createdDateTime = Int64(time)
        self.updatedDateTime = Int64(time)
        self.isHistory = isHistory
        self.isSave = isSave
    }
    init(typeCode : String, content : String, isHistory : Bool, isSave : Bool, bookMark: Bool, transactionID : String, isCode : String) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = content
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
        self.transactionID = transactionID
        self.isCode = isCode
    }
    init(createdDateTime: Int,typeCode : String, content : String, isHistory : Bool, isSave : Bool, updatedDateTime: Int, bookMark: Bool, transactionID: String, isCode: String) {
        self.createdDateTime = Int64(createdDateTime)
        self.typeCode = typeCode
        self.content = content
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(updatedDateTime)
        self.bookMark = bookMark
        self.transactionID = transactionID
        self.isCode = isCode
    }
    init() {
        
    }
}
