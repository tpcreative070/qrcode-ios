//
//  SaveVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Floaty
extension SaveVC  {
    func initUI(){
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
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            wrapperView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        /*TableView*/
        tableView = UITableView()
        tableView.allowsSelection = true
        
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
    
    //Mark: - setUpTableView()
    func setupTableView(){
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Save.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.Save.rawValue)
        
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
        
        //
        //        self.viewModel.isSelected.bind { (value) in
        //            self.viewModel.doSelectedAll(isValue: value)
        //        }
        self.viewModel.doGetListSave()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.viewModel.listSave, by: { (headline) in
            return headline.typeCode
        })
        self.dataSource.sections = self.sections
        self.dataSource.items = self.viewModel.listSave
        self.tableView.reloadData()
        //        log(message: "List available...")
        //        log(object: self.viewModel.listHistories)
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Save.rawValue, items: self.viewModel.listSave,sections: self.sections, height: AppConstants.TABLE_ROW_HEIGHT,isSelectionStype: false){ cell, vm in
            cell.configViewSave(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        
        self.dataSource.headerSection = { section, vm in
            section.delegate = self
            section.configView(view: vm)
        }
        self.dataSource.loadMore = {
            //   self.log(message: "Loading more")
        }
        //        self.dataSource.configureSwipeCell = { cell,vm in
        //            self.log(object: vm)
        //            self.viewModel.currentCell = vm
        //        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    func setupEndedUpScrollView(){
        wrapperView.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
        //          self.view.layoutIfNeeded()
    }
    func setupFloatButton(){
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = AppColors.PRIMARY_COLOR
        
        item.titleLabelPosition = .left
        item.icon = UIImage(named: AppImages.IC_KEYBOARD)
        item.icon?.withTintColor(.white)
        item.title = LanguageHelper.getTranslationByKey(LanguageKey.Csv)
        item.handler = { item in
            let activiController = UIActivityViewController(activityItems: ["this text"], applicationActivities: nil)
            self.present(activiController,animated: true, completion: nil)
        }
        
        //    floaty.hasShadow = false
        
        let item_select = FloatyItem()
        item_select.hasShadow = false
        item_select.buttonColor = AppColors.PRIMARY_COLOR
        
        item_select.titleLabelPosition = .left
        item_select.icon = UIImage(named: AppImages.IC_SELECT_ALL)
        item_select.title = LanguageHelper.getTranslationByKey(LanguageKey.Select)
        item_select.handler = { item in
            self.navigationController?.pushViewController(ChooseSaveVC(), animated: false)
            
        }
        floaty.tintColor = .white
        floaty.addItem(item: item_select)
        floaty.addItem(item: item)
        self.wrapperView.addSubview(floaty)
    }
}
extension SaveVC : TableViewCellDelegate{
    func cellViewLongSelected(cell: TableViewCell) {
        navigationController?.pushViewController(ChooseHistoryVC(), animated: false)
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    func cellViewLongSelected(cell: Codable) {
        navigationController?.pushViewController(ChooseHistoryVC(), animated: false)
    }
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let result = self.viewModel.listSave[indexPath.row]
        print("save select: \(result)")
    }
    
    func cellViewSelected(cell: Codable) {
        if let data = JSONHelper.get(value: SaveViewModel.self,anyObject: cell){
            print(data.typeCode)
            print(data.content.content!)
            let value = data.content
            let  vc = DetailVC()
            vc.listContentViewModel = [ContentViewModel(data: value)]
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func cellCodable(codable: Codable) {
        let value_data = JSONHelper.get(value: SaveViewModel.self,anyObject: codable)
        let typeCode = value_data?.typeCode.uppercased()
        let content = value_data!.content
        let stringContent = content.content?.data(using: .utf8 )
        print(stringContent)
        if typeCode == EnumType.URL.rawValue{
            let urlModel : UrlViewModel = try! JSONDecoder().decode(UrlViewModel.self, from: stringContent!)
            let  vc = UrlGenerateVC()
            vc.urlViewModel = urlModel
            vc.urlViewModel.isSeen = AppConstants.ISSEEN
            vc.urlViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.WIFI.rawValue{
            let wifiModel : WifiViewModel = try! JSONDecoder().decode(WifiViewModel.self, from: stringContent!)
            let  vc = WifiGenerateVC()
            vc.wifiViewModel = wifiModel
            vc.wifiViewModel.isSeen = AppConstants.ISSEEN
            vc.wifiViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.TELEPHONE.rawValue{
            let phoneModel : PhoneViewModel = try! JSONDecoder().decode(PhoneViewModel.self, from: stringContent!)
            let  vc = PhoneGenerateVC()
            vc.phoneViewModel = phoneModel
            vc.phoneViewModel.isSeen = AppConstants.ISSEEN
            vc.phoneViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.TEXT.rawValue{
            let textModel : TextViewModel = try! JSONDecoder().decode(TextViewModel.self, from: stringContent!)
            let  vc = TextGenerateVC()
            vc.textViewModel = textModel
            vc.textViewModel.isSeen = AppConstants.ISSEEN
            vc.textViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.CONTACT.rawValue{
            let contactModel : ContactViewModel = try! JSONDecoder().decode(ContactViewModel.self, from: stringContent!)
            let  vc = ContactGenerateVC()
            vc.contactViewModel = contactModel
            vc.contactViewModel.isSeen = AppConstants.ISSEEN
            vc.contactViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.EVENT.rawValue{
            let eventModel : EventViewModel = try! JSONDecoder().decode(EventViewModel.self, from: stringContent!)
            let  vc = EventGenerateVC()
            vc.eventViewModel = eventModel
            vc.eventViewModel.isSeen = AppConstants.ISSEEN
            vc.eventViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.LOCATION.rawValue{
            let locationModel : LocationViewModel = try! JSONDecoder().decode(LocationViewModel.self, from: stringContent!)
            let  vc = LocationGenerateVC()
            vc.locationViewModel = locationModel
            vc.locationViewModel.isSeen = AppConstants.ISSEEN
            vc.locationViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.MESSAGE.rawValue{
            let messageModel : MessageViewModel = try! JSONDecoder().decode(MessageViewModel.self, from: stringContent!)
            let  vc = MessageGenerateVC()
            vc.messageViewModel = messageModel
            vc.messageViewModel.isSeen = AppConstants.ISSEEN
            vc.messageViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == EnumType.EMAIL.rawValue{
            var emailModel : EmailViewModel = EmailViewModel()
            emailModel = try! JSONDecoder().decode(EmailViewModel.self, from: stringContent!)
            let  vc = EmailGenerateVC()
            vc.emailViewModel = emailModel
            vc.emailViewModel.isSeen = AppConstants.ISSEEN
            vc.emailViewModel.createDateTime = value_data!.createdDateTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
}

extension SaveVC : SingleButtonDialogPresenter{
    
}

extension SaveVC : HeaderSectionDelegate {
    func cellSectionSelected(codable: Codable) {
        print(codable)
    }
}
