//
//  TrackViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import KeychainSwift
class TrackViewModel{
    private let userService: UserService
    var authorvm = AuthorizationViewModel()
   
    init(userService: UserService = UserService()) {
        self.userService = userService
    }
    func getSyncDevice() {
        let bundleId = CommonService.getAppBundleId()
        let appVsRelease = CommonService.getAppVersionString()
        let info = DeviceHelper.getDeviceInfo()
        let model = DeviceHelper.getModelname()
        let systemVs = DeviceHelper.getSystemVersion()
        let systemName = DeviceHelper.getSystemName()
        let majorVs = String(DeviceHelper.getmajorVersion())
        let devi = TrackRequestModel(user_id: AppConstants.user_id, device_id: CommonService.getUniqueId(), device_type: systemName, manufacturer: model, name_model: info , version: majorVs, versionRelease: systemVs, appVersionRelease: appVsRelease, app_id: bundleId, channel_code: AppConstants.channel_code)
        userService.SyncDevice(data: devi, completion: { result  in
            switch result {
            case .success(let userResult):
                if let response = userResult{
                    if String(response.responseCode!) == EnumResponseCode.UNAUTHORIZED.rawValue {
                        self.authorvm.getToken()
                    }
                }
                break
            case .failure( let error ):
                Utils.logMessage(object: error)
                break
            }
        })
    }
}
