//
//  AppDelegate.swift
//  qrscanner
//
//  Created by phong070 on 2/21/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.initLanguage()
        self.initConfig()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate{
    /**
     Init language when open the app, store language to db, store language to memory
     */
    fileprivate func initLanguage() {
        if let languagesObject = JSONHelper.loadJsonfromLocal("languages") {
            let enLang = languagesObject[LanguageCode.English] as! Dictionary<String, Any>
            let viLang = languagesObject[LanguageCode.Vietnamese] as! Dictionary<String, Any>
            // Store language to db
            LanguageHelper.storeLanguageByKey(LanguageCode.English, data: JSONHelper.convertDictionaryToJson(enLang) ?? "")
            LanguageHelper.storeLanguageByKey(LanguageCode.Vietnamese, data: JSONHelper.convertDictionaryToJson(viLang) ?? "")
            // store language to global data
            GlobalVariableHelper.languages[LanguageCode.English] = enLang
            GlobalVariableHelper.languages[LanguageCode.Vietnamese] = viLang
        }
    }
}
