//
//  URLScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class QRCodeViewModel  : Codable ,QRCodeViewModelDeletegate{
  
    var isHistoryView: Int
    {
        return isHistory
    }
    
    var isSaveView: Int{
        return isSave
    }
    
    
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
    var updatedDateTimeView : String
    {
        return updatedDateTime
    }
    var createdDateTimeView: String {
        return createdDateTime
    }
   
     
    init(data : ScannerEntityModel) {
        self.typeCode = data.typeCode?.uppercased() ?? ""
        
        self.createdDateTime = data.createdDateTime ?? ""
        self.updatedDateTime = data.updatedDateTime ?? ""
        self.isHistory = data.isHistory ?? 0
        self.isSave = data.isSave ?? 0
        let content = data.content!
        let typeCode = data.typeCode?.uppercased()
      let jsonData = content.data(using: .utf8)!
      let blogPost: ScannerEntityModel = try! JSONDecoder().decode(ScannerEntityModel.self, from: jsonData)
        if typeCode == LanguageKey.Url{
            self.content = blogPost.url ?? ""
        }
        else if typeCode == LanguageKey.Text{
            self.content = blogPost.text ?? ""
        }
        else if typeCode == LanguageKey.Location{
            self.content = "\(blogPost.latitude!), \(blogPost.longtitude!) (\(blogPost.query!))"
        }
        else if typeCode == LanguageKey.Email{
             self.content = blogPost.email ?? ""
        }
        else if typeCode == LanguageKey.Event{
                 self.content = blogPost.title ?? ""
        }
        else if typeCode == LanguageKey.Message{
             self.content = blogPost.message ?? ""
        }
        else if typeCode == LanguageKey.Wifi{
             self.content = blogPost.SSID ?? ""
        }
        else if typeCode == LanguageKey.Telephone{
             self.content = blogPost.phoneNumber ?? ""
        }
        else if typeCode == LanguageKey.Contact{
             self.content = blogPost.fullName ?? ""
        }
        else
        {
            self.content = blogPost.content ?? ""
        }
    }
    
  
}
