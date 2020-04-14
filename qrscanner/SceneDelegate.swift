//
//  SceneDelegate.swift
//  qrscanner
//
//  Created by phong070 on 2/21/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Create the SwiftUI view that provides the window contents.
        //        let contentView = TestViewController()
       let rootVC = UINavigationController(rootViewController: MainVC())
         rootVC.isNavigationBarHidden = true
         // Use a UIHostingController as window root view controller.
         if let windowScene = scene as? UIWindowScene {
         let window = UIWindow(windowScene: windowScene)
         //            window.rootViewController = UIHostingController(rootView: contentView)
         window.rootViewController = rootVC
         self.window = window
         window.makeKeyAndVisible()
     //   guard let windowScene = (scene as? UIWindowScene) else { return }
       // let window = UIWindow(windowScene: windowScene)
        /*
         let mHistory = HistoryVC()
          let  mScanner = ScannerVC()
           let mSave = SaveVC()
        let mGenerate = TypeCodeVC()
           let mSettings = SettingsVC()
        let tabBarController = UITabBarController()
      
         mScanner.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Scanner), image: UIImage(named:AppImages.IC_SCANNER), tag: 0)
       mGenerate.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Generate), image: UIImage(named:AppImages.IC_GENERATE), tag: 1)
        mHistory.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History), image: UIImage(named:AppImages.IC_HISTORY), tag: 2)
        mSave.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Save), image: UIImage(named:AppImages.IC_SAVE), tag: 3)
        mSettings.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Setting), image: UIImage(named:AppImages.IC_SETTING), tag: 4)
      //  tabBarController.viewControllers = [mHistory,mGenerate,mScanner, mSave, mSettings]
     let controllers = [mHistory,mGenerate,mScanner, mSave, mSettings]
//        mHistory.tableView.removeFromSuperview()
//        mGenerate.tableView.removeFromSuperview()
      //  tabBarController.selectedViewController = mGenerate
        
       tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
//getVisibleViewController(mGenerate)
       // tabBarController.selectedViewController = mHistory
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        */
        /*
      //Home
            let historyVC = HistoryVC()
            let historyNavi = UINavigationController(rootViewController: historyVC)
            historyVC.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History) ?? "History", image: UIImage(named:AppImages.IC_HISTORY), tag: 1)
            //Messages
            let typecodeVC = TypeCodeVC()
            let typecodeNavi = UINavigationController(rootViewController: typecodeVC)
            typecodeVC.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Generate) ?? "Cretae", image: UIImage(named:AppImages.IC_GENERATE), tag: 2)
            //Friends
            let scannerVC = ScannerVC()
            let scannerNavi = UINavigationController(rootViewController: scannerVC)
             scannerVC.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Scanner) ?? "Scanner", image: UIImage(named:AppImages.IC_SCANNER), tag: 3)
            //Profile
            let saveVC = SaveVC()
            let saveNavi = UINavigationController(rootViewController: saveVC)
            saveVC.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Save) ?? "Save", image: UIImage(named:AppImages.IC_SAVE), tag: 4)
        let settingVC = SettingsVC()
                   let setNavi = UINavigationController(rootViewController: settingVC)
                   settingVC.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Setting) ?? "Setting", image: UIImage(named:AppImages.IC_SETTING), tag:5)
            self.window = window
            window.makeKeyAndVisible()
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [historyNavi, typecodeNavi, scannerNavi, saveNavi, setNavi]
//        tabbarController.tabBar.tintColor = AppColors.COLOR_ACCENT_DARK
//        tabbarController.tabBar.backgroundColor = AppColors.PRIMARY_COLOR
        tabbarController.selectedIndex = 2
        window.rootViewController = tabbarController*/
        }
}
   
func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

func sceneDidEnterBackground(_ scene: UIScene) {
    print("enter background")
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
           print("url: \(context.url.absoluteURL)")
           print("scheme: \(context.url.scheme)")
           print("host: \(context.url.host)")
           print("path: \(context.url.path)")
           print("components: \(context.url.pathComponents)")
         }
        
    }
 func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
   guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
     let urlToOpen = userActivity.webpageURL else {
       return
   }

   print(urlToOpen)
 }
}

