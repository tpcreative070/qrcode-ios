//
//  ScannerEntity.swift
//  qrscanner
//
//  Created by Mac10 on 3/3/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import SQLite
class ScannerEntity{
        static let instance = ScannerEntity()
        private let table = Table("scanner")
        private let createdDateTime = Expression<String>("createdDateTime")
        private let typeCode = Expression<String>("typeCode")
        private let content = Expression<String>("content")
        private let isHistory  = Expression<Int>("isHistory")
        private let isSave  = Expression<Int>("isSave")
        private let updatedDateTime  = Expression<String>("updatedDateTime")
    
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
                print("create table")
                    
                    insert(db: db, data: ScannerEntityModel(createdDateTime: "1224", typeCode: "text", content: "{text:hello}", isHistory: 1, isSave: 0, updateDateTime: "234353"))
                      insert(db: db, data: ScannerEntityModel(createdDateTime: "346", typeCode: "url", content: "{url:gg.com}", isHistory: 1, isSave: 0, updateDateTime: "1234324"))
                })
            }catch {
                debugPrint(error)
            }
        }
        
        func insert(db : Connection, data : ScannerEntityModel) -> Bool{
            let request = table.insert(createdDateTime <- data.createdDateTime!,
                                       typeCode <-  data.typeCode!,
                                       content <- data.content!,
                                       isHistory <- (data.isHistory!),
                                       isSave <- (data.isSave!),
                                       updatedDateTime <- data.updatedDateTime!
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
        
        func getList(db : Connection) -> [ScannerEntityModel]?{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
//                    .filter(isHistory == 1)
                let response = try db.prepare(query).map({(event) -> ScannerEntityModel in
                    return ScannerEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updateDateTime: event[updatedDateTime])
                })
                return response
            }catch {
                debugPrint(error)
            }
            return nil
        }
        
     
        
        func delete(db : Connection, value : String) ->Bool{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
                    .filter(createdDateTime == value)   // WHERE "name" IS NOT NULL
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
        
        func update(db : Connection,mcreateDatetime : String , value : String){
            let request = table.filter(createdDateTime == mcreateDatetime).update(updatedDateTime <- value)
            do{
                try db.run(request)
                debugPrint("Updated successfully")
            }catch {
                debugPrint(error)
            }
        }
        func getObject(db : Connection,key : String) -> ScannerEntityModel?{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
                    .filter(createdDateTime == key)    // WHERE "name" IS NOT NULL
                    .limit(1)
                let response = try db.prepare(query).map({(event) -> ScannerEntityModel in
                     return ScannerEntityModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updateDateTime: event[updatedDateTime])
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
       
    }

