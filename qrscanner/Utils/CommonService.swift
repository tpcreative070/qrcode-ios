//
//  CommonService.swift
//  screenrecorder
//
//  Created by phong070 on 2/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Firebase
import ZXingObjC





class CommonService  {
    
    
    
    static let isInput = true
    static func getUserDefault<T>(key: String) -> T? {
        
        return (UserDefaults.standard.object(forKey: key)) as? T
        
    }
    
    static  func setUserDefault<T>( key: String, value: T) {
        print(value)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    /**
     getConfigurationData
     */
    static func getConfigurationData() -> ConfigurationStoreModel? {
        if let saved = StorageHelper.getData(key: StorageKey.configData) {
            if let loaded = self.dataToObject(ConfigurationStoreModel.self, data: saved) {
                return loaded
            }
        }
        return nil
    }
    /**
     setConfigurationData
     */
    static func setConfigurationData(configuration: ConfigurationStoreModel) {
        if let encoded = self.objectToData(configuration) {
            StorageHelper.setObject(key: StorageKey.configData, value: encoded)
        }
    }
    /**
     getBaseUrl
     */
    static func getBaseUrl() -> String {
        if let config = self.getConfigurationData() {
            return config.serverUrl
        }
        return ApiEndPointUrl.BaseUrl.infoForKey() ?? ""
    }
    
    /**
     getCurrentSessionId
     */
    static func getCurrentSessionId() -> String? {
        return ""
    }
    
    /**
     getCurrentUserId
     */
    static func getCurrentUserId() -> Int {
        return 0
    }
    
    /** Decode data to Object
     */
    static func dataToObject<T : Decodable>(_ type: T.Type, data : Data) -> T? {
        let decoder = JSONDecoder()
        if let loaded = try? decoder.decode(type, from: data) {
            return loaded
        }
        return nil
    }
    
    /** Decode data to Object(Callback)
     */
    static func dataToObject<T : Decodable>(_ type: T.Type, data : Data,callBack : () -> (Void)){
        let decoder = JSONDecoder()
        if let _ = try? decoder.decode(type, from: data) {
            callBack()
        }
    }
    
    /** Decode data to Object
     */
    static func objectToData<T : Encodable>(_ data: T ) -> Data? {
        let encoder = JSONEncoder()
        if let loaded = try? encoder.encode(data) {
            return loaded
        }
        return nil
    }
    
    /**
     getAlreadyStore
     */
    static func getIsAlreadyStore() -> Bool? {
        return StorageHelper.getBool(key: StorageKey.isAlreadyStore)
    }
    
    /**
     setStore
     */
    static func setIsAlreadyStore(value : Bool) {
        StorageHelper.setObject(key: StorageKey.isAlreadyStore, value:value)
    }
    
    /**
     getMasterKey
     */
    static func getMasterKey() -> String?{
        let keychain = KeychainSwiftHelper()
        if let saved = keychain.get(StorageKey.masterkey){
            return saved
        }
        return nil
    }
    
    /**
     setMasterKey
     */
    static func setMasterKey(data : String){
        let keychain = KeychainSwiftHelper()
        keychain.set(data, forKey: StorageKey.masterkey)
    }
    
    
    /**
     getMasterKey
     */
    static func getDeviceIdKeyChain() -> String?{
        let keychain = KeychainSwiftHelper()
        if let saved = keychain.get(StorageKey.deviceId){
            return saved
        }
        return nil
    }
    
    /**
     setMasterKey
     */
    static func setDeviceIdKeyChain(data : String){
        let keychain = KeychainSwiftHelper()
        keychain.set(data, forKey: StorageKey.deviceId)
    }
    /**
     getMasterKey
     */
    static func getAuthorKeyChain() -> String?{
        let keychain = KeychainSwiftHelper()
        if let saved = keychain.get(StorageKey.authorSession){
            return saved
        }
        return nil
    }
    
    /**
     setMasterKey
     */
    static func setAuthorKeyChain(data : String){
        let keychain = KeychainSwiftHelper()
        keychain.set(data, forKey: StorageKey.authorSession)
    }

    

    /**
       getMasterKey
       */
      static func getPublicKey() -> String{
          let keychain = KeychainSwiftHelper()
        keychain.set(AppConstants.public_key, forKey: StorageKey.publicKey)
        let saved = keychain.get(StorageKey.publicKey)
              return saved!
        
      }
      
      /**
       setMasterKey
       */
    static func getRefreshToken() -> String {
          let keychain = KeychainSwiftHelper()
          keychain.set(AppConstants.refresh_token, forKey: StorageKey.refreshToken)
          let saved = keychain.get(StorageKey.refreshToken)
                return saved!
      }
    /**
     setMasterKey
     */
    static func setFirstCreatedKeyChain(data : String){
        let keychain = KeychainSwiftHelper()
        keychain.set(data, forKey: StorageKey.firstCreatedKeyChain)
    }
    
    /**
     getFirstCreatedKeyChain
     */
    static func getFirstKeyChain() -> String?{
        let keychain = KeychainSwiftHelper()
        if let saved = keychain.get(StorageKey.firstCreatedKeyChain){
            return saved
        }
        return nil
    }
    
    
    /**
     Fetch device's info
     */
    static func getDeviceInfo() -> String{
        let device = UIDevice.current
        return device.type.rawValue
    }
    
    
    
    /*Generate Random Alphanumber String*/
    static func getRandomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        return randomString
    }
    
