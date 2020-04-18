//
//  TypeCodeVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension AlertVC {
    func initUI(){
        /*SetupScrollView*/
        view.backgroundColor = UIColor.lightGray
        self.view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        self.viewBackground.addSubview(wrapperView)
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP_ALERT),
            wrapperView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM_ALERT),
            wrapperView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            wrapperView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
        ])
        
        self.wrapperView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.wrapperView.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.wrapperView.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.wrapperView.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.wrapperView.leadingAnchor),
        ])
        self.wrapperView.addSubview(lbAleart)
        NSLayoutConstraint.activate([
            lbAleart.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbAleart.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            lbAleart.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
        ])
        self.wrapperView.addSubview(lbContent)
        NSLayoutConstraint.activate([
            lbContent.topAnchor.constraint(equalTo: lbAleart.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            lbContent.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            lbContent.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
        ])
        /*TableView*/
        tableView = UITableView()
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        wrapperView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor),
            tableView.topAnchor.constraint(equalTo: lbContent.bottomAnchor, constant: AppConstants.MARGIN_TOP)
        ])
        self.viewBackground.addSubview(btnCancel)
        NSLayoutConstraint.activate([
            btnCancel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            btnCancel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_ALERT_BTN),
            btnCancel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            btnCancel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: AppConstants.MARGIN_LEFT_ALERT_BTN),
            btnCancel.heightAnchor.constraint(equalToConstant: AppConstants.MARGIN_TOP_CONTAINER)
            
        ])
        self.viewBackground.addSubview(btnOK)
        NSLayoutConstraint.activate([
            btnOK.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            btnOK.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            btnOK.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            btnOK.heightAnchor.constraint(equalToConstant: AppConstants.MARGIN_TOP_CONTAINER),
            btnOK.widthAnchor.constraint(equalToConstant: AppConstants.MARGIN_TOP_ALERT)
            
        ])
        
        
        self.lbAleart.font = DeviceHelper.isIpad() ? AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE) : AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbContent.font = DeviceHelper.isIpad() ? AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE) : AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        let tapCopy = UITapGestureRecognizer(target: self, action: #selector(copyItem(sender:)))
        self.btnOK.addGestureRecognizer(tapCopy)
        let tapCancel = UITapGestureRecognizer(target: self, action: #selector(closeAlert(sender:)))
        self.btnCancel.addGestureRecognizer(tapCancel)
        let tapBg = UITapGestureRecognizer(target: self, action: #selector(closeAlert(sender:)))
        self.viewBackground.addGestureRecognizer(tapBg)
//
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
                self?.updateDataSource()
            }
        }
    }
    
    func updateDataSource() {
        self.dataSource.items = self.viewModel.listItem
        self.dataSource.configureSwipeCell = { cell,vm in
            //   self.log(object: vm)
            self.viewModel.currentCell = vm
        }
        self.tableView.reloadData()
        //   log(message: "List typecode available...")
        //  log(object: self.viewModel.listTypeCondeViewModel)
    }
    
    //set dataSource fo tableView
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Alert.rawValue, items: self.viewModel.listItem,isSelectionStype: false){ cell, vm in
            cell.configView(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        self.dataSource.configureSwipeCell = { cell,vm in
            // self.log(object: vm)
            self.viewModel.currentCell = vm
        }
        //  self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.loadMore = {
            // self.log(message: "Loading more")
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    func checkAutoCopy(){
           if Bool(CommonService.getUserDefault(key: KeyUserDefault.Copy) ?? false){
           var string = ""
           for item in viewModel.listItem {
            string += "\(item.nameItemView)\n"
           }
           let pasteboard = UIPasteboard.general
           pasteboard.string = string
           }
           else{}
       }
    func setupTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Alert.rawValue)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
    }
}
extension AlertVC : TableViewCellDelegate {
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    
    func cellViewLongSelected(cell: Codable) {
        
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        
    }
    
    func cellViewSelected(cell: Codable) {
              self.viewModel.doSelectItem(coable: cell)
    }
    
    func cellCodable(codable: Codable) {
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
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
extension AlertVC : SingleButtonDialogPresenter {
    
}
