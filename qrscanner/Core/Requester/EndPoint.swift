//
//  Endpoint.swift
//  vietlifetravel
//
//  Created by Mac10 on 6/25/19.
//  Copyright © 2019 Mac10. All rights reserved.
//
import Foundation

protocol Endpoint {
  var base: String { get }
  var path: String { get }
}

extension Endpoint {
  
  var base: String {
    return CommonService.getBaseUrl()
  }
  
  var sessionId: String {
    return CommonService.getCurrentSessionId()!
  }

    var authorization: String {
       return ""
     }
  
  var defaultContentType: String {
    return "application/json"
  }
  
  var apiKey: String {
    return "api_key=34a92f7d77a168fdcd9a46ee1863edf1"
  }
  
  var urlComponents: URLComponents {
    var components = URLComponents(string: base)!
    components.path = path
    return components
  }
  
  var request: URLRequest {
    let url = urlComponents.url!
    var requestUrl = URLRequest(url: url)
    requestUrl.setValue(defaultContentType, forHTTPHeaderField: "Content-Type")
    requestUrl.setValue(sessionId, forHTTPHeaderField: "sessionId")
    // Todo set token in here
    return requestUrl
  }
}

//==================
// start user endpoint
enum UserEndPoint {
  
case SyncDevice
    case GetToken
  
}

extension UserEndPoint: Endpoint {
  var path: String {
    switch self {
    
    case .SyncDevice:
        return ApiEndPointUrl.SyncDevice
        case .GetToken:
               return ApiEndPointUrl.GetToken
  
   }
  }
}

enum SyncEndPoint {
    case upload
    case download
}

extension SyncEndPoint : Endpoint {
    var path: String {
        switch self {
        case .download:
            return ApiEndPointUrl.Donwload
        case .upload:
            return ApiEndPointUrl.Upload
    }
    }
}

enum HomeEndPoint {
    case productList
    case eDongToeCashOwner
    case eDongToeCashOwnerAmount
    case eDongToeCashToSomeone
    case eDongToeCashToSomeoneAmount
    case geteDongInfo
    case eCashToeDong
    case VerifyTransaction
    case ExchangeCash
    case getDenomination
}


