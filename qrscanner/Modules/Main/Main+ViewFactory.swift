//
//  Main+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension MainVC  {
    
    func initUI(){
        var viewController = UITabBarController()
        mHistory = HistoryVC()
        mScanner = ScannerVC()
        mSave = SaveVC()
        mSettings = SettingsVC()
        let history = UINavigationController(rootViewController: HistoryVC())
        history.tabBarItem.image = UIImage(named: "ic_scan")
        let genegrate = UINavigationController(rootViewController: GenerateVC())
        genegrate.tabBarItem.image = UIImage(named: "ic_scan")
        viewController.viewControllers = [history,genegrate]
    }
    
    func addedView(){
        mHistory = HistoryVC()
        mHistory?.title = LanguageHelper.getTranslationByKey(LanguageKey.History) ?? "History"
        addChild(mHistory ?? HistoryVC())
        mGenerate = GenerateVC()
        mGenerate?.title = LanguageHelper.getTranslationByKey(LanguageKey.Generate) ?? "Generate"
        addChild(mGenerate ?? GenerateVC())
        mScanner = ScannerVC()
        mScanner?.title = LanguageHelper.getTranslationByKey(LanguageKey.Scanner) ?? "Scanner"
        addChild(mScanner ?? SettingsVC())
        mSave = SaveVC()
        mSave?.title = LanguageHelper.getTranslationByKey(LanguageKey.Save) ?? "Save"
        addChild(mSave ?? SaveVC())
        mSettings = SettingsVC()
        mSettings?.title = LanguageHelper.getTranslationByKey(LanguageKey.Setting) ?? "Settings"
        addChild(mSettings ?? SettingsVC())
    }
}


