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
    var listHistories: [HistoryViewModelList] = [HistoryViewModelList]()
    var listSave: [HistoryViewModelList] = [HistoryViewModelList]()

    var navigate: (() -> ())?
//    func doGetListHistories(){
//           if let mList = SQLHelper.getListHistories(){
//               var index = 0
//               self.listHistories = mList.map({ (data) -> HistoryViewModelList in
//                   index += 1
//                   return HistoryViewModelList(data:  data)
//               })
//           }
//        listHistories = listHistories.sorted {$0.updatedDateTime > $1.updatedDateTime}
//           responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
//       }
//    func doGetListSave(){
//              if let mList = SQLHelper.getListSave(){
//                  var index = 0
//                  self.listSave = mList.map({ (data) -> HistoryViewModelList in
//                      index += 1
//                      return HistoryViewModelList(data:  data)
//                  })
//              }
//           listSave = listSave.sorted {$0.updatedDateTime > $1.updatedDateTime}
//              responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
//          }
//     func doSelectItem(coable : Codable){
//           if let value = coable.get(value: QRCodeViewModel.self){
//               Utils.logMessage(object: listHistories)
//               for (index, element) in listHistories.enumerated() {
//                   if element.createdDateTime == value.createdDateTime {
//                       debugPrint(index)
//                       let mObject = listHistories[index]
//                       mObject.check = !value.check
//                   }
//               }
//               
//               var isSelect = false
//               for index in listHistories {
//                   if index.check{
//                       isSelect = true
//                   }
//               }
//               isSelected.value = isSelect
//               listHistories = listHistories.sorted {$0.createdDateTime > $1.createdDateTime}
//               responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
//           }
//       }
    
}
