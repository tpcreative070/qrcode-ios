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
    let historyViewModel = HistoryViewModelList()
    var floaty = Floaty()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("into ViewDidLoad History")
        self.sections = TableSection.group(rowItems: self.historyViewModel.listHistories, by: { (headline) in
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
        ProgressHUD.showInView(view: self.view)
        for index in historyViewModel.listHistories {
            Utils.logMessage(object: historyViewModel.listHistories)
            if index.check == true {
                historyViewModel.countItemSelected += 1
                print(index.content)
                self.historyViewModel.doDeleteHistory(mData: index)
            }
        }
        ProgressHUD.dismiss()
    }
    @objc func doSelectAll(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            historyViewModel.doSelectedAll(isValue: true)
        }
        else {
            sender.isSelected = false
            historyViewModel.doSelectedAll(isValue: false)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.historyViewModel.doGetListHistories()
        self.historyViewModel.isSelected.value = false
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
