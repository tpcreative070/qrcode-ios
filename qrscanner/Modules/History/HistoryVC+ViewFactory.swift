//
//  HistoryVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension HistoryVC {
    func initUI(){
        self.navigationController?.isNavigationBarHidden = true
        setupTableView()
        setupLabel()
        bindTableView()
    }
    func setupLabel(){
        view.addSubview(lbTittle)
        NSLayoutConstraint.activate([
            lbTittle.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            lbTittle.leftAnchor.constraint(equalTo: view.leftAnchor),
            lbTittle.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
    
    //Mark: - setUpTableView()
    func setupTableView(){
        tableView = UITableView()
        tableView.allowsSelection = true
        if(DeviceHelper.isSmallScreen()){
            tableView.isScrollEnabled = true
        }else{
            tableView.isScrollEnabled = false
        }
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.History.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.History.rawValue)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        var mHeightCell = AppConstants.MENU_FOOTER_SIZE
        if DeviceHelper.isMaxScreen() {
            mHeightCell = AppConstants.MENU_HEIGHT_CELL_MAX_SIZE
        }
        else if DeviceHelper.isPlusScreen() {
            mHeightCell = AppConstants.MENU_HEIGHT_CELL_PLUS_SIZE
        }
        if DeviceHelper.isNormalScreen(){
            mHeightCell = AppConstants.MENU_HEIGHT_CELL_NORMAL_SIZE
        }
        else if DeviceHelper.isSmallScreen(){
            mHeightCell = AppConstants.MENU_HEIGHT_CELL_SMALL_SIZE
        }
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
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
                self?.updateDataSource()
            }
            //            else if value == EnumResponseToView.MULTIPLE_SELECTED_DONE.rawValue {
            //                self?.doMultipleSelected()
            //            }
        }
        
        self.viewModel.doGetListHistories()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.viewModel.listHistories, by: { (headline) in
            return headline.typeCode
        })
        //self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.sections = self.sections
        self.dataSource.items = self.viewModel.listHistories
        self.tableView.reloadData()
        log(message: "List available...")
        log(object: self.viewModel.listHistories)
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.History.rawValue, items: self.viewModel.listHistories,sections: self.sections, height: 30,isSelectionStype: false){ cell, vm in
            cell.configView(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        
        self.dataSource.headerSection = { section, vm in
            section.delegate = self
            section.configView(view: vm)
        }
        self.dataSource.loadMore = {
            self.log(message: "Loading more")
        }
        //        self.dataSource.configureSwipeCell = { cell,vm in
        //            self.log(object: vm)
        //            self.viewModel.currentCell = vm
        //        }
        //self.dataSource.swipeActionRight = swipeActionRight()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
}
extension HistoryVC : TableViewCellDelegate{
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        
    }
    
    func cellViewSelected(cell: Codable) {
        // self.viewModel.doSelectItem(coable: cell)
        //log(object: cell)
    }
    
    func cellCodable(codable: Codable) {
        
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
}
extension HistoryVC : SingleButtonDialogPresenter{
    
}

extension HistoryVC : HeaderSectionDelegate {
    func cellSectionSelected(codable: Codable) {
        
    }
}
