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
    var isSave : Bool = false
    var navigate: (() -> ())?
    var responseToView: ((String) -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    func doInsert(mValue : GenerateEntityModel){
        if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
             if !checkItemExist(mValue: mValue){
                       
                           insertValue(mValue: mValue)
            }
        }
        else
        {
            insertValue(mValue: mValue)
        }
       }
    func insertValue(mValue: GenerateEntityModel){
        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: Date().millisecondsSince1970, typeCode: typeCode ?? "", content: mValue.content!, isHistory: false, isSave: true, updatedDateTime: Date().millisecondsSince1970, bookMark: false, transactionID: "", isCode: mValue.isCode!))
        if result {
            print("insert success")
        }
        
        
    }
    func doUpdate(mCreateDateTime: Int,mValue : GenerateEntityModel){
        SQLHelper.updatedScanner(data: GenerateEntityModel(createdDateTime: mCreateDateTime, typeCode: typeCode ?? "", content: mValue.content!, isHistory: false, isSave: true, updatedDateTime: Date().millisecondsSince1970, bookMark: false, transactionID: "", isCode: ""))
        
    }
    func checkItemExist (mValue : GenerateEntityModel) -> Bool {
        Utils.logMessage(object: mValue)
        let result = SQLHelper.checkItemExist(data: mValue)
        print(result)
        if result > 0 {
            doUpdate(mCreateDateTime: Int(result), mValue: mValue)
            //self.responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
            let okAlert = SingleButtonAlert(
                title: LanguageHelper.getTranslationByKey(LanguageKey.Alert) ?? "Error",
                message: LanguageHelper.getTranslationByKey(LanguageKey.ExistQRCode),
                action: AlertAction(buttonTitle: "Ok", handler: {
                    print("Ok pressed!")
                })
            )
            self.onShowError?(okAlert)
            return true
        }
        return false
    }
    
    
}
