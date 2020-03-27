//
//  GenegrateViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TypeCodeViewModelList : TypeCodeViewModelListDelegate {
    
    var currentCell: TypeCodeViewModel?
    var responseToView: ((String) -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var listTypeCondeViewModel: [TypeCodeViewModel] = [TypeCodeViewModel]()
    func getList(){
       for index in 0...8 {
         let menu = TypeCodeOption(rawValue: index)
         let menuModel = TypeCodeModel(identify: index, name: menu!.name, icon: menu!.iconName)
         let menuVM = TypeCodeViewModel(data: menuModel)
        listTypeCondeViewModel.append(menuVM);
       }
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
}
