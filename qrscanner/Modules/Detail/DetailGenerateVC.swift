//
//  DetailGenerate.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class DetailGenerateVC : BaseViewController{
lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
     }()
    let wrapperView: UIView = {
      let parentView = UIView()
        parentView.backgroundColor = .red
      parentView.translatesAutoresizingMaskIntoConstraints = false
      return parentView
    }()
     lazy var endedUpScrollViewContainerView : UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
     }()
    
    var tableView : UITableView!
    var typeCode = ""
    var valueContent = ""
    var valueGenerate : HistoryViewModel?
 //   var viewModelTypeCode
    var viewModel = DetailViewModelList()
    var dataSourceUrl :TableViewDataSource<TableViewCell,UrlViewModel,HeaderView>!
    var dataSourceText :TableViewDataSource<TableViewCell,TextViewModel,HeaderView>!
    var dataSourcePhone :TableViewDataSource<TableViewCell,PhoneViewModel,HeaderView>!
    var dataSourceEmail :TableViewDataSource<TableViewCell,EmailViewModel,HeaderView>!
    var dataSourceWifi :TableViewDataSource<TableViewCell,WifiViewModel,HeaderView>!
    var dataSourceContact :TableViewDataSource<TableViewCell,ContactViewModel,HeaderView>!
    var dataSourceLocation :TableViewDataSource<TableViewCell,LocationViewModel,HeaderView>!
    var dataSourceMessage :TableViewDataSource<TableViewCell,MessageViewModel,HeaderView>!
    var dataSourceEvent :TableViewDataSource<TableViewCell,EventViewModel,HeaderView>!
    var dataSource :TableViewDataSource<TableViewCell,HistoryViewModel,HeaderView>!

    override func viewDidLoad() {
           super.viewDidLoad()
        print ("view didload typecode")
           initUI()
         addLeftBackButton()
        typeCode = typeCode.uppercased()
        print(typeCode)
        print(valueContent)
        print(valueGenerate)
        bindTableView()
        bindViewModel()
       }
       override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                keyboardHelper?.registerKeyboardNotification()
                  self.navigationController?.setNavigationBarHidden(false, animated: true)
            


            }
       
            override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)
             print("se bien mat")
             self.navigationController?.isNavigationBarHidden = true
                keyboardHelper?.deregisterKeyboardNotification()
            }
       override func actionLeft() {
           dismiss()
       }
   
}
