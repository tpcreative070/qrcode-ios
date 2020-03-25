//
//  DetailGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension DetailVC {
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
        self.scrollView.addSubview(viewWrapper)
        NSLayoutConstraint.activate([
            viewWrapper.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            viewWrapper.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewWrapper.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        /*TableView*/
        tableView = UITableView()
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        viewWrapper.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        setupEndedUpScrollView()
        setupNavItems()
        setupTableView()
        bindTableView()
        
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
            navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        
        self.extendedLayoutIncludesOpaqueBars = true
        
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_help"), for: .normal)
        //    menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    func bindViewModel() {
        self.contentViewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.contentViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.contentViewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                //   self?.updateDataSource()
            }
        }
    }
    
    func updateDataSource() {
        self.dataSource.items = self.contentViewModel.listContent
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.contentViewModel.currentCell = vm
        }
        // self.dataSource.swipeActionRight = swipeActionRight()
        self.tableView.reloadData()
        log(message: "List typecode available...")
        log(object: self.contentViewModel.listContent)
    }
    
    //set dataSource fo tableView
    func bindTableView(){
        self.dataSource = TableViewDataSourceContent(items: self.listContentViewModel, configureCell: { (cell, vm) in
            cell.configView(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        })
        
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.contentViewModel.currentCell = vm
        }
        //  self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.loadMore = {
            self.log(message: "Loading more")
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        
    }
    
    func setupTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Url.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Text.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Email.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Message.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Location.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Event.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Contact.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Telephone.rawValue)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Wifi.rawValue)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
    }
    func setupEndedUpScrollView(){
        viewWrapper.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewWrapper.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewWrapper.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewWrapper.bottomAnchor)
        ])
        //          self.view.layoutIfNeeded()
    }
    
}
extension DetailVC : TableViewCellDelegate {
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    
    func cellViewLongSelected(cell: Codable) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
    
    func cellCodable(codable: Codable) {
        
    }
    
    
    func cellViewSelected(cell: TableViewCell) {
        print("\(cell.identifier) -- \(cell.lbTitle)")
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        print("\(cell.identifier) -- \(cell.lbTitle)")
        
    }
    
    func cellViewSelected(cell: Codable) {
        //  self.viewModel.doSelectItem(coable: cell)
        //    log(object: cell)
    }
}



extension DetailVC : SingleButtonDialogPresenter {
    
}
