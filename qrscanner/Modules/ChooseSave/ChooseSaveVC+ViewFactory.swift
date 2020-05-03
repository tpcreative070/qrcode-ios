//
//  ChooseSaveVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ChooseSaveVC  {
    func initUI(){
        setupNavItems()
       
        /*TableView*/
         tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.allowsSelection = true
        
        tableView.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        tableView.separatorStyle = .none
        
        tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
        tableView.sectionFooterHeight = 0
        tableView.showsVerticalScrollIndicator = false

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        setupFloatButton()
        setupTableView()
        bindTableView()
        
    }
    
    func setupLeftButton(){
        let navButton = Helper.addLeftBackButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }
    
    //Mark: - setUpTableView()
    func setupTableView(){
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.SaveChoose.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.SaveChoose.rawValue)
        
    }
    func bindViewModel() {
        self.saveViewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.saveViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.saveViewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                self?.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                self?.navigationItem.title = "\(String(describing: self!.saveViewModel.countItemSelected)) \(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Selected)!))"
                let attributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
                self?.navigationController?.navigationBar.titleTextAttributes = attributes
                self?.updateDataSource()
            }
        }
        self.saveViewModel.doGetListSave()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.saveViewModel.listSave, by: { (headline) in
            return headline.typeCode
        })
        self.sections.sort { (lhs, rhs) in lhs.rowItems[0].updatedDateTime > rhs.rowItems[0].updatedDateTime }

        self.dataSource.sections = self.sections
        self.dataSource.items = self.saveViewModel.listSave
        self.tableView.reloadData()
    }
    func setupNavItems() {
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        
        let menuButtonRightDel = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRightDel.setBackgroundImage(UIImage(named: AppImages.IC_DELETE), for: .normal)
        
        menuButtonRightDel.addTarget(self, action: #selector(doDeleteItem), for: .touchUpInside)
        let menuButtonRightSelectAll = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRightSelectAll.setBackgroundImage(UIImage(named: AppImages.IC_SELECT_ALL), for: .normal)
        menuButtonRightSelectAll.addTarget(self, action: #selector(doSelectAll), for: .touchUpInside)
        
      if DeviceHelper.isIpad() {
               navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRightDel),UIBarButtonItem(customView: menuButtonRightSelectAll)]
           }
           else{
           
        let stackview = UIStackView.init(arrangedSubviews: [menuButtonRightSelectAll,menuButtonRightDel])
                  stackview.distribution = .fillEqually
                  stackview.axis = .horizontal
                  stackview.alignment = .fill
                  stackview.spacing = 8
               navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackview)
           }
        
       
        
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.SaveChoose.rawValue, items: self.saveViewModel.listSave,sections: self.sections, height: AppConstants.TABLE_ROW_HEIGHT,isSelectionStype: .none){ cell, vm in
            cell.configView(view: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        
        self.dataSource.headerSection = { section, vm in
            section.delegate = self
            section.configView(view: vm)
        }
        self.dataSource.loadMore = {
        }
        
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
            self.getCSVSave(listValue: self.saveViewModel.listSave)
        }
        
        let item_select = FloatyItem()
        item_select.hasShadow = false
        item_select.buttonColor = AppColors.PRIMARY_COLOR
        
        item_select.titleLabelPosition = .left
        item_select.icon = UIImage(named: AppImages.IC_SELECT_ALL)
        item_select.title = LanguageHelper.getTranslationByKey(LanguageKey.Select)
        item_select.handler = { item in
        }
        floaty.tintColor = .white
        
        floaty.addItem(item: item_select)
        floaty.addItem(item: item)
        
        self.view.addSubview(floaty)
        
    }
    // MARK: - Floaty Delegate Methods
    func floatyWillOpen(_ floaty: Floaty) {
    }
    
    func floatyDidOpen(_ floaty: Floaty) {
    }
    
    func floatyWillClose(_ floaty: Floaty) {
    }
    
    func floatyDidClose(_ floaty: Floaty) {
    }
    
}
extension ChooseSaveVC : TableViewCellDelegate{
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    func cellViewLongSelected(cell: Codable) {
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
       // guard let indexPath = tableView.indexPath(for: cell) else { return }
     //   let result = self.saveViewModel.listSave[indexPath.row]
    }
    
    func cellViewSelected(cell: Codable) {
        self.saveViewModel.doSelectItem(coable: cell)
    }
    
    func cellCodable(codable: Codable) {
        
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
}
extension ChooseSaveVC : SingleButtonDialogPresenter{
    
}

extension ChooseSaveVC : HeaderSectionDelegate {
    func cellSectionSelected(codable: Codable) {
    }
}
