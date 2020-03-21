//
//  ChooseHistoryVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Floaty
extension ChooseHistoryVC  {
    func initUI(){
        setupNavItems()
        
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
        
        //        /*Lable*/
        //        wrapperView.addSubview(lbTittle)
        //        NSLayoutConstraint.activate([
        //            lbTittle.topAnchor.constraint(equalTo: imgDetele.topAnchor, constant: 15),
        //            lbTittle.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
        //            lbTittle.heightAnchor.constraint(equalToConstant: 20),
        //        ])
        //
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
        
        //        self.view.layoutIfNeeded()
        
        setupEndedUpScrollView()
        setupTableView()
        bindTableView()
        
    }
    
    //Mark: - setUpTableView()
    func setupTableView(){
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.HistoryChoose.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.HistoryChoose.rawValue)
        
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
                self?.navigationItem.title = "\(String(describing: self!.viewModel.countItemSelected)) selected"
                self?.updateDataSource()
            }
        }

        
        
//                self.viewModel.isSelected.bind { (value) in
//                    self.viewModel.doSelectedAll(isValue: value)
//                }
        self.viewModel.doGetListHistories()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.viewModel.listHistories, by: { (headline) in
            return headline.typeCode
        })
        self.dataSource.sections = self.sections
        self.dataSource.items = self.viewModel.listHistories
        self.tableView.reloadData()
        //        log(message: "List available...")
        //        log(object: self.viewModel.listHistories)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white

        
        let menuButtonRightDel = UIButton(type: .system)
        menuButtonRightDel.setImage(#imageLiteral(resourceName: "ic_delete"), for: .normal)
        menuButtonRightDel.addTarget(self, action: #selector(doDeleteItem), for: .touchUpInside)

       
        
        let menuButtonRightSelectAll = UIButton(type: .system)
        menuButtonRightSelectAll.setImage(#imageLiteral(resourceName: "ic_select_all"), for: .normal)
        menuButtonRightSelectAll.addTarget(self, action: #selector(doSelectAll), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView:menuButtonRightSelectAll),UIBarButtonItem(customView: menuButtonRightDel)]
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.HistoryChoose.rawValue, items: self.viewModel.listHistories,sections: self.sections, height: 40,isSelectionStype: .none){ cell, vm in
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
        wrapperView.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
        //          self.view.layoutIfNeeded()
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
        let result = self.viewModel.listHistories[indexPath.row]
        print("history select: \(result)")
    }
    
    func cellViewSelected(cell: Codable) {
        self.viewModel.doSelectItem(coable: cell)
        //        if flagselectItem {
        //
        //
        //        }
        //        else
        //        {
        //        print(JSONSerializerHelper.toJson(cell))
        //
        //        if let data = JSONHelper.get(value: HistoryViewModel.self,anyObject: cell){
        //            print(data.typeCode)
        //            print(data.content.content!)
        //            let data_content = data.content.content!
        //                        let  vc = DetailGenerateVC()
        //                        vc.typeCode = data.typeCode
        //                        vc.valueContent = data_content
        //                        self.navigationController?.pushViewController(vc, animated: true)
        //        }
        //        }
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
        print(codable)
    }
}
