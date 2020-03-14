//
//  AppDelegate+UI.swift
//  qrscanner
//
//  Created by Mac10 on 3/10/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension AppDelegate {
    func initTabBarController(selectedIndex: Int?){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav1 = ScannerVC()
        nav1.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Scanner), image: UIImage(named:AppImages.IC_SCANNER), tag: 1)

        let nav2 = TypeCodeVC()
             nav2.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Generate), image: UIImage(named:AppImages.IC_GENERATE), tag: 1)
        let nav3 = HistoryVC()
        nav3.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History), image: UIImage(named:AppImages.IC_HISTORY), tag: 1)
        let nav4 = SaveVC()
        nav4.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Save), image: UIImage(named:AppImages.IC_HISTORY), tag: 1)
        let nav5 = HistoryVC()
        nav5.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History), image: UIImage(named:AppImages.IC_SETTING), tag: 1)


       
        let tabs = UITabBarController()
        tabs.viewControllers = [nav3, nav2, nav1,nav4,nav5]
        tabs.tabBar.unselectedItemTintColor = AppColors.GRAY
        tabs.selectedIndex = selectedIndex!
      
        UITabBar.appearance().tintColor = AppColors.PRIMARY_COLOR
        UITabBar.appearance().barTintColor = AppColors.GRAY_LIGHT
        UITabBar.appearance().unselectedItemTintColor = AppColors.GRAY
      
        self.window!.rootViewController = tabs;
        self.window?.makeKeyAndVisible();
    }
}
