//
//  HistoryViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/19/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class HistoryViewModel  : Codable ,GenerateViewModelDeletegate{
    
    
    var checkShowView: Bool? {
        return check
    }
    var contentView: String {
        return QRCodeHelper.shared.getValueContent1(typeCode: typeCode, data: content!) ?? ""
    }
    
    var isHistoryView: Bool
    {
        return isHistory
    }
    
    var isSaveView: Bool{
        return isSave
    }
    var valueShowContent : String?
    var isHistory: Bool
    var isSave: Bool
    var typeCode: String
    var bookMark : Bool
    var content: String?
    var createdDateTime : Int
    var updatedDateTime: Int
    var check : Bool = false
    
    var typeCodeView: String {
        return typeCode
    }
    
    var updatedDateTimeView : String
    {
        return TimeHelper.getTimeSince1970(time:Int(updatedDateTime))
    }
    var createdDateTimeView: String {
        return TimeHelper.getTimeSince1970(time:Int(createdDateTime))
    }
    
    init(data : GenerateEntityModel) {
        print("content list his: \(data.content!)")
        self.typeCode = data.typeCode?.uppercased() ?? ""
        self.createdDateTime = Int(data.createdDateTime ?? 0)
        self.updatedDateTime = Int(data.updatedDateTime ?? 0)
        self.isHistory = data.isHistory ?? false
        self.isSave = data.isSave ?? false
        self.bookMark = data.bookMark ?? false
        self.content = data.content ?? ""
    }
   
}

