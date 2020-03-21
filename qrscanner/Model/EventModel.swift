//
//  EventModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/9/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class EventModel : Codable {
    var title: String?
    var location: String?
    var description: String?
    var beginTime: String?
    var endTime: String?
    init(title: String,location: String,description: String,beginTime: String,endTime: String) {
        self.title = title
         self.location = location
         self.description = description
         self.beginTime = beginTime
      self.endTime = endTime
    }
}
