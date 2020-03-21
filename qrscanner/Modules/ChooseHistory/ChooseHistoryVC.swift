//
//  HistoryVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Floaty
class ChooseHistoryVC : UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
     }()
 
    let wrapperView: UIView = {
      let parentView = UIView()
      parentView.translatesAutoresizingMaskIntoConstraints = false
      return parentView
    }()
        var tableView : UITableView!
        lazy var lbTittle : ICLabel = {
          let lbTittle = ICLabel()
          lbTittle.translatesAutoresizingMaskIntoConstraints = false
          return lbTittle
        }()
    lazy var endedUpScrollViewContainerView : UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
        var dataSource :TableViewDataSource<TableViewCell,HistoryViewModel,HeaderView>!
        var sections = [TableSection<String, HistoryViewModel>]()
        let viewModel = HistoryViewModelList()
    var floaty = Floaty()
    var flagselectItem = false
        override func viewDidLoad() {
            super.viewDidLoad()
            print("into ViewDidLoad History")

            initUI()
            setupStatusBar()
            setupFloatButton()
            self.sections = TableSection.group(rowItems: self.viewModel.listHistories, by: { (headline) in
                return headline.typeCode
            })
            bindViewModel()
         //   setupLeftButton()
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
    func setupLeftButton(){
        let navButton = Helper.addLeftBackButton(self.view)
               self.view.bringSubviewToFront(navButton!)
               navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }
    @objc func closeButtonPress(){
          self.dismiss(animated: false, completion: nil)
       }
    func setupFloatButton(){
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = AppColors.PRIMARY_COLOR
      
    item.titleLabelPosition = .left
        item.icon = UIImage(named: "ic_keyboard")
        item.icon?.withTintColor(.white)
        item.title = "CVS"
        item.handler = { item in
            let activiController = UIActivityViewController(activityItems: ["this text"], applicationActivities: nil)
            self.present(activiController,animated: true, completion: nil)
        }
        
    //    floaty.hasShadow = false
        
       let item_select = FloatyItem()
            item_select.hasShadow = false
            item_select.buttonColor = AppColors.PRIMARY_COLOR
        
        item_select.titleLabelPosition = .left
            item_select.icon = UIImage(named: "ic_select_all")
            item_select.title = "Select"
            item_select.handler = { item in
                
                //self.tableView.isEditing =  true
                //self.tableView.allowsMultipleSelectionDuringEditing = true
            }
        floaty.tintColor = .white
    
        floaty.addItem(item: item_select)
        floaty.addItem(item: item)

        self.wrapperView.addSubview(floaty)
        
    }
    @objc func doShare(sender: UITapGestureRecognizer){
        
    }
    @objc func doDeleteItem() {
        print("do select")
        
        for index in viewModel.listHistories {
            Utils.logMessage(object: viewModel.listHistories)
            if index.check == true {
                viewModel.countItemSelected += 1
                print(index.content)
                self.viewModel.doDeleteHistory(mData: index)

            }
        }
     
    }
    @objc func doSelectAll(_ sender: UIButton) {
       // guard let button = sender as? UIButton else { return }

        if !sender.isSelected {
            sender.isSelected = true
            viewModel.doSelectedAll(isValue: true)
        }
        else {
            sender.isSelected = false
           viewModel.doSelectedAll(isValue: false)

        }

       }
    // MARK: - Floaty Delegate Methods
       func floatyWillOpen(_ floaty: Floaty) {
           print("Floaty Will Open")
       }
       
       func floatyDidOpen(_ floaty: Floaty) {
           print("Floaty Did Open")
       }
       
       func floatyWillClose(_ floaty: Floaty) {
           print("Floaty Will Close")
       }
       
       func floatyDidClose(_ floaty: Floaty) {
           print("Foaty Did Close")
           }
    
        override func viewDidAppear(_ animated: Bool) {
            
            self.viewModel.doGetListHistories()
            self.viewModel.isSelected.value = false
             
            print("into ViewDidAppear History")
        }
    
        override func viewWillAppear(_ animated: Bool) {
                 super.viewWillAppear(animated)
                   self.navigationController?.setNavigationBarHidden(false, animated: true)
             


             }
   
          
          override func viewWillDisappear(_ animated: Bool) {
              super.viewWillDisappear(animated)
             self.navigationController?.isNavigationBarHidden = true
          }
        
}
