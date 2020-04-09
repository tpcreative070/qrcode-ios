//
//  LanguageHelper.swift
//  screenrecorder
//
//  Created by phong070 on 2/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import SQLite
class LanguageHelper {
    
    /**
     Store language from server to local database
     - parameter key: string - this is key of languages(en, de, etc)
     - parameter data: string - this is a json string with key: key of the translation, value: value of the translation key
     */
    class func storeLanguageByKey(_ key: String, data: String) {
        SQLHelper.insertTranslations(data: TranslationEntityModel(key: key, data: data))
    }
    
   /**
        Store language from server to local database
        - parameter key: string - this is key of languages(en, de, etc)
        - parameter data: string - this is a json string with key: key of the translation, value: value of the translation key
        */
   class func getLanguageByKey(_ key: String) -> Dictionary<String, Any>? {
           var dataLang = GlobalVariableHelper.languages[key] as? Dictionary<String, Any>
           if dataLang?.count == 0 {
           let translation = SQLHelper.getTranslations(key: key)
           if let data =  JSONHelper.convertStringToDictionary(translation?.translations ?? "")  {
                   dataLang = data
                   GlobalVariableHelper.languages[key] = data
               }
           }
           return dataLang
       }
    
    /**
     - parameter key: string - this is key of languages(en, de, etc)
     - parameter data: string - this is a json string with key: key of the translation, value: value of the translation key
     */
    class func getTranslationByKey(_ key: String, data: Dictionary<String, Any> = Dictionary<String, Any>(), params: CVarArg... ) -> String? {
        var langData = Dictionary<String, Any>()
        if data.count > 0 {
            langData = data
        } else {
            var currentLang = LanguageCode.English
            if let mData = CommonService.getMultipleLanguages(){
                currentLang = mData
            }
            langData = LanguageHelper.getLanguageByKey(currentLang) ?? [:]
        }
        if params.count > 0  {
            return String(format: langData[key] as! String, params)
        }
        return langData[key] as? String
    }
}
