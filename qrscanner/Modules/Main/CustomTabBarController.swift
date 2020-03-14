//
//  CustomTabBarController.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = UITabBarController()

        let mHistory = HistoryVC()
          let  mScanner = ScannerVC()
           let mSave = SaveVC()
        let mGenerate = TypeCodeVC()
           let mSettings = SettingsVC()
        mScanner.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Scanner), image: UIImage(named:AppImages.IC_SCANNER), tag: 0)
        mGenerate.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Generate), image: UIImage(named:AppImages.IC_GENERATE), tag: 1)
         mHistory.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History), image: UIImage(named:AppImages.IC_HISTORY), tag: 2)
         mSave.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Save), image: UIImage(named:AppImages.IC_SAVE), tag: 3)
         mSettings.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.Setting), image: UIImage(named:AppImages.IC_SETTING), tag: 4)
         tabBarController.viewControllers = [mHistory,mGenerate, mSave, mSettings]
        tabBarController.selectedViewController = mGenerate

    }

}
