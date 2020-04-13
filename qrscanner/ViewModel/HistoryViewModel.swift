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
        return getValueContent(typeCode: typeCode, content: content) ?? ""
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
        self.createdDateTime = Int(data.createdDateTime!)
        self.updatedDateTime = Int(data.updatedDateTime!)
        self.isHistory = data.isHistory!
        self.isSave = data.isSave!
        self.bookMark = data.bookMark!
        if typeCode == EnumType.URL.rawValue{
            self.content = ContentViewModel(data :(data.content?.toObject(value: UrlModel.self))!)
        }
        else if typeCode == EnumType.TEXT.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: TextModel.self))!)
        }
        else if typeCode == EnumType.LOCATION.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: LocationModel.self))!)
        }
        else if typeCode == EnumType.EMAIL.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: EmailModel.self))!)
        }
        else if typeCode == EnumType.EVENT.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: EventModel.self))!)
        }
        else if typeCode == EnumType.MESSAGE.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: MessageModel.self))!)
        }
        else if typeCode == EnumType.WIFI.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: WifiModel.self))!)
        }
        else if typeCode == EnumType.TELEPHONE.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: PhoneModel.self))!)
        }
        else if typeCode == EnumType.CONTACT.rawValue{
            self.content = ContentViewModel(data: (data.content?.toObject(value: ContactModel.self))!)
        }
        else if typeCode == EnumType.BARCODE.rawValue{
                   self.content = ContentViewModel(data: (data.content?.toObject(value: BarcodeModel.self))!)
               }

    }
    func getValueContent(typeCode: String, content: ContentViewModel) -> String? {
        if typeCode == EnumType.URL.rawValue{
                   let stringContent = content.content?.data(using: .utf8 )
                   let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent!)
                    return urlModel.url ?? ""
               }
               else if typeCode == EnumType.TEXT.rawValue{
                   let stringContent = content.content?.data(using: .utf8 )
                   let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent!)
            return textModel.text ?? ""
               }
               else if typeCode == EnumType.LOCATION.rawValue{
                   let stringContent = content.content?.data(using: .utf8 )
                   let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent!)
                    return "\(locationModel.latitude ?? 0),\(locationModel.longtitude ?? 0),(\(locationModel.query ?? ""))"
               }
               else if typeCode == EnumType.EMAIL.rawValue{
                   let stringContent = content.content?.data(using: .utf8 )
                   let emailModel : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent!)
                return emailModel.email ?? ""
               }
               else if typeCode == EnumType.EVENT.rawValue{
                   

                   let stringContent = content.content?.data(using: .utf8 )
                   let eventModel : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent!)
               return eventModel.title ?? ""
                   
               }
               else if typeCode == EnumType.MESSAGE.rawValue{
                   

                   let stringContent = content.content?.data(using: .utf8 )
                   let messageModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent!)
             return messageModel.message ?? ""
               }
               else if typeCode == EnumType.WIFI.rawValue{
                   
                   let stringContent = content.content?.data(using: .utf8 )
                   let wifiModel : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent!)
                return wifiModel.ssid ?? ""
               }
               else if typeCode == EnumType.TELEPHONE.rawValue{
                   

                   let stringContent = content.content?.data(using: .utf8 )
                   let phoneModel : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent!)
                return phoneModel.phone ?? ""
               }
               else if typeCode == EnumType.CONTACT.rawValue{
                   let stringContent = content.content?.data(using: .utf8 )
                   let contactModel : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent!)
                return contactModel.fullNameContact ?? ""
               }
            else if typeCode == EnumType.BARCODE.rawValue{
                              let stringContent = content.content?.data(using: .utf8 )
                              let contactModel : BarcodeModel = try! JSONDecoder().decode(BarcodeModel.self, from: stringContent!)
            return contactModel.productID ?? ""
                          }
        else{
            return "No value"
        }
    }
    
}

