//
//  ScannerViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/8/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class ResultViewModel : ResultViewModelDelegate {
    var createDateTime: Int?
       var typeCode : String?
       var isSeen : Int?
    var isUpdate : Int?
    var navigate: (() -> ())?
    
   
    var responseToView: ((String) -> ())?
    
    var showLoading: Bindable<Bool> = Bindable(false)
    
    var onShowError: ((SingleButtonAlert) -> Void)?
    func doInsert(mValue : GenerateEntityModel){
        SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: Date().millisecondsSince1970, typeCode: typeCode ?? "", content: mValue.content!, isHistory: false, isSave: true, updatedDateTime: Date().millisecondsSince1970, bookMark: false))
    }
    func doUpdate(mCreateDateTime: Int,mValue : GenerateEntityModel){
        SQLHelper.updatedScanner(data: GenerateEntityModel(createdDateTime: mCreateDateTime, typeCode: typeCode ?? "", content: mValue.content!, isHistory: false, isSave: true, updatedDateTime: Date().millisecondsSince1970, bookMark: false))
     }

    
}
