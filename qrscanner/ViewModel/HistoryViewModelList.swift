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
    var listHistoriesBytype: [HistoryViewModel] = [HistoryViewModel]()
    var currentCell: HistoryViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
    var countItemSelected: Int = 0
    var historyArray:[Dictionary<String, AnyObject>] =  Array()
    var navigate: (() -> ())?
    func doGetListHistories(){
    //    self.showLoading.value = true
        if let mList = SQLHelper.getListHistories(){
            var index = 0
            self.listHistories = mList.map({ (data) -> HistoryViewModel in
                index += 1
                return HistoryViewModel(data:  data)
            })
        }
        listHistories = listHistories.sorted {$0.updatedDateTime > $1.updatedDateTime}
       // self.showLoading.value = false
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
        
    }
   
    func doSelectItem(coable : Codable){
        if let value = coable.get(value: HistoryViewModel.self){
            //    Utils.logMessage(object: listHistories)
            for (index, element) in listHistories.enumerated() {
                if element.createdDateTime == value.createdDateTime {
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
                
                listHistories = listHistories.sorted {$0.updatedDateTime > $1.updatedDateTime}
                responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
            }
        }
    }
    func delete(){
        self.showLoading.value = true
        let dispathGroup = DispatchGroup()
        DispatchQueue.main.async(execute: { () -> Void in
            dispathGroup.enter()
            print("dispath enter")
            for index in self.listHistories {
                if index.check == true {
                    self.countItemSelected += 1
                    self.doDeleteHistory(mData: index)
                }
            }
            self.doGetListHistories()
            dispathGroup.leave()
        })
        dispathGroup.notify(queue: .main) {
            print("dispath main")
            self.showLoading.value = false
        }
    }
    func doDeleteHistory(mData : HistoryViewModel){
        countItemSelected = 0
        
        if SQLHelper.updateHistory(createDateTime: mData.createdDateTime, value: false){
            print("update success")
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
        // Utils.logMessage(object: listHistories)
    }
     func checkItemExist (mValue : GenerateEntityModel) -> Bool {
              let result = SQLHelper.checkItemExist(data: mValue)
              print(result)
              if result > 0 {
                  doUpdate(mCreateDateTime: Int(result), mValue: mValue)
                  //self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    //              let okAlert = SingleButtonAlert(
    //                  title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
    //                  message: LanguageHelper.getTranslationByKey(LanguageKey.InvalidQRCode),
    //                  action: AlertAction(buttonTitle: "Ok", handler: {
    //                      print("Ok pressed!")
    //                  })
    //              )
    //              self.onShowError?(okAlert)
                  return true
              }
              return false
          }
          func doUpdate(mCreateDateTime: Int,mValue : GenerateEntityModel){
            SQLHelper.updatedScanner(data: GenerateEntityModel(createdDateTime: mCreateDateTime, typeCode: mValue.typeCode ?? "", content: mValue.content!, isHistory: true, isSave: false, updatedDateTime: Date().millisecondsSince1970, bookMark: false, transactionID: mValue.transactionID ?? "", isCode: mValue.isCode ?? ""))
              
          }
}

