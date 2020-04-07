//
//  ScannerEntity.swift
//  qrscanner
//
//  Created by Mac10 on 3/3/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import SQLite
class GenerateEntity{
    static let instance = GenerateEntity()
    private let table = Table("scanner")
    private let createdDateTime = Expression<Int>("createdDateTime")
    private let typeCode = Expression<String>("typeCode")
    private let content = Expression<String>("content")
    private let isHistory  = Expression<Bool>("isHistory")
    private let isSave  = Expression<Bool>("isSave")
    private let updatedDateTime  = Expression<Int>("updatedDateTime")
    private let bookMark  = Expression<Bool>("bookMark")
    private let transactionID = Expression<String>("transactionID")
    private let isCode = Expression<String>("isCode")

    
    private init() {
        
    }
    
    func createTable(db : Connection){
        do{
            try db.run(table.create { t in
                t.column(createdDateTime,primaryKey: true)
                t.column(typeCode)
                t.column(content)
                t.column(isHistory)
                t.column(isSave)
                t.column(updatedDateTime)
                t.column(bookMark)
                t.column(transactionID)
                t.column(isCode)

                
             
            })
        }catch {
            debugPrint(error)
        }
    }
    
    func insert(db : Connection, data : GenerateEntityModel) -> Bool{
        let request = table.insert(createdDateTime <- Int(data.createdDateTime!),
                                   typeCode <-  data.typeCode!,
                                   content <- data.content!,
                                   isHistory <- data.isHistory!,
                                   isSave <- data.isSave!,
                                   updatedDateTime <- Int(data.updatedDateTime!),
                                   bookMark <- data.bookMark!,
            transactionID <- data.transactionID!,
            isCode <- data.isCode!


            
        )
        do{
            //let insert = try table.insert(data)
            try db.run(request)
            debugPrint("Inserted contact successfully")
            return true
        }catch {
            debugPrint(error)
        }
        return false
    }
    
    func getListHistory(db : Connection) -> [GenerateEntityModel]?{
        do{
            let query = table.select(table[*])  // SELECT "email" FROM "users"
                .filter(isHistory == true)
                .order(updatedDateTime.asc)
            let response = try db.prepare(query).map({(event) -> GenerateEntityModel in
                return GenerateEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark], transactionID: event[transactionID], isCode: event[isCode])
            })
            return response
        }catch {
            debugPrint(error)
        }
        return nil
    }
    func getListSave(db : Connection) -> [GenerateEntityModel]?{
        do{
            let query = table.select(table[*])  // SELECT "email" FROM "users"
                .filter(isSave == true)
                .order(updatedDateTime.asc)
            let response = try db.prepare(query).map({(event) -> GenerateEntityModel in
                return GenerateEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark], transactionID: event[transactionID], isCode: event[isCode])
            })
            return response
        }catch {
            debugPrint(error)
        }
        return nil
    }
    
    
    func delete(db : Connection, value : Bool) ->Bool{
        do{
            let query = table.select(table[*])  // SELECT "email" FROM "users"
                .filter(isHistory == value)   // WHERE "name" IS NOT NULL
                .filter(isSave == value)
            try db.run(query.delete())
            debugPrint("Deleted successfully")
            return true
        }catch {
            debugPrint(error)
        }
        return false
    }
    
    func delete(db : Connection){
        do{
            let query = table.select(table[*])  // SELECT "email" FROM "users"
            try db.run(query.delete())
            debugPrint("Deleted successfully")
        }catch {
            debugPrint(error)
        }
    }
    
    func update(db : Connection, data: GenerateEntityModel){
        let request = table.filter(createdDateTime == Int(data.createdDateTime!)).update(updatedDateTime <- Int(data.createdDateTime!), content <- (data.content)!)
        do{
            try db.run(request)
            debugPrint("Updated successfully")
            
        }catch {
            debugPrint(error)
        }
    }
    func updateHistory(db : Connection,mcreateDatetime : Int , value : Bool) -> Bool{
        let request = table.filter(createdDateTime == mcreateDatetime).update(isHistory <- value)
        do{
            try db.run(request)
            debugPrint("Updated successfully")
            return true
        }catch {
            debugPrint(error)
            return false
        }
    }
    func updateSave(db : Connection,mcreateDatetime : Int , value : Bool) -> Bool{
        let request = table.filter(createdDateTime == mcreateDatetime).update(isSave <- value)
        do{
            try db.run(request)
            debugPrint("Updated successfully")
            return true
        }catch {
            debugPrint(error)
            return false
        }
    }
    func getObject(db : Connection,key : Int) -> GenerateEntityModel?{
        do{
            let query = table.select(table[*])  // SELECT "email" FROM "users"
                .filter(createdDateTime == key)    // WHERE "name" IS NOT NULL
                .limit(1)
            let response = try db.prepare(query).map({(event) -> GenerateEntityModel in
                return GenerateEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark], transactionID: event[transactionID], isCode: event[isCode])
            })
            if response.count > 0{
                return response[0]
            }
            return nil
        }catch {
            debugPrint(error)
        }
        return nil
    }
    func getTransaction(db : Connection,key : String) -> [GenerateEntityModel]?{
          do{
                     let query = table.select(table[*])  // SELECT "email" FROM "users"
                         .filter(transactionID == key)
                         .order(updatedDateTime.asc)
                     let response = try db.prepare(query).map({(event) -> GenerateEntityModel in
                         return GenerateEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark], transactionID: event[transactionID], isCode: event[isCode])
                     })
                     return response
                 }catch {
                     debugPrint(error)
                 }
                 return nil
       }
}

