//
//  ChooseHistoryVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ChooseHistoryVC  {
    func initUI(){
        
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
            viewWrapper.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            viewWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewWrapper.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        /*TableView*/
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.allowsSelection = true
        
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
        setupNavItems()
        setupFloatButton()
        setupEndedUpScrollView()
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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.HistoryChoose.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.HistoryChoose.rawValue)
    }
    func bindViewModel() {
//        self.historyViewModel.showLoading.bind { visible in
//            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
//        }
        self.historyViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.historyViewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                self?.navigationItem.title = "\(String(describing: self!.historyViewModel.countItemSelected)) \(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Selected)!))"
                self?.updateDataSource()
            }
        }
        self.historyViewModel.doGetListHistories()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.historyViewModel.listHistories, by: { (headline) in
            return headline.typeCode
        })
        self.dataSource.sections = self.sections
        self.dataSource.items = self.historyViewModel.listHistories
        self.tableView.reloadData()
        self.historyViewModel.showLoading.value = false

    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        
        let menuButtonRightDel = UIButton(type: .system)
        menuButtonRightDel.setImage(UIImage(named: AppImages.IC_DELETE), for: .normal)
        menuButtonRightDel.addTarget(self, action: #selector(doDeleteItem), for: .touchUpInside)
        
        
        
        let menuButtonRightSelectAll = UIButton(type: .system)
        menuButtonRightSelectAll.setImage(UIImage(named: AppImages.IC_SELECT_ALL), for: .normal)
        menuButtonRightSelectAll.addTarget(self, action: #selector(doSelectAll), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRightDel),UIBarButtonItem(customView:menuButtonRightSelectAll)]
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.HistoryChoose.rawValue, items: self.historyViewModel.listHistories,sections: self.sections, height: AppConstants.TABLE_ROW_HEIGHT,isSelectionStype: .none){ cell, vm in
            cell.configView(view: vm)
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
        viewWrapper.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewWrapper.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewWrapper.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewWrapper.bottomAnchor)
        ])
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
            self.getCSVHistory(listValue: self.historyViewModel.listHistories)
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
        self.viewWrapper.addSubview(floaty)
        
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
extension ChooseHistoryVC : TableViewCellDelegate{
    func cellViewLongSelected(cell: TableViewCell) {
        
    }
    
    func cellViewLongSelected(cell: Codable) {
        //        navigationController?.pushViewController(ChooseHistoryVC, animated: false)
    }
    
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let result = self.historyViewModel.listHistories[indexPath.row]
        print("history select: \(result)")
    }
    
    func cellViewSelected(cell: Codable) {
        self.historyViewModel.doSelectItem(coable: cell)
    }
    
    func cellCodable(codable: Codable) {
        
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
}
extension ChooseHistoryVC : SingleButtonDialogPresenter{
    
}

extension ChooseHistoryVC : HeaderSectionDelegate {
    func cellSectionSelected(codable: Codable) {
    }
}