    static func getRandomAlphaNumericInt(length: Int) -> String {
        let allowedChars = "123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        return randomString
    }
    
    /*setCipherKey*/
    static func setCipherKey(value : String){
        StorageHelper.setObject(key: StorageKey.cipherKey, value: value)
    }
    
    /*getcipherKey*/
    static func getCipherKey() -> String?{
        guard let value = StorageHelper.getString(key: StorageKey.cipherKey, defaultValue: "") else{
            return nil
        }
        return value
    }
    
    /*Get value from [String]*/
    static func getValueFromArray(data : [String],insert : String) ->String?{
        if data.count == 3{
            let m1 = data[0]
            let m2 = data[1]
            let enc = data[2]
            let result = "\(m1)\(insert)\(m2)\(insert)\(enc)"
            return result
        }
        return nil
    }
    
    /**
     Alert Message
     */
    static func isAlertMessageUsername(code : String) -> Bool{
        if code != EnumResponseCode.USER_IS_NOT_EXISTED.rawValue {
            return true
        }
        return false
    }
    
    /**
     getting current milliseconds
     */
    static func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    static func getErrorMessageFromSystem(code : String)-> String{
        let message  = String(format: LanguageHelper.getTranslationByKey(LanguageKey.ErrorOccurredFromSystem) ?? "", arguments: [code])
        return message
    }
    
    /**
     get multiple languages
     */
    static func getMultipleLanguages() -> String? {
        if let saved = StorageHelper.getString(key: StorageKey.multipleLanguages) {
            return saved
        }
        return nil
    }
    
    /**
     set multiple languages
     */
    static func setMultipleLanguages(value: String) {
        StorageHelper.setObject(key: StorageKey.multipleLanguages, value: value)
    }
    
