//
//  EmailViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class EmailViewModel : Codable , EmailViewModelDelegate{
    var toTxtView : String {
        return email ?? ""
    }
    var subjectView : String{
        return objectEmail ?? ""
    }
    var messageView : String{
        return messageEmail ?? ""
    }
    var email: String?
    var messageEmail: String?
    var objectEmail: String?
    
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    
    init(to: String, subject: String, message: String) {
        self.email = to
        self.messageEmail = message
        self.objectEmail = subject
    }
    init(data: EmailModel){
        self.email = data.email ?? ""
        self.messageEmail = data.messageEmail ?? ""
        self.objectEmail = data.objectEmail ?? ""
    }
    init() {
        
    }
    init(dataEmail: EmailModel,dataValue: ValuePushModel) {
        self.email = dataEmail.email!
        self.messageEmail = dataEmail.messageEmail ?? ""
        self.objectEmail = dataEmail.objectEmail ?? ""
        self.createDateTime = dataValue.createDateTime
        self.typeCode = dataValue.typeCode
        self.isSeen = dataValue.isSeen
    }
    init(data: ValuePushModel) {
        self.createDateTime = data.createDateTime
        self.typeCode = data.typeCode
        self.isSeen = data.isSeen
        self.isUpdate = data.isUpdate
    }
}
