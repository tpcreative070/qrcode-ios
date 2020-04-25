//
//  ChangeColorViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 4/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ChangeColorViewModelList: ChangeColorViewModelListDelegate {
    var responseToView: ((String) -> ())?
    
    var listColor: [ChangeColorViewModel] = [ChangeColorViewModel]()
       var isSelected: Bindable<Bool> = Bindable(false)
     var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
      var navigate: (() -> ())?
    func setListColor(){
         for index in 0...11 {
              let menu = ColorOption(rawValue: index)
           
                let menuModel = ChangeColorViewModel(icon: menu!.description, position: index, isSelected : false)
              listColor.append(menuModel);
            }
        getListColor(listColor : listColor)
    
     }
    func getListColor(listColor : [ChangeColorViewModel]){
        let value = String(CommonService.getUserDefault(key: KeyUserDefault.ChangeColor) ?? ColorString.Black.rawValue)
        getCurrentItemSelect(mValue: value, listColor: listColor)
      }
    func getCurrentItemSelect(mValue: String, listColor: [ChangeColorViewModel]){
       // Utils.logMessage(object: listColor)

        for (item) in listColor{
            if item.imgQRView == mValue {
                         item.isSelected = true
                     }else{
                         item.isSelected = false
                     }
                 }
                 self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE_COLLECTION_VIEW.rawValue)
    }
    

    func doSelectItem(mindex : Int){
          for (index, item) in listColor.enumerated(){
           //   debugPrint(index)
              if index == mindex {
                  item.isSelected = true
                CommonService.setUserDefault(key: KeyUserDefault.ChangeColor, value: item.imgQRView)
              }else{
                  item.isSelected = false
              }
          }
        // Utils.logMessage(object: listColor)
          self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE_COLLECTION_VIEW.rawValue)
      }
}
