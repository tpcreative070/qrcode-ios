//
//  AppDelegate+GoogleService.swift
//  qrscanner
//
//  Created by Mac10 on 4/14/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Firebase
extension AppDelegate  {
    
    func initGoogleServices(){
        
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        FirebaseApp.configure()
    }
}
