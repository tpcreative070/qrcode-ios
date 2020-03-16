//
//  EmailGenerate+Detail+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/16/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension EmailGenerateVC  {
   
    func setupDetailView(){
        view.addSubview(backgroundView)
             NSLayoutConstraint.activate([
                 backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                          backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                          backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                          backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                         
                      ])
               backgroundView.addSubview(emailLbL)
                   NSLayoutConstraint.activate([
                       emailLbL.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                       emailLbL.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                       emailLbL.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                   ])
                backgroundView.addSubview(emailTxt)
                   NSLayoutConstraint.activate([
                       emailTxt.topAnchor.constraint(equalTo: emailLbL.bottomAnchor, constant: 5),
                       emailTxt.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                       emailTxt.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                   ])
             
               backgroundView.addSubview(objectEmailLbL)
                  NSLayoutConstraint.activate([
                      objectEmailLbL.topAnchor.constraint(equalTo: emailTxt.bottomAnchor, constant: 10),
                      objectEmailLbL.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                      objectEmailLbL.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                  ])
                  backgroundView.addSubview(objectEmailTxt)
                  NSLayoutConstraint.activate([
                      objectEmailTxt.topAnchor.constraint(equalTo: objectEmailLbL.bottomAnchor, constant: 5),
                      objectEmailTxt.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                      objectEmailTxt.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                  ])

               
           
                     backgroundView.addSubview(messageEmailLbL)
                        NSLayoutConstraint.activate([
                            messageEmailLbL.topAnchor.constraint(equalTo: objectEmailTxt.bottomAnchor, constant: 10),
                            messageEmailLbL.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                            messageEmailLbL.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                        ])
                        backgroundView.addSubview(messageEmailTxt)
                        NSLayoutConstraint.activate([
                            messageEmailTxt.topAnchor.constraint(equalTo: messageEmailLbL.bottomAnchor, constant: 5),
                            messageEmailTxt.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                            messageEmailTxt.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                        ])
        backgroundView.addSubview(tableView)
        
                tableView.allowsSelection = true

                tableView.isScrollEnabled = true
                tableView.backgroundColor = .white
                tableView.separatorStyle = .none
                tableView.estimatedRowHeight = AppConstants.TABLE_ROW_HEIGHT
                tableView.sectionFooterHeight = 0
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: messageEmailTxt.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Generate.rawValue)
        bindViewModelDetail()
        bindTableView()
    }

    func bindViewModelDetail() {
        self.viewModelTypeCode.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.viewModelTypeCode.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModelTypeCode.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
               self?.updateDataSource()
            }
        }
        self.viewModelTypeCode.doIntro()
    }
    
    func updateDataSource() {
        self.dataSource.items = self.viewModelTypeCode.list
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.viewModelTypeCode.currentCell = vm
        }
       // self.dataSource.swipeActionRight = swipeActionRight()
        self.tableView.reloadData()
        log(message: "List typecode available...")
        log(object: self.viewModelTypeCode.list)
    }
       func bindTableView(){
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.Generate.rawValue, items: self.viewModelTypeCode.list,isSelectionStype: false){ cell, vm in
            cell.configView(viewModel: vm)
            cell.configData(viewModel: vm)
            cell.delegate = self
        }
        self.dataSource.configureSwipeCell = { cell,vm in
            self.log(object: vm)
            self.viewModelTypeCode.currentCell = vm
        }
      //  self.dataSource.swipeActionRight = swipeActionRight()
        self.dataSource.loadMore = {
            self.log(message: "Loading more")
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    

}
extension EmailGenerateVC : TableViewCellDelegate {
func cellViewSelected(cell: TableViewCell) {
    print("\(cell.identifier) -- \(cell.lbTitle)")
    
}

func cellViewSelected(cell: TableViewCell, countSelected: Int) {
    print("\(cell.identifier) -- \(cell.lbTitle)")

}

func cellViewSelected(cell: Codable) {
 print("select")
}

func cellCodable(codable: Codable) {
    print("cellCodable")
}
func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
      print("\(cell.identifier) -- \(cell.lbTitle)")

}

}
