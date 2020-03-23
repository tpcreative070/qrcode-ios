//
//  SaveVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Floaty
class SaveVC : UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
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
    var dataSource :TableViewDataSource<TableViewCell,SaveViewModel,HeaderView>!
    var sections = [TableSection<String, SaveViewModel>]()
    let viewModel = SaveViewModelList()
    var floaty = Floaty()
    var flagselectItem = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = TableSection.group(rowItems: self.viewModel.listSave, by: { (headline) in
            return headline.typeCode
        })
        initUI()
        setupFloatButton()
        bindViewModel()
    }
    
    
    @objc func doShare(sender: UITapGestureRecognizer){
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.viewModel.doGetListSave()
        self.viewModel.isSelected.value = false
        self.navigationController?.isNavigationBarHidden = true
        print("into ViewDidAppear Save")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("into viewWillAppear Save")
        
    }
}