    //  //reader QRCode
    static func onReaderQRcode(tempImage : CGImage, countList: Int, completion : @escaping (_ result : [ZXResult]?) -> ()) {
        var listMultiResult : [ZXResult] = []
        var listSingleResult : [ZXResult] = []
        //  var flagqrcode : Bool = false
        // initializers are imported without "initWith"
        let source: ZXLuminanceSource = ZXCGImageLuminanceSource(cgImage: tempImage)
        let binazer = ZXHybridBinarizer(source: source)
        let bitmap = ZXBinaryBitmap(binarizer: binazer)
        let hints = ZXDecodeHints()
        hints.tryHarder = true
        let reader = ZXMultiFormatReader()
        let readersqrcode = ZXQRCodeMultiReader()
        let readerbarcode = ZXGenericMultipleBarcodeReader(delegate:reader)
        do{
            let  array_resultqr =  try readersqrcode.decodeMultiple(bitmap!, hints: hints) as! [ZXResult]
            print("numbar of qrcode :\(array_resultqr.count)")
            if (array_resultqr.count > 1 )
            {
                for item in array_resultqr{
                    if item.barcodeFormat.rawValue == 11 {
                        let va =  item.barcodeFormat.rawValue
                        print("\(item)  ---  \(va)")
                        listMultiResult.append(item)
                        
                    }
                }
                completion(listMultiResult)
                
            }
            if array_resultqr.count == 1 {
                // let text = array_resultbar[0].text ?? "Unknow"
                //                completion(text)
                listSingleResult.append(array_resultqr[0])
                completion(listSingleResult)
                return
            }
        }
        catch {
            print("not qrcode")
            //completion(nil)
            //  flagqrcode = true
        }
        
        do {
            //Decode multibarcode
            let array_resultbar = try readerbarcode?.decodeMultiple(bitmap!, hints: hints) as! [ZXResult]
            print("numbar of Bar :\(array_resultbar.count)")
            listMultiResult.removeAll()
            if (array_resultbar.count > 1)
            {
                //                if countList == 1 {
                //                    for item in array_resultbar{
                //                        completion([item])
                //                    }
                //                }
                //                else{
                for item in array_resultbar{
                    let va =  item.barcodeFormat.rawValue
                    print("\(item)  ---  \(va)")
                    if (item.barcodeFormat.rawValue != 11) && (item.barcodeFormat.rawValue != 15){
                        listMultiResult.append(item)
                    }
                        
                    else{
                        
                    }
                    
                }
                print(listMultiResult.count)
                for item in listMultiResult {
                    print(item.barcodeFormat)
                }
                completion(listMultiResult)
                //                }
            }
            if array_resultbar.count == 1 {
                // let text = array_resultbar[0].text ?? "Unknow"
                //                completion(text)
                listSingleResult.append(array_resultbar[0])
                completion(listSingleResult)
                return
            }
        }catch {
            completion(nil)
        }
        
    }
    //reader QRCode
    static func onReaderMultiQRcode(tempImage : CGImage, completion : @escaping (_ result : String?) -> ()) {
        do {
            // initializers are imported without "initWith"
            let source: ZXLuminanceSource = ZXCGImageLuminanceSource(cgImage: tempImage)
            let binazer = ZXHybridBinarizer(source: source)
            let bitmap = ZXBinaryBitmap(binarizer: binazer)
            let hints = ZXDecodeHints()
            let reader = ZXMultiFormatReader()
            // 1) you missed the name of the method, "decode", and
            // 2) use optional binding to make sure you get a value
            let result = try reader.decode(bitmap, hints:hints)
            let text = result.text ?? "Unknow"
            completion(text)
        }catch {
            completion(nil)
        }
    }
    
    static func barcodeFormatToString(format: ZXBarcodeFormat) -> String {
        switch (format) {
        case kBarcodeFormatAztec:
            return LanguageKey.Aztec
            
        case kBarcodeFormatCodabar:
            return LanguageKey.CODABAR
            
        case kBarcodeFormatCode39:
            return LanguageKey.Code_39
            
        case kBarcodeFormatCode93:
            return LanguageKey.Code_93
            
        case kBarcodeFormatCode128:
            return LanguageKey.Code_128
            
        case kBarcodeFormatDataMatrix:
            return LanguageKey.Data_Matrix
            
        case kBarcodeFormatEan8:
            return LanguageKey.EAN_8
            
        case kBarcodeFormatEan13:
            return LanguageKey.EAN_13
            
        case kBarcodeFormatITF:
            return LanguageKey.ITF
            
        case kBarcodeFormatPDF417:
            return LanguageKey.PDF417
            
        case kBarcodeFormatQRCode:
            return LanguageKey.QR_Code
            
        case kBarcodeFormatRSS14:
            return LanguageKey.RSS_14
            
        case kBarcodeFormatRSSExpanded:
            return LanguageKey.RSS_Expanded
            
        case kBarcodeFormatUPCA:
            return LanguageKey.UPCA
            
        case kBarcodeFormatUPCE:
            return LanguageKey.UPCE
            
        case kBarcodeFormatUPCEANExtension:
            return LanguageKey.UPC_EAN_extension
            
        default:
            return LanguageKey.Unknown
        }
    }
    static func ratingApp(){
        if let url = URL(string: LanguageKey.Link_Share), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        // or outside scope use this
        guard let url = URL(string: "\(LanguageKey.Link_Share)"), !url.absoluteString.isEmpty else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

