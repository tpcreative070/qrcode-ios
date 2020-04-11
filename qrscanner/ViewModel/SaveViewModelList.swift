//
//  HistoryViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class SaveViewModelList : SaveViewModelListDeletegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listSave: [SaveViewModel] = [SaveViewModel]()
    var currentCell: SaveViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
    var countItemSelected: Int = 0
    
    var navigate: (() -> ())?
    func doGetListSave(){
        if let mList = SQLHelper.getListSave(){
            var index = 0
            self.listSave = mList.map({ (data) -> SaveViewModel in
                index += 1
                return SaveViewModel(data:  data)
            })
        }
       // Utils.logMessage(object: listSave)
        listSave = listSave.sorted {$0.updatedDateTime > $1.updatedDateTime}
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    
    func doSelectItem(coable : Codable){
        if let value = coable.get(value: SaveViewModel.self){
            //    Utils.logMessage(object: listSave)
            for (index, element) in listSave.enumerated() {
                if element.createdDateTime == value.createdDateTime {
                    let mObject = listSave[index]
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
                
                listSave = listSave.sorted {$0.createdDateTime > $1.createdDateTime}
                responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
            }
        }
    }
      
    func delete(){
           self.showLoading.value = true
           let dispathGroup = DispatchGroup()
           DispatchQueue.main.async(execute: { () -> Void in
               dispathGroup.enter()
               for index in self.listSave {
                   if index.check == true {
                       self.countItemSelected += 1
                       self.doDeleteSave(mData: index)
                   }
               }
               dispathGroup.leave()
           })
           dispathGroup.notify(queue: .main) {
               self.showLoading.value = false
           }
       }
        func doDeleteSave(mData : SaveViewModel){
            countItemSelected = 0
            
            if SQLHelper.updateSave(createDateTime: mData.createdDateTime, value: false){
                doGetListSave()
            }
        }
        
        func doSelectedAll(isValue : Bool){
            for index in listSave {
                index.check = isValue
            }
            checkedList()
            responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
        }
        
        func checkedList(){
            countItemSelected = 0;
            var count = 0
            for index in listSave{
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
          //  Utils.logMessage(object: listSave)
        }
    }

