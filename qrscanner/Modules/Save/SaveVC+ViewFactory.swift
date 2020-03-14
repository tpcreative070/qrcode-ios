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
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            wrapperView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        /*Lable*/
        wrapperView.addSubview(lbTittle)
        NSLayoutConstraint.activate([
            lbTittle.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 15),
            lbTittle.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            lbTittle.heightAnchor.constraint(equalToConstant: 20),
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
        //        self.view.layoutIfNeeded()
        
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
            //            else if value == EnumResponseToView.MULTIPLE_SELECTED_DONE.rawValue {
            //                self?.doMultipleSelected()
            //            }
        }
        
        self.viewModel.doGetListSave()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.viewModel.listSave, by: { (headline) in
            return headline.typeCode
        })
        //        self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.sections = self.sections
        self.dataSource.items = self.viewModel.listSave
        self.tableView.reloadData()
        //        log(message: "List available...")
        //        log(object: self.viewModel.listHistories)
    }
    
    func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Save.rawValue, items: self.viewModel.listSave,sections: self.sections, height: 40,isSelectionStype: false){ cell, vm in
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
        //self.dataSource.swipeActionRight = swipeActionRight()
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
extension SaveVC : TableViewCellDelegate{
    func cellViewSelected(cell: TableViewCell) {
        
    }
    
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        
    }
    
    func cellViewSelected(cell: Codable) {
        print(cell)
        if let data = JSONHelper.get(value: ListQRCodeViewModel.self,anyObject: cell){
            print(data.typeCode)
            print(data.content)
            //    print(data.contents)
            // let blogPost: UrlModel = try! JSONDecoder().decode(UrlModel.self, from: data.content)
            //            self.content = blogPost.url ?? ""
         //   navigationToDetail(typeCode: data.typeCode, content: data.content)
        }
        //       let vc = EmailGenerateVC()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
    func navigationToDetail(typeCode: String, content: String){
        //  var vc : UIViewController? = UIViewController()
        let typeCode = typeCode.uppercased()
        if typeCode == LanguageKey.Url{
            let  vc = UrlGenerateVC()
            vc.isSeen = AppConstants.ISSEEN
            vc.urlSeen = content
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if typeCode == LanguageKey.Text{
            //  vc = TextGenerateVC()
            
        }
        else if typeCode == LanguageKey.Location{
            //  vc = LocationGenerateVC()
            
        }
        else if typeCode == LanguageKey.Email{
            //   vc = EmailGenerateVC()
            print("Email")
        }
        else if typeCode == LanguageKey.Event{
            //  vc = EventGenerateVC()
        }
        else if typeCode == LanguageKey.Message{
            // vc = MessageGenerateVC()
            
        }
        else if typeCode == LanguageKey.Wifi{
            // vc = WifiGenerateVC()
        }
        else if typeCode == LanguageKey.Telephone{
            // vc = PhoneGenerateVC()
        }
        else if typeCode == LanguageKey.Contact{
            // vc = ContactGenerateVC()
            
        }
        // print(vc)
        
    }
    func cellCodable(codable: Codable) {
        
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
