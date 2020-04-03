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
    
    }
    
    func addedView(){
        
        mScanner = ScannerVC()
        mScanner?.title = LanguageHelper.getTranslationByKey(LanguageKey.Scanner) ?? "Scanner"
        mScanner?.navigationItem.titleView = UIImageView.init(image: UIImage(named: AppImages.IC_SCAN))
        mHistory = HistoryVC()
        mHistory?.navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.History) ?? "History"
        mHistory?.navigationItem.titleView = UIImageView.init(image: UIImage(named: AppImages.IC_HISTORY))
        
        mGenerate = TypeCodeVC()
        mGenerate?.title = LanguageHelper.getTranslationByKey(LanguageKey.Generate) ?? "Generate"
        mGenerate?.navigationItem.titleView = UIImageView.init(image: UIImage(named: AppImages.IC_GENERATE))
        
        mSave = SaveVC()
        mSave?.title = LanguageHelper.getTranslationByKey(LanguageKey.Save) ?? "Save"
        mSave?.navigationItem.titleView = UIImageView.init(image: UIImage(named: AppImages.IC_SAVE))
        mSettings = SettingsVC()
        mSettings?.title = LanguageHelper.getTranslationByKey(LanguageKey.Setting) ?? "Settings"
        mSettings?.navigationItem.titleView = UIImageView.init(image: UIImage(named: AppImages.IC_SETTINGS_WHITE))
        addChild(mHistory ?? HistoryVC())
        addChild(mGenerate ?? TypeCodeVC())
        addChild(mScanner ?? ScannerVC())
        addChild(mSave ?? SaveVC())
        addChild(mSettings ?? SettingsVC())
    }
    private func reload() {
          swipeMenuView.reloadData(options: options)
      }
      func setupStatusBar(){
             if #available(iOS 13.0, *) {
                       let app = UIApplication.shared
                       let statusBarHeight: CGFloat = app.statusBarFrame.size.height
                       let statusbarView = UIView()
                       statusbarView.backgroundColor = AppColors.PRIMARY_COLOR_DARK
                       view.addSubview(statusbarView)
                       statusbarView.translatesAutoresizingMaskIntoConstraints = false
                       statusbarView.heightAnchor
                           .constraint(equalToConstant: statusBarHeight).isActive = true
                       statusbarView.widthAnchor
                           .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                       statusbarView.topAnchor
                           .constraint(equalTo: view.topAnchor).isActive = true
                       statusbarView.centerXAnchor
                           .constraint(equalTo: view.centerXAnchor).isActive = true
                     
                   } else {
                       let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
                       statusBar?.backgroundColor = AppColors.PRIMARY_COLOR_DARK
                   }

         }
}


