//
//  FeedbackViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 5/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import MessageUI
struct FeedbackViewModelKey {
    public static let EMAIL = "email"
    public static let CONTENT_EMAIL = "content_email"
}
class FeedbackViewModel : FeedbackViewModelDelegate {
    var navigate: (() -> ())?
    
    var responseToView: ((String) -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var errorMessages: Bindable<Dictionary<String, String>> = Bindable(Dictionary<String, String>())
    
    var emailBinding : Bindable<String> = Bindable("")
    var objectEmailBinding : Bindable<String> = Bindable("")
    var contentEmailBinding : Bindable<String> = Bindable("")
    var email: String?{
        didSet {
            validateEmail()
        }
    }
    var objectEmail: String?{
        didSet {
        }
    }
    var contentEmail: String?{
        didSet {
            validateContentEmail()
        }
    }
    func validateEmail() {
        if email == nil || !ValidatorHelper.minLength(email) {
            errorMessages.value[GenerateViewModelKey.EMAIL] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorEmailRequired) ?? ""
        }
        else if !ValidatorHelper.isValidEmail(email){
            errorMessages.value[GenerateViewModelKey.EMAIL] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorEmailInvalid) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.EMAIL)
        }
    }
    
    /**
     ValidateMessageEmail
     */
    func validateContentEmail(){
        if contentEmail == nil || !ValidatorHelper.minLength(contentEmail,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorMessageEmailRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.MESSAGE_EMAIL)
        }
    }
    private let userService: UserService
    init(userService: UserService = UserService()) {
        self.userService = userService
        self.emailBinding = Bindable("")
        self.contentEmailBinding = Bindable("")
    }
    func doSend(){
        
            validateEmail()
        validateContentEmail()
            if ( errorMessages.value.count > 0 ) {
                return
            }
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
            
            
        
    }
}
