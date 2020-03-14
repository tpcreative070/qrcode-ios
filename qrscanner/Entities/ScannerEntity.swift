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
        private let createdDateTime = Expression<Int>("createdDateTime")
        private let typeCode = Expression<String>("typeCode")
        private let content = Expression<String>("content")
        private let isHistory  = Expression<Bool>("isHistory")
        private let isSave  = Expression<Bool>("isSave")
        private let updatedDateTime  = Expression<Int>("updatedDateTime")
    private let bookMark  = Expression<Bool>("bookMark")

    
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
                print("create table")
                    
                    insert(db: db, data: GenerateModel(createdDateTime: 124, typeCode: "text", content: "{\"text\":\"hello\"}", isHistory: true, isSave: true, updatedDateTime: 124, bookMark : false))
                    insert(db: db, data: GenerateModel(createdDateTime: 125, typeCode: "url", content: "{\"url\":\"http://gg.com\"}", isHistory: true, isSave: true, updatedDateTime: 125, bookMark : false))
                     insert(db: db, data: GenerateModel(createdDateTime: 126, typeCode: "url", content: "{\"url\":\"http://gedfg.com\"}", isHistory: true, isSave: true, updatedDateTime: 126, bookMark : false))
                     insert(db: db, data: GenerateModel(createdDateTime: 127, typeCode: "text", content: "{\"text\":\"dfdfsdf\"}", isHistory: true, isSave: true, updatedDateTime: 127, bookMark : false))
//                    insert(db: db, data: ScannerEntityModel(createdDateTime: "222", typeCode: "url", content: "{\"url\":\"gg.com\"}", isHistory: 1, isSave: 0, updateDateTime: "222"))
//                    insert(db: db, data: ScannerEntityModel(createdDateTime: "333", typeCode: "Event", content: "{\"title\":\"event to night\",\"loaction\":\"new york\",\"description\":\"\",\"begin\":\"25 thg 3 2020 15:19\",\"end\":\"25 thg 2 2020 22:00\"}", isHistory: 1, isSave: 0, updateDateTime: "333"))
                })
            }catch {
                debugPrint(error)
            }
        }
        
        func insert(db : Connection, data : GenerateModel) -> Bool{
            let request = table.insert(createdDateTime <- Int(data.createdDateTime!),
                                       typeCode <-  data.typeCode!,
                                       content <- data.content!,
                                       isHistory <- data.isHistory!,
                                       isSave <- data.isSave!,
                                       updatedDateTime <- Int(data.updatedDateTime!),
                                        bookMark <- data.bookMark!

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
        
        func getListHistory(db : Connection) -> [GenerateModel]?{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
                    .filter(isHistory == true)
                    .order(updatedDateTime.asc)
                let response = try db.prepare(query).map({(event) -> GenerateModel in
                    return GenerateModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark])
                })
                return response
            }catch {
                debugPrint(error)
            }
            return nil
        }
        func getListSave(db : Connection) -> [GenerateModel]?{
                   do{
                       let query = table.select(table[*])  // SELECT "email" FROM "users"
                           .filter(isSave == true)
                           .order(updatedDateTime.asc)
                       let response = try db.prepare(query).map({(event) -> GenerateModel in
                           return GenerateModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark])
                       })
                       return response
                   }catch {
                       debugPrint(error)
                   }
                   return nil
               }
     
        
        func delete(db : Connection, value : Int) ->Bool{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
                    .filter(updatedDateTime == value)   // WHERE "name" IS NOT NULL
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
        
        func update(db : Connection,mcreateDatetime : Int , value : Int){
            let request = table.filter(createdDateTime == mcreateDatetime).update(updatedDateTime <- value)
            do{
                try db.run(request)
                debugPrint("Updated successfully")
            }catch {
                debugPrint(error)
            }
        }
        func getObject(db : Connection,key : Int) -> GenerateModel?{
            do{
                let query = table.select(table[*])  // SELECT "email" FROM "users"
                    .filter(createdDateTime == key)    // WHERE "name" IS NOT NULL
                    .limit(1)
                let response = try db.prepare(query).map({(event) -> GenerateModel in
                  return GenerateModel(createdDateTime: event[createdDateTime], typeCode: event[typeCode],content: event[content], isHistory: event[isHistory], isSave: event[isSave], updatedDateTime: event[updatedDateTime], bookMark: event[bookMark])
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

