//
//  TableViewDataSource.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TableViewDataSourceContent<Cell: UITableViewCell,ViewModel, HeaderInSection : UITableViewHeaderFooterView> : NSObject, UITableViewDataSource, UITableViewDelegate {
    var items :[ContentViewModel]!
    var configureCell :((Cell,ContentViewModel) -> ())
    var configureSwipeCell :((Cell,ContentViewModel) -> ())?
    var headerSection :((HeaderInSection,ContentViewModel) -> ())?
    var loadMore:(() -> ())?
    var sections : [TableSection<String, ContentViewModel>]?
    var height : CGFloat?
    var isSelectionStype : Bool?
    
    init(items :[ContentViewModel], isSelectionStype : Bool? = true, configureCell: @escaping (Cell,ContentViewModel) -> ()) {
        self.items = items
        self.configureCell = configureCell
        self.isSelectionStype  = isSelectionStype
    }

   
    func numberOfSections(in tableView: UITableView) -> Int {
        if let data = self.sections{
            return data.count
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return height ?? 0
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = sections{
            let section = data[section]
            return section.rowItems.count
        }
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: (item.typeCode?.uppercased())! , for: indexPath) as! Cell

            self.configureCell(cell,item)
            if indexPath.row == self.items.count - 1 && self.items.count > 0  {
                self.loadMore?()
            }
           
        
        
        if !(isSelectionStype ?? false) {
            cell.selectionStyle = .none
        }
        return cell
    }
    
    
   
}

