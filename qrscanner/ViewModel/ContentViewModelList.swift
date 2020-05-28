//
//  ContentViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class ContentViewModelList : ContentViewModelListDeletegate{
    var isSelected: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var showLoading: Bindable<Bool> = Bindable(false)
    var responseToView: ((String) -> ())?
    var listContent: [ContentViewModel] = [ContentViewModel]()
    var listContentValue: [String] = [String]()
    var currentCell: ContentViewModel?
    var isVisible: Bindable<Bool> = Bindable(false)
    var countItemSelected: Int = 0
    
    var navigate: (() -> ())?
    func doGetListContent(){
    }
    func addItem(mvalue : ContentViewModel){
        listContent.append(mvalue)
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
}
    
