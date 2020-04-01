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
        menuButtonRight.setImage(UIImage(named: AppImages.IC_SUPPORT), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(actionHelp), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    func bindViewModel() {
        self.contentViewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.contentViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
//        self.contentViewModel.responseToView = {[weak self] value in
//            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
//                   self?.updateDataSource()
//            }
//        }
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
        
        let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: cell)
        let value_data = valueContentView?.content
        let stringContent = value_data!.data(using: .utf8)!
        let typeCode = valueContentView?.typeCode?.uppercased()
        if typeCode == EnumType.URL.rawValue{
            let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent)
            let vc = AlertVC()
            var list : [AlertViewModel] = [AlertViewModel]()
            list.append(AlertViewModel(name: urlModel.url ?? ""))
            vc.viewModel.listItem = list
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.TEXT.rawValue{
            let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: textModel.text ?? ""))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.LOCATION.rawValue{
            let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: String(locationModel.latitude ?? 0) ))
            vc.viewModel.listItem.append(AlertViewModel(name: String(locationModel.longtitude ?? 0) ))
            vc.viewModel.listItem.append(AlertViewModel(name: String(locationModel.query ?? "") ))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.EMAIL.rawValue{
            let model : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.email ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.messageEmail ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.objectEmail ?? "" ))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.EVENT.rawValue{
            
            let model : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.title ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.description ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.location ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.beginTime ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.beginTime ?? "" ))
            
            self.navigationController?.pushViewController(vc, animated: false)
            
        }
        else if typeCode == EnumType.MESSAGE.rawValue{
            
            let model : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.to ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.message ?? "" ))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.WIFI.rawValue{
            
            let model : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.ssid ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.password ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.protect ?? "" ))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.TELEPHONE.rawValue{
            
            let model : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.phone ?? "" ))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if typeCode == EnumType.CONTACT.rawValue{
            
            let model : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent)
            let vc = AlertVC()
            vc.viewModel.listItem.append(AlertViewModel(name: model.fullNameContact ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.emailContact ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.addressContact ?? "" ))
            vc.viewModel.listItem.append(AlertViewModel(name: model.phoneContact ?? "" ))
            
            self.navigationController?.pushViewController(vc, animated: false)
        }
       
    }
}



extension DetailVC : SingleButtonDialogPresenter {
    
}
