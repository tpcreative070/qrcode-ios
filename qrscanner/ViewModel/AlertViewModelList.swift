//
//  HistoryViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class AlertViewModelList : AlertViewModelListDeletegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listItem: [AlertViewModel] = [AlertViewModel]()
    var currentCell: AlertViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
    var countItemSelected: Int = 0
    var navigate: (() -> ())?
    func doSelectItem(coable : Codable){
        if let value = coable.get(value: AlertViewModel.self){
            //    Utils.logMessage(object: listSave)
            for (index, element) in listItem.enumerated() {
                if element.nameItemView == value.nameItemView {
                    debugPrint(index)
                    let mObject = listItem[index]
                    mObject.check = !value.check
                    if mObject.check == true {
                        countItemSelected += 1
                        
                    }
                    else{
                        if countItemSelected > 0
                        {
                            countItemSelected -= 1
                        }
                    }
                    
                    print(listItem)
                    responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
                }
            }
        }
    }
}

