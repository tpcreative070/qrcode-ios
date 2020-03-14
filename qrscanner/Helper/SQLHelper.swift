//
//  SQLHelper.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import SQLite
class SQLShareHelper {
    static let shared =  SQLShareHelper()
    private var connection : Connection?
    func setConnection(db : Connection? = nil){
        self.connection = db
    }
    func getConnection() ->Connection?{
        return connection
    }
}

class SQLHelper {
    
    class open func connect(mKey : String,url : String) ->Connection?{
        do {
            if let mConnection = SQLShareHelper.shared.getConnection()  {
                debugPrint("Already connected to SQLine")
                return mConnection
            }
            let  db = try Connection(url)
            SQLShareHelper.shared.setConnection(db: db)
            debugPrint("Connected successfully!!!")
            return db
        } catch let error{
            debugPrint("SQLite Database Error \(error.localizedDescription)")
            return nil
        }
//        return nil
    }
    
    class open func initCipher(isDelete : Bool? = nil){
        guard let mData = DocumentHelper.loadBundle(fileName: "qrscanner", mExtension: FolderName.db)
            else {
            debugPrint("Not found...")
            return
        }
        writeFile(data: mData,isDelete: isDelete)
    }
    
    class open func writeFile(data : Data,isDelete : Bool? = nil){
        let fileName = "qrscanner.db"
        if let _ = isDelete {
            DocumentHelper.createdFile(data: data, folderName: FolderName.db,fileName: fileName)
            return
        }
        guard let _ = DocumentHelper.getFilePath(fileName: fileName,folderName: FolderName.db) else {
            DocumentHelper.createdFile(data: data, folderName: FolderName.db,fileName: fileName)
            debugPrint("qrscanner.db was created")
            return
        }
    }
    
    class open func getPathFile() -> Bool{
        let fileName = "qrscanner"
        guard let _ = DocumentHelper.getFilePath(fileName: fileName,folderName: FolderName.db) else {
            return false
        }
        return true
    }
    
    class open func connection() -> Connection?{
        let fileName = "qrscanner.db"
        guard let mUrl = DocumentHelper.getFilePath(fileName: fileName,folderName: FolderName.db) else {
            return nil
        }
        
        guard let mKey = CommonService.getMasterKey() else {
            guard let db = SQLHelper.connect(mKey: CipherKey.Key,url: mUrl.path) else {
                return nil
            }
            return db
        }
      //  debugPrint("Key to connect db : \(mKey)")
        guard let db = SQLHelper.connect(mKey: mKey,url: mUrl.path) else {
            return nil
        }
        return db
    }
    
    /*Get object*/
    class open func getTranslations(key : String) -> TranslationEntityModel?{
        guard let db = connection() else {
               return nil
        }
        return TranslationEntity.instance.getObject(db: db, key: key)
     }
    
    /*Get object*/
    class open func insertTranslations(data : TranslationEntityModel){
        guard let db = connection() else {
               return
        }
        TranslationEntity.instance.insert(db: db, data: data)
     }
    /*CreateTranlation*/
    class open func createTranlation(){
        guard let db = connection() else {
            return
        }
        TranslationEntity.instance.createTable(db: db)
    }
    /*Create Scanner*/
       class open func createScanner(){
           guard let db = connection() else {
               return
           }
           ScannerEntity.instance.createTable(db: db)
       }
       
       /*Insert Scanner*/
       class open func insertedScanner(data : GenerateModel) -> Bool{
           guard let db = connection() else {
               return false
           }
           return ScannerEntity.instance.insert(db: db, data: data)
       }
       
       /*Update Scanner*/
       class open func updatedScanner(createDatetime : Int, value : Int){
           guard let db = connection() else {
               return
           }
           return ScannerEntity.instance.update(db: db, mcreateDatetime:createDatetime , value: value)
       }
       
       /*Get object Scanner*/
       class open func getHistories(createDatetime : Int) -> GenerateModel?{
           guard let db = connection() else {
               return nil
           }
           return ScannerEntity.instance.getObject(db: db, key: createDatetime)
       }
       
      
    /*Get list histories*/
    class open func getListHistories() -> [GenerateModel]?{
        guard let db = connection() else {
            return nil
        }
        return ScannerEntity.instance.getListHistory(db: db)
    }
    /*Get list save*/
    class open func getListSave() -> [GenerateModel]?{
        guard let db = connection() else {
            return nil
        }
        return ScannerEntity.instance.getListSave(db: db)
    }
}


