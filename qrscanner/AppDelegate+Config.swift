//
//  AppDelegate+Config.swift
//  qrscanner
//
//  Created by Mac10 on 3/3/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

extension AppDelegate {
    func initConfig(){
        initSQLite()
        let config = CommonService.getConfigurationData()
        guard let data = config else {
            let configurationData = ConfigurationStoreModel(isAutoLogin: true, isUseDefault: true, serverUrl: ApiEndPointUrl.BaseUrl.infoForKey() ?? "")
            CommonService.setConfigurationData(configuration: configurationData)
            return
        }
        if ApiEndPointUrl.BaseUrl.infoForKey() ?? "" != data.serverUrl{
            let configurationData = ConfigurationStoreModel(isAutoLogin: true, isUseDefault: true, serverUrl: ApiEndPointUrl.BaseUrl.infoForKey() ?? "")
            CommonService.setConfigurationData(configuration: configurationData)
        }
        if CommonService.getIsAlreadyStore() ?? false{
            debugPrint("Already saved")
            return
        }else{
            CommonService.setIsAlreadyStore(value: true)
        }
    }
    
    func initSQLite(){
        if !SQLHelper.getPathFile(){
            CommonService.setMasterKey(data: CipherKey.Key)
        }
        
        if let _ = CommonService.getMultipleLanguages(){
        }else{
            CommonService.setMultipleLanguages(value: LanguageCode.English)
        }
        
        SQLHelper.initCipher()
        SQLHelper.createScanner()
        SQLHelper.createTranlation()
    
    }
    func initDevice(){
        let _ = DeviceHelper.Shared.init()
    }
    
}
