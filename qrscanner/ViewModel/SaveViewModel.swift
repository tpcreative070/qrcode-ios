//
//  SaveViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/19/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class SaveViewModel  : Codable ,GenerateViewModelDeletegate{
    
    var checkShowView: Bool?{
        return check
    }
    
    var contentView: String {
        return ""
    }
    
    
    
    
    var isHistoryView: Bool
    {
        return isHistory
    }
    
    var isSaveView: Bool{
        return isSave
    }
    
    var isHistory: Bool
    var isSave: Bool
    var typeCode: String
    var bookMark : Bool
    var content = ContentModel()
    var createdDateTime : String
    var updatedDateTime: String
   var check : Bool = false
    var typeCodeView: String {
        return typeCode
    }
    
    var updatedDateTimeView : String
    {
        return updatedDateTime
    }
    var createdDateTimeView: String {
        return createdDateTime
    }
    
    init(data : GenerateEntityModel) {
        let date_create = TimeHelper.getTimeSince1970(time:Int(data.createdDateTime!))
        let date_update = TimeHelper.getTimeSince1970(time:Int(data.updatedDateTime!))
        self.typeCode = data.typeCode?.uppercased() ?? ""
        self.createdDateTime = date_create
        self.updatedDateTime = date_update
        self.isHistory = data.isHistory!
        self.isSave = data.isSave!
        self.bookMark = data.bookMark!
        //  self.content = data.content!
        print(data.content!)
        // self.content = (data.content?.toObject(value: GenerateModel.self))!
        //   let typeCode = data.typeCode?.uppercased()
        if typeCode == LanguageKey.Url{
            //            let blogPost: UrlModel = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            //            self.contents = blogPost.url ?? ""
            //            let content = UrlModel()
            // let url : UrlModel =   (data.content?.toObject(value: UrlModel.self))!
            self.content = ContentModel(data :(data.content?.toObject(value: UrlModel.self))!)
        }
        //
              else if typeCode == LanguageKey.Text{
                 self.content = ContentModel(data: (data.content?.toObject(value: TextModel.self))!)
           }
                else if typeCode == LanguageKey.Location{
                    self.content = ContentModel(data: (data.content?.toObject(value: LocationModel.self))!)
                }
                else if typeCode == LanguageKey.Email{
                     self.content = ContentModel(data: (data.content?.toObject(value: EmailModel.self))!)
                }
                else if typeCode == LanguageKey.Event{
                 
                      self.content = ContentModel(data: (data.content?.toObject(value: EventModel.self))!)
                }
                else if typeCode == LanguageKey.Message{
                    
                    self.content = ContentModel(data: (data.content?.toObject(value: MessageModel.self))!)
                }
                else if typeCode == LanguageKey.Wifi{
        
                    self.content = ContentModel(data: (data.content?.toObject(value: WifiModel.self))!)
                  
                }
                else if typeCode == LanguageKey.Telephone{
        
                    self.content = ContentModel(data: (data.content?.toObject(value: PhoneModel.self))!)
                }
                else if typeCode == LanguageKey.Contact{
        
                    self.content = ContentModel(data: (data.content?.toObject(value: ContactModel.self))!)
                   
                }
        //        else
        //        {
        //
        //            self.content = ""
        //            self.contents = ""
        //        }
    }
    
}

