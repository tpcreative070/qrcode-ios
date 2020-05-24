//
//  HistoryViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/19/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class SaveViewModel  : Codable ,GenerateViewModelDeletegate{
    
    
    var checkShowView: Bool? {
        return check
    }
    var contentView: String {
        return QRCodeHelper.shared.getValueContent(typeCode: typeCode, content: content) ?? ""
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
    var content = ContentViewModel()
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
        self.typeCode = data.typeCode?.uppercased() ?? ""
        self.createdDateTime = Int(data.createdDateTime ?? 0)
        self.updatedDateTime = Int(data.updatedDateTime ?? 0)
        self.isHistory = data.isHistory ?? false
        self.isSave = data.isSave ?? false
        self.bookMark = data.bookMark ?? false
        if typeCode == EnumType.URL.rawValue{
            guard let url = (data.content?.toObject(value: UrlModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: url)
        }
        else if typeCode == EnumType.TEXT.rawValue{
            guard let text = (data.content?.toObject(value: TextModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: text)
            
        }
        else if typeCode == EnumType.LOCATION.rawValue{
            guard let location = (data.content?.toObject(value: LocationModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: location)
        }
        else if typeCode == EnumType.EMAIL.rawValue{
            guard let email = (data.content?.toObject(value: EmailModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: email)
        }
        else if typeCode == EnumType.EVENT.rawValue{
            guard let event = (data.content?.toObject(value: EventModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: event)
        }
        else if typeCode == EnumType.MESSAGE.rawValue{
            guard let mess = (data.content?.toObject(value: MessageModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: mess)
        }
        else if typeCode == EnumType.WIFI.rawValue{
            guard let wifi = (data.content?.toObject(value: WifiModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: wifi)
        }
        else if typeCode == EnumType.TELEPHONE.rawValue{
            guard let phone = (data.content?.toObject(value: PhoneModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: phone)
        }
        else if typeCode == EnumType.CONTACT.rawValue{
            guard let contact = (data.content?.toObject(value: ContactModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: contact)
        }
        else if typeCode == EnumType.BARCODE.rawValue{
            guard let barcode = (data.content?.toObject(value: BarcodeModel.self)) else {
                return
            }
            self.content = ContentViewModel(data: barcode)
        }
    }
   
    
}

