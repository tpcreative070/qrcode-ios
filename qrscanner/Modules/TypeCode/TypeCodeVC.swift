//
//  GenerateVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TypeCodeVC : BaseViewController{
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
     lazy var endedUpScrollViewContainerView : UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
     }()
     var ended: UIView = {
          let ended = UIView()
          ended.translatesAutoresizingMaskIntoConstraints = false
          return ended
        }()
    var tableView : UITableView!
    var lbTitle : ICLabel!
    var viewModel = TypeCodeViewModelList()
  var dataSource :TableViewDataSource<TableViewCell,TypeCodeViewModel,HeaderView>!
    override func viewDidLoad() {
           super.viewDidLoad()
        print ("view didload typecode")
           initUI()
       bindViewModel()
        

       }
       
       override func actionLeft() {
           dismiss()
       }
   
}
