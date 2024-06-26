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
        //   application.statusBarStyle = .lightContent
        
        UITabBar.appearance().tintColor = AppColors.WHITE_COLOR
        UITabBar.appearance().barTintColor = AppColors.PRIMARY_COLOR
        UITabBar.appearance().unselectedItemTintColor = AppColors.GRAY
        
         UITabBar.appearance().backgroundColor = AppColors.PRIMARY_COLOR


        self.initGoogleServices()
        self.initLanguage()
        self.initConfig()
        self.initDevice()
       
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
             let esLang = languagesObject[LanguageCode.Spanish] as! Dictionary<String, Any>
            let ptLang = languagesObject[LanguageCode.Portuguese] as! Dictionary<String, Any>

            // Store language to db
            LanguageHelper.storeLanguageByKey(LanguageCode.English, data: JSONHelper.convertDictionaryToJson(enLang) ?? "")
            LanguageHelper.storeLanguageByKey(LanguageCode.Vietnamese, data: JSONHelper.convertDictionaryToJson(viLang) ?? "")
            LanguageHelper.storeLanguageByKey(LanguageCode.Spanish, data: JSONHelper.convertDictionaryToJson(esLang) ?? "")
            LanguageHelper.storeLanguageByKey(LanguageCode.Portuguese, data: JSONHelper.convertDictionaryToJson(ptLang) ?? "")
            // store language to global data
            GlobalVariableHelper.languages[LanguageCode.English] = enLang
            GlobalVariableHelper.languages[LanguageCode.Vietnamese] = viLang
            GlobalVariableHelper.languages[LanguageCode.Spanish] = esLang
            GlobalVariableHelper.languages[LanguageCode.Portuguese] = ptLang

        }
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let message = url.host?.removingPercentEncoding
           let alertController = UIAlertController(title: "Incoming Message", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alertController.addAction(okAction)
           
           window?.rootViewController?.present(alertController, animated: true, completion: nil)
           
           return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
     
    }
    
}
