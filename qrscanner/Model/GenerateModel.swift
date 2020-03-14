//
//  GenerateModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class GenerateModel : Codable {
    var createdDateTime : Int64?
    var typeCode : String?
    var content: String?
    var isHistory: Bool?
    var isSave: Bool?
    var updatedDateTime: Int64?
    var bookMark: Bool?
    init(data: UrlModel, typeCode : String, isHistory : Bool, isSave : Bool, bookMark: Bool) {
    let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = data.url
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
    }
    init(data: TextModel, typeCode : String, isHistory : Bool, isSave : Bool, bookMark: Bool) {
    let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = data.text
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
    }
    init(data: EmailModel, typeCode : String, isHistory : Bool, isSave : Bool, bookMark: Bool) {
    let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = "\(data.email ?? ""),\(data.messageEmail ?? ""),\(data.objectEmail ?? "")"
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
    }
    init(data: ContactModel, typeCode : String, isHistory : Bool, isSave : Bool, bookMark: Bool) {
    let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = "\(data.fullNameContact ?? ""),\(data.addressContact ?? ""),\(data.phoneContact ?? ""),\(data.emailContact ?? "")"
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
    }
    init(typeCode : String, content : String, isHistory : Bool, isSave : Bool, bookMark: Bool) {
        let time = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.createdDateTime = Int64(time)
        self.typeCode = typeCode
        self.content = content
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(time)
        self.bookMark = bookMark
    }
    init(createdDateTime: Int,typeCode : String, content : String, isHistory : Bool, isSave : Bool, updatedDateTime: Int, bookMark: Bool) {
        self.createdDateTime = Int64(createdDateTime)
        self.typeCode = typeCode
        self.content = content
        self.isHistory = isHistory
        self.isSave = isSave
        self.updatedDateTime = Int64(updatedDateTime)
        self.bookMark = bookMark
    }
}
