//
//  TrackModelResponse.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class TrackResponseModel: BaseResponseModel {
       var data: TrackInfoModel?
    private enum CodingKeys: String, CodingKey {
        case data = "data"
       }
       
       required public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(TrackInfoModel.self, forKey: .data)
         try super.init(from: decoder)
       }
}
class TrackInfoModel : Decodable {
    var _id: String?
    var device_id : String?
    var user_id: String?
    var device_type: String?
    var channel_code: String?
    var channel_name: String?
    var manufacturer: String?
    var name_model: String?
    var version: String?
    var versionRelease: String?
    var appVersionRelease: String?
    var country: String?
    var region: String?
    var app_id: String?
    var created_date: String?
    var updated_date: String?
    var date_time: String?
    var __v: Int?
    private enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case device_id = "device_id"
        case user_id = "user_id"
        case device_type = "device_type"
        case channel_code = "channel_code"
        case channel_name = "channel_name"
        case manufacturer = "manufacturer"
        case name_model = "name_model"
        case version = "version"
        case versionRelease = "versionRelease"
        case appVersionRelease = "appVersionRelease"
        case country = "country"
        case region = "region"
        case app_id = "app_id"
        case created_date = "created_date"
        case updated_date = "updated_date"
        case date_time = "date_time"
        case __v = "__v"
    }
    init() {
        
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decodeIfPresent(String.self, forKey: ._id)
        device_id = try container.decodeIfPresent(String.self, forKey: .device_id)
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id)
        device_type = try container.decodeIfPresent(String.self, forKey: .device_type)
        channel_code = try container.decodeIfPresent(String.self, forKey: .channel_code)
        channel_name = try container.decodeIfPresent(String.self, forKey: .channel_name)
        name_model = try container.decodeIfPresent(String.self, forKey: .name_model)
        version = try container.decodeIfPresent(String.self, forKey: .version)
        versionRelease = try container.decodeIfPresent(String.self, forKey: .versionRelease)
        appVersionRelease = try container.decodeIfPresent(String.self, forKey: .appVersionRelease)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        device_type = try container.decodeIfPresent(String.self, forKey: .device_type)
        created_date = try container.decodeIfPresent(String.self, forKey: .created_date)
        updated_date = try container.decodeIfPresent(String.self, forKey: .updated_date)
        date_time = try container.decodeIfPresent(String.self, forKey: .date_time)
        __v = try container.decodeIfPresent(Int.self, forKey: .__v)
    }
}
