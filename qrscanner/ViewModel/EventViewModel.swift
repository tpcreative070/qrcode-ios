//
//  EventViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//


import Foundation
import UIKit
class EventViewModel : Codable , EventViewModelDelegate{
    var titleView: String {
        return title ?? ""
    }
    
    var locationView: String{
        return location ?? ""
    }
    
    var descriptionView: String{
        return description ?? ""
    }
    
    var beginView: String{
        return beginTime ?? ""
    }
    
    var endView: String{
        return endTime ?? ""
    }
    var title : String?
    var location: String?
    var description: String?
    var beginTime: String?
    var endTime: String?
   var createDateTime: Int?
       var typeCode : String?
       var isSeen : Int? = 0
       var isUpdate: Int?
    init(data: EventModel) {
        self.title = data.title!
        self.location = data.location!
        self.description = data.description!
        self.beginTime = data.beginTime!
        self.endTime = data.endTime!
    }
   init(data: ValuePushModel) {
                     self.createDateTime = data.createDateTime
                     self.typeCode = data.typeCode
                     self.isSeen = data.isSeen
                  self.isUpdate = data.isUpdate
                 }
    init() {    }
    
}
