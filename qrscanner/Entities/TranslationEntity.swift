//
//  TranslationEntity.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import SQLite
class TranslationEntity {
    static let instance = TranslationEntity()
    private let table = Table("translation")
     
    private let identify = Expression<String>("identify")
    private let lang = Expression<String>("lang")
    private let translations =  Expression<String>("translations")
    
    private init(){
           
    }
       
    func createTable(db : Connection){
        do{
            try db.run(table.create { t in
                t.column(lang, primaryKey: true)
                t.column(identify)
                t.column(translations)
            })
        }catch {
            debugPrint(error)
        }
    }
       
    func insert(db : Connection,data : TranslationEntityModel){
           do{
         
            let insert = table.insert(identify <- data.identify!, lang <- data.lang! , translations <- data.translations!)
               try db.run(insert)
            debugPrint("Insert successful")
           }catch {
               debugPrint(error)
           }
    }
    
    func getObject(db : Connection,key : String) -> TranslationEntityModel?{
           do{
               let query = table.select(table[*])  // SELECT "email" FROM "users"
                   .filter(lang == key)    // WHERE "name" IS NOT NULL
                   .limit(1)
            
                let response = try db.prepare(query).map({(event) -> TranslationEntityModel in
                   return TranslationEntityModel(identify: event[identify], lang: event[lang], translations: event[translations])
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
