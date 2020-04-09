//
//  ChooseSaveVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class ChooseSaveVC : UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
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
    var dataSource :TableViewDataSource<TableViewCell,SaveViewModel,HeaderView>!
    var sections = [TableSection<String, SaveViewModel>]()
    let saveViewModel = SaveViewModelList()
    var floaty = Floaty()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = TableSection.group(rowItems: self.saveViewModel.listSave, by: { (headline) in
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
        for index in saveViewModel.listSave {
           // Utils.logMessage(object: saveViewModel.listSave)
            if index.check == true {
                saveViewModel.countItemSelected += 1
                self.saveViewModel.doDeleteSave(mData: index)
            }
        }
        
    }
    @objc func doSelectAll(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            saveViewModel.doSelectedAll(isValue: true)
        }
        else {
            sender.isSelected = false
            saveViewModel.doSelectedAll(isValue: false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.saveViewModel.doGetListSave()
        self.saveViewModel.isSelected.value = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
