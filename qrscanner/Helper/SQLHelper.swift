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
      
        guard let mData = DocumentHelper.loadBundle(fileName: "qrscanner", mExtension: FolderName.db) else {
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

        let fileName = "qrscanner.db"
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
           GenerateEntity.instance.createTable(db: db)
       }
       
       /*Insert Scanner*/
       class open func insertedScanner(data : GenerateEntityModel) -> Bool{
           guard let db = connection() else {
               return false
           }
           return GenerateEntity.instance.insert(db: db, data: data)
       }
       
       /*Update Scanner*/
    class open func updatedScanner(data : GenerateEntityModel){
           guard let db = connection() else {
               return
           }
        print(data.createdDateTime)
        print(data.updatedDateTime)
        return GenerateEntity.instance.update(db: db, data : data)
       }
       
       /*Get object Scanner*/
       class open func getHistories(createDatetime : Int) -> GenerateEntityModel?{
           guard let db = connection() else {
               return nil
           }
           return GenerateEntity.instance.getObject(db: db, key: createDatetime)
       }
       
      
    /*Get list histories*/
    class open func getListHistories() -> [GenerateEntityModel]?{
        guard let db = connection() else {
            return nil
        }
         GenerateEntity.instance.delete(db: db, value: false)
        return GenerateEntity.instance.getListHistory(db: db)
    }
    /*Get list histories type*/
    class open func getListHistoriesByType(typecode: String) -> [GenerateEntityModel]?{
        guard let db = connection() else {
            return nil
        }
        return GenerateEntity.instance.getListHistoryByType(db: db, typecode: typecode)
    }
    /*Get list save*/
    class open func getListSave() -> [GenerateEntityModel]?{
        guard let db = connection() else {
            return nil
        }
        GenerateEntity.instance.delete(db: db, value: false)
        return GenerateEntity.instance.getListSave(db: db)
    }
    /*Delete */
     /*  class open func deleteScanner(createDateTime : Int) ->Bool{
           guard let db = connection() else {
               return false
           }
        return GenerateEntity.instance.delete(db: db, value: (createDateTime))
       }
     */
    /*Update History*/
    class open func updateHistory(createDateTime : Int, value: Bool) ->Bool{
             guard let db = connection() else {
                 return false
             }
            return GenerateEntity.instance.updateHistory(db: db, mcreateDatetime: createDateTime, value: value)
         }
    /*Update Save*/
    class open func updateSave(createDateTime : Int, value: Bool) ->Bool{
             guard let db = connection() else {
                 return false
             }
            return GenerateEntity.instance.updateSave(db: db, mcreateDatetime: createDateTime, value: value)
         }
    /*Get list histories*/
    /*Delete */
       class open func getItemScanner(createDateTime : Int) -> GenerateEntityModel?{
           guard let db = connection() else {
               return nil
           }
        return GenerateEntity.instance.getObject(db: db, key: (createDateTime))
       }
    /*Get list history transaction*/
    class open func getListTransaction(transaction : String) -> [GenerateEntityModel]?{
        guard let db = connection() else {
            return nil
        }
        return GenerateEntity.instance.getTransaction(db: db, key: transaction)
    }
    /*Check Item Exist*/
         class open func checkItemExist(data : GenerateEntityModel) -> Int64{
             guard let db = connection() else {
                 return 0
             }
             return GenerateEntity.instance.checkObject(db: db, data: data)
         }
}


