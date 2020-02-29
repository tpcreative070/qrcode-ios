//
//  Main+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension MainVC {
    
    func initUI(){
    }
    
    func addedView(){
        mSave = SaveVC()
        mSave?.title = LanguageHelper.getTranslationByKey(LanguageKey.MyWallet) ?? "My Wallet"
        addChild(mSave ?? SaveVC())
        mSettings = SettingsVC()
        mSettings?.title = LanguageHelper.getTranslationByKey(LanguageKey.MyProfile) ?? "My Profile"
        addChild(mSettings ?? SettingsVC())
    }
}


