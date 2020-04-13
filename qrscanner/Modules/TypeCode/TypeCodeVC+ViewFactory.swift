//
//  TypeCodeVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension TypeCodeVC {
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
           self.scrollView.addSubview(wrapperView)
           NSLayoutConstraint.activate([
             wrapperView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
             wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             wrapperView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
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
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        setupEndedUpScrollView()
        setupTableView()
        bindTableView()
        
    }

    func bindViewModel() {
//        self.viewModel.showLoading.bind { visible in
//            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
//        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
               self?.updateDataSource()
            }
        }
        self.viewModel.getList()
    }
    
    func updateDataSource() {
         self.dataSource.items = self.viewModel.listTypeCondeViewModel
        self.dataSource.configureSwipeCell = { cell,vm in
            self.viewModel.currentCell = vm
        }
        self.tableView.reloadData()

    }
    
    //set dataSource fo tableView
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Generate.rawValue, items: self.viewModel.listTypeCondeViewModel,isSelectionStype: false){ cell, vm in
            cell.configView(viewModel: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        self.dataSource.configureSwipeCell = { cell,vm in
            self.viewModel.currentCell = vm
        }
      //  self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.loadMore = {
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    func setupTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Generate.rawValue)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
    }
  }
extension TypeCodeVC : TableViewCellDelegate {
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    
    func cellViewLongSelected(cell: Codable) {
        
    }
    
    func cellViewSelected(cell: TableViewCell) {
        print("\(cell.identifier) -- \(cell.lbTitle)")
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        print("\(cell.identifier) -- \(cell.lbTitle)")

    }
    
    func cellViewSelected(cell: Codable) {
        if let data = JSONHelper.get(value: TypeCodeModel.self,anyObject: cell){
            navigationToAddGenerateVC(typeCode: data.name!)
        }
    }
    
    func cellCodable(codable: Codable) {
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
          print("\(cell.identifier) -- \(cell.lbTitle)")
    }
    func navigationToAddGenerateVC(typeCode: String){
        var vc : UIViewController? = UIViewController()
       let typeCode = typeCode.uppercased()
        if typeCode == EnumType.URL.rawValue{
                vc = UrlGenerateVC()
              }
              else if typeCode == EnumType.TEXT.rawValue{
                  vc = TextGenerateVC()
              }
              else if typeCode == EnumType.LOCATION.rawValue{
                  vc = LocationGenerateVC()
              }
              else if typeCode == EnumType.EMAIL.rawValue{
                 vc = EmailGenerateVC()
              }
              else if typeCode == EnumType.EVENT.rawValue{
                 vc = EventGenerateVC()
              }
              else if typeCode == EnumType.MESSAGE.rawValue{
                vc = MessageGenerateVC()

              }
              else if typeCode == EnumType.WIFI.rawValue{
                 vc = WifiGenerateVC()
              }
              else if typeCode == EnumType.TELEPHONE.rawValue{
                  vc = PhoneGenerateVC()
              }
              else if typeCode == EnumType.CONTACT.rawValue{
              vc = ContactGenerateVC()

              }
        else if typeCode == EnumType.BARCODE.rawValue{
                     vc = BarcodeVC()
                     }
        Navigator.pushViewController(from: self, to: vc!, isNavigation: true, isTransparent: false)
        
      //  self.navigationController?.pushViewController(vc!, animated: true)
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
extension TypeCodeVC : SingleButtonDialogPresenter {
    
}
