//
//  MainVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
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
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
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
//   override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) -> UIViewController {
//        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
//       let vc = children[currentIndex]
//       vc.didMove(toParent: self)
//       return vc
//        print("will setup SwipeMenuView")
//    }

   
}

