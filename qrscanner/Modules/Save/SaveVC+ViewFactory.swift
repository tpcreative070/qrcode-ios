//
//  SaveVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension SaveVC  {
    func initUI(){
        
         tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.allowsSelection = true
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        setupTableView()
        bindTableView()
        
    }
    func setupLbNoItem(){
           if viewModel.listSave.count == 0{
               self.view.addSubview(lbNoItem)
                     NSLayoutConstraint.activate([
                      lbNoItem.topAnchor.constraint(equalTo: view.topAnchor),
                       lbNoItem.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                         lbNoItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                         lbNoItem.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                     ])
               self.lbNoItem.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
               lbNoItem.isHidden = false
           }
           else{
               lbNoItem.isHidden = true
           }
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
        setupLbNoItem()
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
 
    func setupFloatButton(){
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = AppColors.PRIMARY_COLOR
        
        item.titleLabelPosition = .left
        item.icon = UIImage(named: AppImages.IC_KEYBOARD)
        item.icon?.withTintColor(.white)
        item.title = LanguageHelper.getTranslationByKey(LanguageKey.Csv)
        item.handler = { item in
                       self.getCSVSave(listValue: self.viewModel.listSave)
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
        self.view.addSubview(floaty)
    }
}
extension SaveVC : TableViewCellDelegate{
    func cellViewLongSelected(cell: TableViewCell) {
        navigationController?.pushViewController(ChooseSaveVC(), animated: false)
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    func cellViewLongSelected(cell: Codable) {
        navigationController?.pushViewController(ChooseSaveVC(), animated: false)
    }
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
    }
    
    func cellViewSelected(cell: Codable) {
        if let data = JSONHelper.get(value: SaveViewModel.self,anyObject: cell){
            let  vc = DetailVC()
            vc.listContentViewModel = [data.content]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func cellCodable(codable: Codable) {
        let value_data = JSONHelper.get(value: SaveViewModel.self,anyObject: codable)
        let typeCode = value_data?.typeCode.uppercased()
        let content = value_data!.content
        let stringContent = content.content?.data(using: .utf8 )
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
        if typeCode == EnumType.BARCODE.rawValue{
                   var barcodeModel : BarcodeViewModel = BarcodeViewModel()
                   barcodeModel = try! JSONDecoder().decode(BarcodeViewModel.self, from: stringContent!)
                   let  vc = BarcodeVC()
                   vc.barcodeViewModel = barcodeModel
                   vc.barcodeViewModel.isSeen = AppConstants.ISSEEN
                   vc.barcodeViewModel.createDateTime = value_data!.createdDateTime
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
