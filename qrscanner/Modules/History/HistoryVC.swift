//
//  HistoryVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class HistoryVC : BaseViewController {
        var tableView : UITableView!
        lazy var lbTittle : ICLabel = {
          let lbTittle = ICLabel()
          lbTittle.translatesAutoresizingMaskIntoConstraints = false
          return lbTittle
        }()
        var dataSource :TableViewDataSource<TableViewCell,QRCodeViewModel,HeaderView>!
        var sections = [TableSection<String, QRCodeViewModel>]()
        let viewModel = ScannersViewModelList()
        override func viewDidLoad() {
            super.viewDidLoad()
            self.sections = TableSection.group(rowItems: self.viewModel.listHistories, by: { (headline) in
                return headline.typeCode
            })
            initUI()
            bindViewModel()
        }
        
     
        
        override func viewDidAppear(_ animated: Bool) {
            self.viewModel.doGetListHistories()
            self.viewModel.isSelected.value = false
        }
        
        
}
