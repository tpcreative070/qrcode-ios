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
        //        mHistory = HistoryVC()
        //        self.mHistory?.title.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (actionScanner(sender:))))
        //        options.tabView.style = .segmented
        //        options.tabView.itemView.selectedTextColor = AppColors.BLUE
        //        options.tabView.itemView.textColor = AppColors.GRAY
        //        options.tabView.additionView.backgroundColor = AppColors.BLUE
        //        swipeMenuView.reloadData(options: options)
        //        self.navigationController?.isNavigationBarHidden = true
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
    
}


