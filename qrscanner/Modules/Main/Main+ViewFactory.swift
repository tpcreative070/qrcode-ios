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
//        let history = UINavigationController(rootViewController: HistoryVC())
//        history.tabBarItem.image = UIImage(named: "ic_scan")
//        let genegrate = UINavigationController(rootViewController: TypeCodeVC())
//        genegrate.tabBarItem.image = UIImage(named: "ic_scan")
//        viewController.viewControllers = [history,genegrate]
//        view.addSubview(imgLogoSave)
//    NSLayoutConstraint.activate([
//                  imgLogoSave.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//                  imgLogoSave.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
//                  imgLogoSave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
//              ])
//        view.addSubview(imgLogoScan)
//        NSLayoutConstraint.activate([
//                      imgLogoScan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//                      imgLogoScan.leadingAnchor.constraint(equalTo: imgLogoSave.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
//                      imgLogoScan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
//                  ])
        
//        options.tabView.style = .segmented
//        options.tabView.itemView.selectedTextColor = AppColors.BLUE
//        options.tabView.itemView.textColor = AppColors.GRAY
//        options.tabView.additionView.backgroundColor = AppColors.BLUE
        //swipeMenuView.reloadData(options: options)
        
        
    }
    
    func addedView(){
//        mScanner = ScannerVC()
//               mScanner?.title = LanguageHelper.getTranslationByKey(LanguageKey.Scanner) ?? "Scanner"
//               addChild(mScanner ?? SettingsVC())
//
        mGenerate = TypeCodeVC()
        mGenerate?.title = LanguageHelper.getTranslationByKey(LanguageKey.Generate) ?? "Generate"
        addChild(mGenerate ?? TypeCodeVC())
        mHistory = HistoryVC()
        mHistory?.title = LanguageHelper.getTranslationByKey(LanguageKey.History) ?? "History"
//        mHistory!.tabBarItem = UITabBarItem(title: LanguageHelper.getTranslationByKey(LanguageKey.History), image: UIImage(named:AppImages.IC_BACK), tag: 1)
        addChild(mHistory ?? HistoryVC())
        
       
        mSave = SaveVC()
        mSave?.title = LanguageHelper.getTranslationByKey(LanguageKey.Save) ?? "Save"
        addChild(mSave ?? SaveVC())
        mSettings = SettingsVC()
        mSettings?.title = LanguageHelper.getTranslationByKey(LanguageKey.Setting) ?? "Settings"
        addChild(mSettings ?? SettingsVC())
    }
}


