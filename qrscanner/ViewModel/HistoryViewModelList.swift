//
//  HistoryViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class HistoryViewModelList : HistoryViewModelListDeletegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listHistories: [HistoryViewModel] = [HistoryViewModel]()
    var currentCell: HistoryViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
    var countItemSelected: Int = 0
    
    var navigate: (() -> ())?
    func doGetListHistories(){
        if let mList = SQLHelper.getListHistories(){
            var index = 0
            self.listHistories = mList.map({ (data) -> HistoryViewModel in
                index += 1
                return HistoryViewModel(data:  data)
            })
        }
        listHistories = listHistories.sorted {$0.updatedDateTime > $1.updatedDateTime}
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    
    func doSelectItem(coable : Codable){
        if let value = coable.get(value: HistoryViewModel.self){
            //    Utils.logMessage(object: listHistories)
            for (index, element) in listHistories.enumerated() {
                if element.createdDateTime == value.createdDateTime {
                    debugPrint(index)
                    let mObject = listHistories[index]
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
                }
                
                listHistories = listHistories.sorted {$0.createdDateTime > $1.createdDateTime}
                responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
            }
        }
    }
        
        func doDeleteHistory(mData : HistoryViewModel){
            countItemSelected = 0
            
            if SQLHelper.updateHistory(createDateTime: mData.createdDateTime, value: false){
                doGetListHistories()
            }
        }
        
        func doSelectedAll(isValue : Bool){
            for index in listHistories {
                index.check = isValue
            }
            checkedList()
            responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
        }
        
        func checkedList(){
            countItemSelected = 0;
            var count = 0
            for index in listHistories{
                if index.check {
                    count += 1
                    countItemSelected = count
                }
            }
            if count > 0 {
                isVisible.value = true
            }else{
                isVisible.value = false
            }
            Utils.logMessage(object: listHistories)
        }
    }

