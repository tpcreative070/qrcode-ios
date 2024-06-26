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
    func syncDevice(){
        DispatchQueue.global(qos: .background).async {
            self.trackViewModel.getSyncDevice()

        }
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
   
      func setupStatusBar(){
             if #available(iOS 13.0, *) {
                       let app = UIApplication.shared
                       let statusBarHeight: CGFloat = app.statusBarFrame.size.height
                       let statusbarView = UIView()
                        statusbarView.tintColor = AppColors.WHITE_COLOR
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
                func showRating(){
                       let minimumReviewWorthyActionCount = 3
                          let defaults = UserDefaults.standard
                          let bundle = Bundle.main
                          
                          var actionCount = defaults.integer(forKey: .reviewWorthyActionCount)
                          if actionCount > 5 && !defaults.bool(forKey: .pressSubmitFiveStar) && defaults.bool(forKey: .pressNoThanks){
                              actionCount = 0
                              defaults.set(true, forKey: .flagRating)
                              defaults.set(actionCount, forKey: .reviewWorthyActionCount)
                              return
                          }
                          if actionCount > 5 && !defaults.bool(forKey: .pressSubmitFiveStar) && defaults.bool(forKey: .pressNotNow){
                              actionCount = 0
                              defaults.set(true, forKey: .flagRating)
                              defaults.set(actionCount, forKey: .reviewWorthyActionCount)
                              return
                          }
                          if actionCount > 5 && defaults.bool(forKey: .pressSubmitFiveStar){
                              defaults.set(true, forKey: .flagRating)
                              return
                          }
                          let flagRating =  defaults.bool(forKey: .flagRating)
                    print(defaults.bool(forKey: .pressSubmitFiveStar))
                          if !flagRating && !defaults.bool(forKey: .pressSubmitFiveStar){
                          if actionCount <= 5 {
                          actionCount += 1
                              defaults.set(actionCount, forKey: .reviewWorthyActionCount)

                          }
                          }
                       
                          
                         let bundleVersionKey = kCFBundleVersionKey as String
                           let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
                           let lastVersion = defaults.string(forKey: .lastReviewRequestAppVersion)
                           
                          if lastVersion == nil || lastVersion != currentVersion {
                            defaults.set(false, forKey: .flagRating)
                              if !defaults.bool(forKey: .pressSubmitFiveStar) {
                                       if actionCount >= minimumReviewWorthyActionCount && actionCount <= 5 {
                                           let myAlert = RateVC()
                                           myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                                           myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                                           self.present(myAlert, animated: true, completion: nil)
                                           defaults.set(currentVersion, forKey: .lastReviewRequestAppVersion)
                                       }
                                       else {
                                           return
                                       }
                                   }
                              else{return}
                          }
                          else {
                              if defaults.bool(forKey: .pressSubmitFiveStar) {
                                  return
                              }
                              else{
                                  if actionCount >= minimumReviewWorthyActionCount && actionCount <= 5 {
                                                        let myAlert = RateVC()
                                                        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                                                        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                                                        self.present(myAlert, animated: true, completion: nil)
                                                        
                                                    }
                                                    else {
                                                        return
                                                    }
                              }
                           }
                           
                           
                          //  defaults.set(0, forKey: .reviewWorthyActionCount)
                          // defaults.set(currentVersion, forKey: .lastReviewRequestAppVersion)
                           print(actionCount)
                }
}


