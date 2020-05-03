//
//  UrlModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class SettingViewModel : Codable {
   var isVibrate: Bool?
    var isBeep: Bool?
    var color: String?
    var isCopy: Bool?
    var isOpenWeb: Bool?
    var isMultiLoad: Bool?
    var isMultiScan: Bool?
    var isSkip: Bool?
   
    init() {
        
    }
    
    init(data: SettingModel) {
        self.isVibrate = data.isVibrate
        self.isBeep = data.isBeep
        self.color = data.color
        self.isCopy = data.isCopy
        self.isOpenWeb = data.isOpenWeb
        self.isMultiScan = data.isMultiScan
        self.isMultiLoad = data.isMultiLoad
        self.isSkip = data.isSkip

    }
    init(isVibrate : Bool) {
           self.isVibrate = isVibrate
       }
       init(isBeep : Bool) {
             self.isBeep = isBeep
         }
       init(color : String) {
             self.color = color
         }
       init(isCopy : Bool) {
             self.isCopy = isCopy
         }
       init(isOpenWeb : Bool) {
             self.isOpenWeb = isOpenWeb
         }
    init(isMultiScan : Bool) {
               self.isMultiScan = isMultiScan
           }
         init(isMultiLoad : Bool) {
               self.isMultiLoad = isMultiLoad
           }
         init(isSkip : Bool) {
               self.isOpenWeb = isSkip
           }
}
