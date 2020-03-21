//
//  DetailGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension DetailGenerateVC {
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
        wrapperView.addSubview(tableView)
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = view.frame.height
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
        
        
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        navigationItem.title = typeCode
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        
        self.extendedLayoutIncludesOpaqueBars = true
        
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_help"), for: .normal)
        //    menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
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
        if typeCode == LanguageKey.Url {
            let jsonData = valueContent.data(using: .utf8)!
            let urlData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            print(urlData.url!)
            viewModel.urlValue = urlData.url!
            self.viewModel.getListUrl()
        }
        else if typeCode == LanguageKey.Text{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            print(data.text!)
            viewModel.textValue = data.text!
            self.viewModel.getListText()
            
        }
        else if typeCode == LanguageKey.Telephone{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            print(data.phone)
            viewModel.phoneValue = data.phone
            self.viewModel.getListPhone()
            
        }
        else if typeCode == LanguageKey.Email{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            viewModel.toemail = data.email!
            viewModel.subjectemail = data.objectEmail!
            viewModel.messageemail = data.messageEmail!
            self.viewModel.getListEmail()
            
        }
        else if typeCode == LanguageKey.Wifi{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(WifiModel.self, from: jsonData)
            viewModel.ssid = data.ssid!
            viewModel.pass = data.password!
            viewModel.hidden = ""
            viewModel.network = data.protect!
            
            self.viewModel.getListWifi()
            
        }
        else if typeCode == LanguageKey.Contact{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            viewModel.contact = data
            self.viewModel.getListContact()
            
        }
        else if typeCode == LanguageKey.Location{
            let jsonData = valueContent.data(using: .utf8)!
            let data = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            viewModel.location = data
            self.viewModel.getListLocation()
            
        }
        
              else if typeCode == LanguageKey.Message{
                  let jsonData = valueContent.data(using: .utf8)!
                  let data = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
                  viewModel.message = data
                  self.viewModel.getListMessage()
                  
              }
        else if typeCode == LanguageKey.Event{
                         let jsonData = valueContent.data(using: .utf8)!
                         let data = try! JSONDecoder().decode(EventModel.self, from: jsonData)
                         viewModel.event = data
                         self.viewModel.getListEvent()
                         
                     }
    }
    
    func updateDataSource() {
        if typeCode == LanguageKey.Url {
            self.dataSourceUrl.items = self.viewModel.listurl
            self.dataSourceUrl.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellurl = vm
            }
            
        }
        if typeCode == LanguageKey.Text {
            self.dataSourceText.items = self.viewModel.listtext
            self.dataSourceText.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCelltext = vm
            }
            
        }
        if typeCode == LanguageKey.Telephone {
            self.dataSourcePhone.items = self.viewModel.listphone
            self.dataSourcePhone.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellphone = vm
            }
            
        }
        if typeCode == LanguageKey.Email {
            self.dataSourceEmail.items = self.viewModel.listemail
            self.dataSourceEmail.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellemail = vm
            }
        }
        if typeCode == LanguageKey.Wifi {
            self.dataSourceWifi.items = self.viewModel.listwifi
            self.dataSourceWifi.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellwifi = vm
            }
            
        }
        if typeCode == LanguageKey.Contact {
            self.dataSourceContact.items = self.viewModel.listcontact
            self.dataSourceContact.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellcontact = vm
            }
        }
        if typeCode == LanguageKey.Location {
                  self.dataSourceLocation.items = self.viewModel.listlocation
                  self.dataSourceLocation.configureSwipeCell = { cell,vm in
                      self.log(object: vm)
                      self.viewModel.currentCelllocation = vm
                  }
              }
        if typeCode == LanguageKey.Message {
                         self.dataSourceMessage.items = self.viewModel.listmessage
                         self.dataSourceMessage.configureSwipeCell = { cell,vm in
                             self.log(object: vm)
                             self.viewModel.currentCellmessage = vm
                         }
                     }
        if typeCode == LanguageKey.Event {
                                self.dataSourceEvent.items = self.viewModel.listevent
                                self.dataSourceEvent.configureSwipeCell = { cell,vm in
                                    self.log(object: vm)
                                    self.viewModel.currentCellevent = vm
                                }
                            }
        // self.dataSource.swipeActionRight = swipeActionRight()
        self.tableView.reloadData()
        log(message: "List typecode available...")
        //    log(object: self.viewModel.listurl)
    }
    func bindTableView(){
        if typeCode == LanguageKey.Url {
            self.dataSourceUrl = TableViewDataSource(cellIdentifier: EnumIdentifier.Url.rawValue, items: self.viewModel.listurl,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourceUrl.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellurl = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourceUrl.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourceUrl
            self.tableView.delegate = self.dataSourceUrl
        }
        else if typeCode == LanguageKey.Text {
            self.dataSourceText = TableViewDataSource(cellIdentifier: EnumIdentifier.Text.rawValue, items: self.viewModel.listtext,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourceText.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCelltext = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourceText.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourceText
            self.tableView.delegate = self.dataSourceText
        }
        else if typeCode == LanguageKey.Telephone {
            self.dataSourcePhone = TableViewDataSource(cellIdentifier: EnumIdentifier.Phone.rawValue, items: self.viewModel.listphone,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourcePhone.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellphone = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourcePhone.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourcePhone
            self.tableView.delegate = self.dataSourcePhone
        }
        else if typeCode == LanguageKey.Email {
            self.dataSourceEmail = TableViewDataSource(cellIdentifier: EnumIdentifier.Email.rawValue, items: self.viewModel.listemail,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourceEmail.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellemail = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourceEmail.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourceEmail
            self.tableView.delegate = self.dataSourceEmail
        }
        else if typeCode == LanguageKey.Wifi {
            self.dataSourceWifi = TableViewDataSource(cellIdentifier: EnumIdentifier.Wifi.rawValue, items: self.viewModel.listwifi,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourceWifi.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellwifi = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourceWifi.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourceWifi
            self.tableView.delegate = self.dataSourceWifi
        }
        else if typeCode == LanguageKey.Contact {
            self.dataSourceContact = TableViewDataSource(cellIdentifier: EnumIdentifier.Contact.rawValue, items: self.viewModel.listcontact,isSelectionStype: false){ cell, vm in
                cell.configView(viewModel: vm)
                cell.configData(viewModel: vm)
                cell.delegate = self
            }
            self.dataSourceContact.configureSwipeCell = { cell,vm in
                self.log(object: vm)
                self.viewModel.currentCellcontact = vm
            }
            //  self.dataSource.swipeActionRight = swipeActionRight()
            self.dataSourceContact.loadMore = {
                self.log(message: "Loading more")
            }
            self.tableView.dataSource = self.dataSourceContact
            self.tableView.delegate = self.dataSourceContact
        }
        else if typeCode == LanguageKey.Location {
                   self.dataSourceLocation = TableViewDataSource(cellIdentifier: EnumIdentifier.Location.rawValue, items: self.viewModel.listlocation,isSelectionStype: false){ cell, vm in
                       cell.configView(viewModel: vm)
                       cell.configData(viewModel: vm)
                       cell.delegate = self
                   }
                   self.dataSourceLocation.configureSwipeCell = { cell,vm in
                       self.log(object: vm)
                       self.viewModel.currentCelllocation = vm
                   }
                   //  self.dataSource.swipeActionRight = swipeActionRight()
                   self.dataSourceLocation.loadMore = {
                       self.log(message: "Loading more")
                   }
                   self.tableView.dataSource = self.dataSourceLocation
                   self.tableView.delegate = self.dataSourceLocation
               }
        else if typeCode == LanguageKey.Message {
                        self.dataSourceMessage = TableViewDataSource(cellIdentifier: EnumIdentifier.Message.rawValue, items: self.viewModel.listmessage,isSelectionStype: false){ cell, vm in
                            cell.configView(viewModel: vm)
                            cell.configData(viewModel: vm)
                            cell.delegate = self
                        }
                        self.dataSourceMessage.configureSwipeCell = { cell,vm in
                            self.log(object: vm)
                            self.viewModel.currentCellmessage = vm
                        }
                        //  self.dataSource.swipeActionRight = swipeActionRight()
                        self.dataSourceMessage.loadMore = {
                            self.log(message: "Loading more")
                        }
                        self.tableView.dataSource = self.dataSourceMessage
                        self.tableView.delegate = self.dataSourceMessage
                    }
        else if typeCode == LanguageKey.Event {
                             self.dataSourceEvent = TableViewDataSource(cellIdentifier: EnumIdentifier.Event.rawValue, items: self.viewModel.listevent,isSelectionStype: false){ cell, vm in
                                 cell.configView(viewModel: vm)
                                 cell.configData(viewModel: vm)
                                 cell.delegate = self
                             }
                             self.dataSourceEvent.configureSwipeCell = { cell,vm in
                                 self.log(object: vm)
                                 self.viewModel.currentCellevent = vm
                             }
                             //  self.dataSource.swipeActionRight = swipeActionRight()
                             self.dataSourceEvent.loadMore = {
                                 self.log(message: "Loading more")
                             }
                             self.tableView.dataSource = self.dataSourceEvent
                             self.tableView.delegate = self.dataSourceEvent
                         }
    }
    func setupTableView(){
        if typeCode == LanguageKey.Url {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Url.rawValue)
            //            tableView.backgroundColor = .white
            //            tableView.separatorStyle = .none
            tableView.delegate = dataSourceUrl
            tableView.dataSource = dataSourceUrl}
        else if typeCode == LanguageKey.Text {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Text.rawValue)
            
            tableView.delegate = dataSourceText
            tableView.dataSource = dataSourceText
        }
        else if typeCode == LanguageKey.Telephone {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Phone.rawValue)
            
            tableView.delegate = dataSourcePhone
            tableView.dataSource = dataSourcePhone
        }
        else if typeCode == LanguageKey.Email {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Email.rawValue)
            
            tableView.delegate = dataSourceEmail
            tableView.dataSource = dataSourceEmail
        }
        else if typeCode == LanguageKey.Wifi {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Wifi.rawValue)
            
            tableView.delegate = dataSourceWifi
            tableView.dataSource = dataSourceWifi
        }
        else if typeCode == LanguageKey.Contact {
            tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Contact.rawValue)
            
            tableView.delegate = dataSourceContact
            tableView.dataSource = dataSourceContact
        }
        else if typeCode == LanguageKey.Location {
                 tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Location.rawValue)
                 
                 tableView.delegate = dataSourceLocation
                 tableView.dataSource = dataSourceLocation
             }
        else if typeCode == LanguageKey.Message {
                     tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Message.rawValue)
                     
                     tableView.delegate = dataSourceMessage
                     tableView.dataSource = dataSourceMessage
                 }
        else if typeCode == LanguageKey.Event {
                           tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.Event.rawValue)
                           
                           tableView.delegate = dataSourceEvent
                           tableView.dataSource = dataSourceEvent
                       }
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
extension DetailGenerateVC : TableViewCellDelegate {
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
        //    log(object: cell)
    }
}



extension DetailGenerateVC : SingleButtonDialogPresenter {
    
}
