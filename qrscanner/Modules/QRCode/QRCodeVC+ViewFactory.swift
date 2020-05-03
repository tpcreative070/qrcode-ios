//
//  TypeCodeVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension QRCodeVC {
    func initUI(){
        self.navigationController?.isNavigationBarHidden = true
        /*SetupScrollView*/
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        scrollView.addSubview(wrapperView)
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            wrapperView.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
            wrapperView.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT_HELP),
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        wrapperView.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbTitle.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
            lbTitle.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor)
            
        ])
        /*TableView*/
        tableView = UITableView()
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        tableView.separatorStyle = .none
        //  tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        wrapperView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM)
        ])
        //  btnDone.addTarget(self, action: #selector(getListSelectedItem), for: .touchUpInside)
        setupEndedUpScrollView()
        setupTableView()
        bindTableView()
        
    }
    
    func bindViewModel() {
        self.viewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                self?.navigationItem.title = "\(String(describing: self!.viewModel.countItemSelected)) \(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Selected)!))"
                self?.updateDataSource()
            }
            if value == EnumResponseToView.GET_DATA_SOURCE.rawValue {
                self?.updateDataSource()
            }
        }
        self.viewModel.navigate = { [weak self] in
            if (self?.viewModel.listTransaction.count)! > 0{
            let  vc = DetailVC()
            vc.listContentViewModel = ((self?.viewModel.listTransaction)!)
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.navigationController?.viewControllers.remove(at: 1)
            
            }
            else{
                let alert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message:LanguageHelper.getTranslationByKey(LanguageKey.ChooseQRCode) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Ok), style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
        self.viewModel.convertStringToQRCode(mValue: viewModel.listQRResult)
    }
    
    func updateDataSource() {
        self.dataSource.items = self.viewModel.listItem
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.viewModel.currentCell = vm
        }
        self.tableView.reloadData()
        log(message: "List typecode available...")
        //    log(object: self.viewModel.listTypeCondeViewModel)
    }
    
    //set dataSource fo tableView
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.QRCodeList.rawValue, items: self.viewModel.listItem,isSelectionStype: false){ cell, vm in
            cell.configView(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.viewModel.currentCell = vm
        }
        //  self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.loadMore = {
            self.log(message: "Loading more")
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    func setupTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.QRCodeList.rawValue)
        tableView.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
    }
    func setupNavItems() {
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let urlAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = urlAttributes
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        let menuButtonRightSelectAll = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRightSelectAll.setBackgroundImage(UIImage(named: AppImages.IC_SELECT_ALL), for: .normal)
        menuButtonRightSelectAll.addTarget(self, action: #selector(doSelectAll), for: .touchUpInside)
        
        
        let menuButtonRight = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRight.setBackgroundImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(getListSelectedItem), for: .touchDown)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight), UIBarButtonItem(customView: menuButtonRightSelectAll)]
        
        let stackview = UIStackView.init(arrangedSubviews: [menuButtonRightSelectAll,menuButtonRight])
           stackview.distribution = .equalSpacing
           stackview.axis = .horizontal
           stackview.alignment = .center
           stackview.spacing = 8
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackview)
        
       
    }
}
extension QRCodeVC : TableViewCellDelegate {
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    
    func cellViewLongSelected(cell: Codable) {
        
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        
    }
    
    func cellViewSelected(cell: Codable) {
        //        if let data = JSONHelper.get(value: QRCodeViewModel.self,anyObject: cell){
        //            print(data.imgCodeView)
        //               }
        self.viewModel.doSelectItem(coable: cell)
        
    }
    
    func cellCodable(codable: Codable) {
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        print("\(cell.identifier) -- \(cell.lbTitle)")
    }
    
    func setupEndedUpScrollView(){
        wrapperView.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
}
extension QRCodeVC : SingleButtonDialogPresenter {
    
}
