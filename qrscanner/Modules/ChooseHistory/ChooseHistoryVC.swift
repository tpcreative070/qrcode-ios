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
    
    let viewWrapper: UIView = {
        let parentView = UIView()
        parentView.translatesAutoresizingMaskIntoConstraints = false
        return parentView
    }()
    var tableView : UITableView!
    lazy var lbTitle : ICLabel = {
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
        self.sections = TableSection.group(rowItems: self.viewModel.listHistories, by: { (headline) in
            return headline.typeCode
        })
        initUI()
        bindViewModel()
    }
    
    @objc func closeButtonPress(){
        self.dismiss(animated: false, completion: nil)
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
        if !sender.isSelected {
            sender.isSelected = true
            viewModel.doSelectedAll(isValue: true)
        }
        else {
            sender.isSelected = false
            viewModel.doSelectedAll(isValue: false)
        }
        
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
