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
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
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
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
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
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Save.rawValue, items: self.viewModel.listSave,sections: self.sections, height: 40,isSelectionStype: false){ cell, vm in
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
        item.icon = UIImage(named: "ic_keyboard")
        item.icon?.withTintColor(.white)
        item.title = LanguageKey.Csv
        item.handler = { item in
            let activiController = UIActivityViewController(activityItems: ["this text"], applicationActivities: nil)
            self.present(activiController,animated: true, completion: nil)
        }
        
        //    floaty.hasShadow = false
        
        let item_select = FloatyItem()
        item_select.hasShadow = false
        item_select.buttonColor = AppColors.PRIMARY_COLOR
        
        item_select.titleLabelPosition = .left
        item_select.icon = UIImage(named: "ic_select_all")
        item_select.title = LanguageKey.Select
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
                  vc.listContent = [ContentViewModel(data: value)]
                  self.navigationController?.pushViewController(vc, animated: true)
                  
              }
    }
    
    func cellCodable(codable: Codable) {
        let value_data = JSONHelper.get(value: SaveViewModel.self,anyObject: codable)
        let typeCode = value_data?.typeCode.uppercased()
        let content = value_data!.content
        let stringContent = content.content?.data(using: .utf8 )
        if typeCode == LanguageKey.Url{
            let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent!)
            let  vc = UrlGenerateVC()
            vc.urlValue = urlModel
            vc.createDateTime = value_data!.createdDateTime
            vc.isSeen = AppConstants.ISSEEN
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == LanguageKey.Wifi{
            let wifiModel : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent!)
            let  vc = WifiGenerateVC()
            vc.wifiValue = wifiModel
            vc.createDateTime = value_data!.createdDateTime
            vc.isSeen = AppConstants.ISSEEN
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == LanguageKey.Telephone{
            let phoneModel : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent!)
            let  vc = PhoneGenerateVC()
            vc.phoneValue = phoneModel
            vc.createDateTime = value_data!.createdDateTime
            vc.isSeen = AppConstants.ISSEEN
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if typeCode == LanguageKey.Text{
                  let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent!)
                  let  vc = TextGenerateVC()
                  vc.textValue = textModel
                  vc.createDateTime = value_data!.createdDateTime
                  vc.isSeen = AppConstants.ISSEEN
                  self.navigationController?.pushViewController(vc, animated: true)
              }
        if typeCode == LanguageKey.Contact{
                  let contactModel : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent!)
                  let  vc = ContactGenerateVC()
                  vc.contactValue = contactModel
                  vc.createDateTime = value_data!.createdDateTime
                  vc.isSeen = AppConstants.ISSEEN
                  self.navigationController?.pushViewController(vc, animated: true)
              }
        if typeCode == LanguageKey.Event{
                  let eventModel : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent!)
                  let  vc = EventGenerateVC()
                  vc.eventValue = eventModel
                  vc.createDateTime = value_data!.createdDateTime
                  vc.isSeen = AppConstants.ISSEEN
                  self.navigationController?.pushViewController(vc, animated: true)
              }
        if typeCode == LanguageKey.Location{
                  let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent!)
                  let  vc = LocationGenerateVC()
                  vc.locationValue = locationModel
                  vc.createDateTime = value_data!.createdDateTime
                  vc.isSeen = AppConstants.ISSEEN
                  self.navigationController?.pushViewController(vc, animated: true)
              }
        if typeCode == LanguageKey.Message{
                  let messageModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent!)
                  let  vc = MessageGenerateVC()
                  vc.messageValue = messageModel
                  vc.createDateTime = value_data!.createdDateTime
                  vc.isSeen = AppConstants.ISSEEN
                  self.navigationController?.pushViewController(vc, animated: true)
              }
        if typeCode == LanguageKey.Email{
            let emailModel : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent!)
            let  vc = EmailGenerateVC()
            vc.emailValue = emailModel
            vc.createDateTime = value_data!.createdDateTime
            vc.isSeen = AppConstants.ISSEEN
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
