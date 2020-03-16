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
//        options.tabView.itemView.selectedTextColor = AppColors.COLOR_ACCENT
//        options.tabView.itemView.textColor = AppColors.WHITE_COLOR
//        options.tabView.additionView.backgroundColor = AppColors.PRIMARY_COLOR
        //swipeMenuView.reloadData(options: options)
        
        
    }
    
    func addedView(){
       
     
        mHistory = HistoryVC()
        mHistory?.navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.History) ?? "History"
         mHistory?.navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_history"))
        addChild(mHistory ?? HistoryVC())
        mGenerate = TypeCodeVC()
               mGenerate?.title = LanguageHelper.getTranslationByKey(LanguageKey.Generate) ?? "Generate"
        mGenerate?.navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_generate"))

               addChild(mGenerate ?? TypeCodeVC())
        mScanner = ScannerVC()
                                           mScanner?.title = LanguageHelper.getTranslationByKey(LanguageKey.Scanner) ?? "Scanner"
                              mScanner?.navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_scan"))

                                           addChild(mScanner ?? ScannerVC())
   
            
        mSave = SaveVC()
        mSave?.title = LanguageHelper.getTranslationByKey(LanguageKey.Save) ?? "Save"
        mSave?.navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_save"))

        addChild(mSave ?? SaveVC())
        mSettings = SettingsVC()
        mSettings?.title = LanguageHelper.getTranslationByKey(LanguageKey.Setting) ?? "Settings"
        mSettings?.navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_settings_white"))

        addChild(mSettings ?? SettingsVC())
    }
    
}


