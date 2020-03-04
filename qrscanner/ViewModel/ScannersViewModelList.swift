//
//  HistoryViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class ScannersViewModelList : ScannersViewModelListDeletegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listHistories: [ScannerViewModel] = [ScannerViewModel]()
    var navigate: (() -> ())?
    func doGetListHistories(){
           if let mList = SQLHelper.getListHistories(){
               var index = 0
               self.listHistories = mList.map({ (data) -> ScannerViewModel in
                   index += 1
                   return ScannerViewModel(data:  data)
               })
           }
        listHistories = listHistories.sorted {$0.updatedDateTime > $1.updatedDateTime}
           responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
       }
}
