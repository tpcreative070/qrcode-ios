//
//  TrackModelRequest.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class TrackRequestModel : Codable{
    var user_id: String?
    var device_id: String?
    var device_type: String?
    var manufacturer: String?
    var name_model: String?
    var version: String?
    var versionRelease: String?
    var appVersionRelease: String?
    var app_id: String?
    var channel_code: String?
    init(user_id: String, device_id: String, device_type: String, manufacturer: String, name_model: String, version: String, versionRelease: String, appVersionRelease: String, app_id: String, channel_code : String) {
        self.user_id = user_id
        self.device_id = device_id
        self.device_type = device_type
        self.manufacturer = manufacturer
        self.name_model = name_model
        self.version = version
        self.versionRelease = versionRelease
        self.appVersionRelease = appVersionRelease
        self.app_id = app_id
        self.channel_code = channel_code
        self.channel_code = channel_code
    }
    init() {
        
    }
}
