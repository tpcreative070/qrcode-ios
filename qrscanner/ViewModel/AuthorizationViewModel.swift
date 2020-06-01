//
//  AuthorizationViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 5/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class AuthorizationViewModel{
    private let userService: UserService
    init(userService: UserService = UserService()) {
        self.userService = userService
    }
    func getToken() {
        if CommonService.getRefreshToken() == nil || CommonService.getRefreshToken() == "" {
            CommonService.setRefreshToken(data: AppConstants.refresh_token)
               }
        let autho = AuthorizationModelRequest(user_id: AppConstants.user_id, refresh_token: CommonService.getRefreshToken() ?? AppConstants.refresh_token, public_key: CommonService.getPublicKey())
        userService.GetToken(data: autho,  completion: { result  in
            switch result {
            case .success(let userResult):
                if let response = userResult{
                    Utils.logMessage(object: response.data)
                    let author = AuthorizationModel(data: response.data)
                    CommonService.setAuthorKeyChain(data: author.session_token ?? "")
                    CommonService.setRefreshToken(data: autho.refresh_token ?? AppConstants.refresh_token)
                    let trackvm = TrackViewModel()
                    trackvm.getSyncDevice()
                }
                break
            case .failure( let error ):
                Utils.logMessage(object: error)
                break
            }
        })
    }
  
}
