//
//  MainVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class MainVC : SwipeMenuViewController {
   
    var options = SwipeMenuViewOptions()
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
   //     UIFont.availableFonts()

        //self.view.backgroundColor = .white
      //  let vc = ScannerVC()
       // self.navigationController?.pushViewController(vc, animated: false)
//        mScanner = ScannerVC()
//        show(mScanner!, sender: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "popupSegue" {
//            let vc = segue.destination as! PopupViewController
//            vc.options = options
//            vc.dataCount = dataCount
//            vc.reloadClosure = { self.reload() }
//        }
//    }

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
    override func viewDidAppear(_ animated: Bool) {
      
    }
    // MARK: - SwipeMenuViewDelegate
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
               print("will setup SwipeMenuView")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
        print("currentIndex : \(currentIndex)")
        print("did setup SwipeMenuView")
       
      //  reload()
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
        
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

