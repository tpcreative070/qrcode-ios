//
//  UserService.swift
//
//  Created by Mac10 on 6/25/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import Foundation
import UIKit

class UserService: APIClient {
  
  let session: URLSession!
  init(configuration: URLSessionConfiguration) {
    self.session = URLSession(configuration: configuration)
  }
  convenience init() {
    self.init(configuration: .default)
  }
  /**
    - Request api, with endpoint is syncdevice
    */
   func SyncDevice(data: TrackRequestModel, completion: @escaping (Result<TrackResponseModel, APIServiceError>) -> Void) {
     let endpoint = UserEndPoint.SyncDevice
     var request = endpoint.request
     request.httpMethod = HTTPMethod.POST.rawValue
     let encoder = JSONEncoder()
     let dataEncode = try? encoder.encode(data)
     request.httpBody = dataEncode
    if let session_token = CommonService.getAuthorKeyChain() {
           request.allHTTPHeaderFields = ["Authorization": session_token]
    }
    else{
    request.allHTTPHeaderFields = ["Authorization": ""]
    }
    Utils.logMessage(object: request)
     fetch(with: request, decode: { json -> TrackResponseModel? in
       guard let authResult = json as? TrackResponseModel else { return  nil }
       return authResult
     }, completion: completion)
   }
    
    func GetToken(data: AuthorizationModelRequest, completion: @escaping (Result<AuthorizationResponseModel, APIServiceError>) -> Void) {
        Utils.logMessage(object: data)
        let endpoint = UserEndPoint.GetToken
        var request = endpoint.request
        request.httpMethod = HTTPMethod.POST.rawValue
        let encoder = JSONEncoder()
        let dataEncode = try? encoder.encode(data)
        request.httpBody = dataEncode
        fetch(with: request, decode: { json -> AuthorizationResponseModel? in
          guard let authResult = json as? AuthorizationResponseModel else { return  nil }
          return authResult
        }, completion: completion)
      }
  /**
   - Request api, with endpoint is signin
   */
  func signIn(data: SignInRequestModel, completion: @escaping (Result<SignInResponseModel, APIServiceError>) -> Void) {
    let endpoint = UserEndPoint.SignIn
    var request = endpoint.request
    request.httpMethod = HTTPMethod.POST.rawValue
    let encoder = JSONEncoder()
    let dataEncode = try? encoder.encode(data)
    request.httpBody = dataEncode
    fetch(with: request, decode: { json -> SignInResponseModel? in
      guard let authResult = json as? SignInResponseModel else { return  nil }
      return authResult
    }, completion: completion)
  }
    
  /**
   - Request api, with endpoint is sign up
   */
   func signUp(data: SignUpRequestModel, completion: @escaping (Result<SignUpResponseModel, APIServiceError>) -> Void) {
        let endpoint = UserEndPoint.SignUp
        var request = endpoint.request
        request.httpMethod = HTTPMethod.POST.rawValue
        let encoder = JSONEncoder()
        let dataEncode = try? encoder.encode(data)
        request.httpBody = dataEncode
        fetch(with: request, decode: { json -> SignUpResponseModel? in
            guard let authResult = json as? SignUpResponseModel else { return  nil }
            return authResult
        }, completion: completion)
    }
}
