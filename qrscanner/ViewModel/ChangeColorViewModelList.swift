//
//  ChangeColorViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 4/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import Foundation
class ChangeColorViewModelList: ChangeColorViewModelListDelegate {
    var responseToView: ((String) -> ())?
    
    var listColor: [ChangeColorViewModel] = [ChangeColorViewModel]()
       var isSelected: Bindable<Bool> = Bindable(false)
     var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
      var navigate: (() -> ())?
    func getListColor(){
        
        let menu0 = ColorOption(rawValue: 0)
        let menuModel0 = ChangeColorViewModel(icon: menu0!.description, position: 0, isSelected : true)
                listColor.append(menuModel0);
         for index in 1...11 {
            let menu = ColorOption(rawValue: index)
            let menuModel = ChangeColorViewModel(icon: menu!.description, position: index, isSelected : false)
          listColor.append(menuModel);
         }
       //   responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
      }
    
      
}
