//
//  MainVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
import StoreKit
class MainVC : SwipeMenuViewController {
  
    var mSave : SaveVC?
    var mHistory : HistoryVC?
    var mGenerate : TypeCodeVC?
    var mScanner : ScannerVC?
    var mSettings : SettingsVC?
    var dataCount: Int = 5

    override func viewDidLoad() {
        initUI()
        addedView()
        setupStatusBar()
        super.viewDidLoad()
        if Bool(CommonService.getUserDefault(key: KeyUserDefault.Theme) ?? false){
                             UIApplication.shared.windows.forEach { window in
                                 window.overrideUserInterfaceStyle = .dark
                             }
                         }
//        if #available(iOS 10.3, *){
//            AppStoreReviewManager.requestReviewIfAppropriate()
//        }
//        let myAlert = RateVC()
//       myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(myAlert, animated: true, completion: nil)
    }

    // MARK: - SwipeMenuViewDelegate
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
       // print("currentIndex : \(currentIndex)")
       
      //  reload()
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
       // print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
       // print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
        if toIndex != 2 {
            AppConstants.isCam = 1
        }
        if toIndex == 2{
            AppConstants.isCam = 0
        }
    }
    
    // MARK - SwipeMenuViewDataSource
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return dataCount
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].navigationItem.title ?? ""
    }
     override func swipeMenuView(_ swipeMenuView: SwipeMenuView, imageForPageAt index: Int) -> UIImageView {
        return children[index].navigationItem.titleView as! UIImageView ?? UIImageView.init(image: UIImage(named: AppImages.IC_HELP))
          }
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc
    
    }

   
}

