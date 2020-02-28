//
//  Utils.swift
//  screenrecorder
//
//  Created by phong070 on 2/10/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class Utils : NSObject{
    /*We can creare func here. where the func was called many times*/
    static func logMessage(message : String){
        #if DEBUG
        print(message)
        #endif
    }
    
    static func logMessage(object : Any){
        #if DEBUG
        print(JSONSerializerHelper.toJson(object))
        #endif
    }
    
    static func getDeviceId() -> String{
        return UIDevice.current.identifierForVendor?.uuidString ?? "ldman12345679"
    }
}
