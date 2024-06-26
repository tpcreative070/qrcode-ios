//
//  HistoryVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension HistoryVC  {
    func initUI(){
        view.backgroundColor =  UIColor(named: AppColors.ColorAppearance)
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
    func setupLbNoItem(){
        if historyViewModel.listHistories.count == 0{
            self.view.addSubview(lbNoItem)
            NSLayoutConstraint.activate([
                lbNoItem.topAnchor.constraint(equalTo: view.topAnchor),
                lbNoItem.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                lbNoItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lbNoItem.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
            self.lbNoItem.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP)
            lbNoItem.isHidden = false
        }
        else{
            lbNoItem.isHidden = true
        }
    }
    //Mark: - setUpTableView()
    func setupTableView(){
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: EnumIdentifier.History.rawValue)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: EnumIdentifier.History.rawValue)
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
                self?.updateDataSource()
            }
        }
        self.historyViewModel.doGetListHistories()
    }
    func updateDataSource() {
        self.sections = TableSection.group(rowItems: self.historyViewModel.listHistories, by: { (headline) in
            return String(headline.typeCode)
        })
        self.sections.sort { (lhs, rhs) in lhs.rowItems[0].updatedDateTime > rhs.rowItems[0].updatedDateTime }
        self.dataSource.sections = self.sections
        self.dataSource.items = self.historyViewModel.listHistories
        self.tableView.reloadData()
        self.historyViewModel.showLoading.value = false
        setupLbNoItem()
    }
    
    func bindTableView(){
        
        self.dataSource = TableViewDataSource(cellIdentifier: EnumIdentifier.History.rawValue, items: self.historyViewModel.listHistories,sections: self.sections, height: AppConstants.TABLE_ROW_HEIGHT,isSelectionStype: false){ cell, vm in
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
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    
    func setupFloatButton(){
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = AppColors.PRIMARY_COLOR
        item.titleLabelPosition = .left
        item.icon = UIImage(named: AppImages.IC_CSV)
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
            self.navigationController?.pushViewController(ChooseHistoryVC(), animated: false)
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
extension HistoryVC : TableViewCellDelegate{
    func cellViewLongSelected(cell: TableViewCell) {
        
        navigationController?.pushViewController(ChooseHistoryVC(), animated: false)
    }
    
    func cellViewSelected(cell: TableViewCell) {
        //guard let indexPath = tableView.indexPath(for: cell) else { return }
    }
    func cellViewLongSelected(cell: Codable) {
        navigationController?.pushViewController(ChooseHistoryVC(), animated: false)
    }
    func cellViewSelected(cell: TableViewCell, countSelected: Int) {
        
    }
    
    func cellViewSelected(cell: Codable) {
        
//        let jsonData =  JSONSerializerHelper.toJson(cell as Any)
//
//        print("object:\(jsonData)")
//        let  vc = DetailVC()
//        var typeCode: String = ""
//        let arr = jsonData.split(separator: ",")
//        for item in arr {
//            if item.contains("\"typeCode\":"){
//                typeCode = String(item.split(separator: ":")[1]).replacingOccurrences(of: "\"", with: "")
//            }
//            if item.contains("\"content\":"){
//                let valueCt = item.replacingOccurrences(of: "\"content\": ", with: "", options: NSString.CompareOptions.literal, range: nil)
//              // let vl = valueCt.replacingOccurrences(of: "\"", with: "")
//                let vl1 = valueCt.replacingOccurrences(of: "\\", with: "")
//               // print(vl)
//                print(vl1)
//
//                let contentVM = QRCodeHelper.shared.convertStringtoContent(typeCode: typeCode, data: vl1)
//                           vc.listContentViewModel = [contentVM]
//                 self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
        
        if let data = JSONHelper.get(value: HistoryViewModel.self,anyObject: cell){
            let  vc = DetailVC()
            print(data.content!)
            guard let ct = data.content else {
                return
            }
            let contentVM = QRCodeHelper.shared.convertStringtoContent(typeCode: data.typeCode, data: ct)
            vc.listContentViewModel = [contentVM]


           // vc.listContentValue = [data.content!]
            self.navigationController?.pushViewController(vc, animated: true)

        }
        
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           Utils.logMessage(object: self.self.historyViewModel.listHistories[indexPath.row])
       }
    
    func cellCodable(codable: Codable) {
        
    }
    func cellViewSelected(cell: TableViewCell, action: EnumResponseToView) {
        
    }
}

extension HistoryVC : SingleButtonDialogPresenter{
    
}

extension HistoryVC : HeaderSectionDelegate {
    func cellSectionSelected(codable: Codable) {
    }
}
