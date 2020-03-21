//
//  MessageGenerateViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
struct GenerateViewModelKey {
    public static let TO = "to"
    public static let MESSAGE = "message"
    public static let URL = "url"
    public static let TEXT = "text"
    public static let EMAIL = "email"
    public static let OBJECT_EMAIL = "object_email"
    public static let MESSAGE_EMAIL = "message_email"
    public static let PHONE_TELEPHONE = "phone_telephone"
    public static let FULLNAME_CONTACT = "fullname_contact"
    public static let ADDRESS_CONTACT = "address_contact"
    public static let PHONE_CONTACT = "phone_contact"
    public static let EMAIL_CONTACT = "email_contact"
    public static let LAT = "lat"
    public static let LON = "lon"
    public static let QUERY = "query"
    public static let TITLE_EVENT = "title_event"
    public static let LOCATION_EVENT = "location_event"
    public static let DESCRIPTION_EVENT = "description_event"
    public static let BEGINTIME_EVENT = "begintime_event"
    public static let ENDTIME_EVENT = "endtime_event"
    public static let SSID = "ssid"
    public static let PASSWORD = "password"
    public static let PROTECT = "protect"

}
class GenerateViewModel : GenerateViewModelDelegate {
    
    
    
    
    var navigate: (() -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var errorMessages: Bindable<Dictionary<String, String>> = Bindable(Dictionary<String, String>())
    var responseToView: ((String) -> ())?
    var focusTextField: UITextField?
    var result : UIImage = UIImage()
    var typeCode : String = ""
    /*Url*/
    var urlBinding : Bindable<String> = Bindable("")
    var url: String?{
        didSet {
            validateUrl()
        }
    }
    /*Text*/
    var textBinding : Bindable<String> = Bindable("")
    var text: String?{
        didSet {
            validateText()
        }
    }
    /*Email*/
    var emailBinding : Bindable<String> = Bindable("")
    var objectEmailBinding : Bindable<String> = Bindable("")
    var messageEmailBinding : Bindable<String> = Bindable("")
    var email: String?{
        didSet {
            validateEmail()
        }
    }
    var objectEmail: String?{
        didSet {
            validateObjectEmail()
        }
    }
    var messageEmail: String?{
        didSet {
            validateMessageEmail()
        }
    }
    /*Telephone*/
    var phoneTelephoneBinding : Bindable<String> = Bindable("")
    var phoneTelephone: String?{
        didSet {
            validatePhoneTelephoneNumber()
        }
    }
    /*Message*/
    var toBinding : Bindable<String> = Bindable("")
    var messageBinding : Bindable<String> = Bindable("")

    var to: String? {
        didSet {
            validateTo()
        }
    }
    var message: String? {
        didSet{
            validateMessage()
        }
    }
    /*Contact*/
    var fullNameContactBinding : Bindable<String> = Bindable("")
    var addressContactBinding : Bindable<String> = Bindable("")
    var phoneContactBinding : Bindable<String> = Bindable("")
    var emailContactBinding : Bindable<String> = Bindable("")
    var fullNameContact: String?{
        didSet{
            validateFullnameContact()
        }
    }
    
    var addressContact: String?{
        didSet{
            validateAddressContact()
        }
    }
    
    var phoneContact: String?{
        didSet{
            validatePhoneContact()
        }
    }
    
    var emailContact: String?{
        didSet{
            validateEmailContact()
            
        }
    }
    /*Location*/
    var latBinding : Bindable<Float> = Bindable(0.0)
    var lonBinding : Bindable<Float> = Bindable(0.0)
    var queryBinding : Bindable<String> = Bindable("")

    var lat: Float?{
        didSet {
            validateLat()
        }
    }
    var lon: Float?{
        didSet {
            validateLon()
        }
    }
    var query: String?{
        didSet {
            validateQuery()
        }
    }
    /*Event*/
    var titleEventBinding : Bindable<String> = Bindable("")
    var locationEventBinding : Bindable<String> = Bindable("")
    var descriptionEventBinding : Bindable<String> = Bindable("")
    var beginTimeEventBinding : Bindable<Date> = Bindable(Date())
    var endTimeEventBinding : Bindable<Date> = Bindable(Date())

    var titleEvent: String?{
        didSet {
            validateTitleEvent()
        }
    }
    var locationEvent: String?{
        didSet {
            validateLocationEvent()
        }
    }
    var descriptionEvent: String?{
        didSet {
            validateDescriptionEvent()
        }
    }
    var beginTimeEvent: Date?{
        didSet {
            validateBeginTimeEvent()
        }
    }
    var endTimeEvent: Date?{
        didSet {
            validateEndTimeEvent()
        }
    }
    /*Wifi*/
    var ssidBinding : Bindable<String> = Bindable("")
    var passwordBinding : Bindable<String> = Bindable("")
    var protectBinding : Bindable<String> = Bindable("")

    var ssid: String?{
        didSet {
            validateSSID()
        }
    }
    var password: String?{
        didSet {
            validatePassword()
        }
    }
    var protect: String?{
        didSet {
           // validateProtect()
        }
    }
    /**
     ValidatePhoneTelephonenumber
     */
    func validatePhoneTelephoneNumber(){
        if phoneTelephone == nil || !ValidatorHelper.minLength(phoneTelephone) {
            errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPhoneNumberRequired) ?? ""
        }
        else if !ValidatorHelper.minLength(phoneTelephone, minLength: 10) || !ValidatorHelper.maxLength(phoneTelephone, maxLength: 10){
            errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPhoneNumberInvalid) ?? ""
        }
        else {
            debugPrint("Verified phone number...")
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.PHONE_TELEPHONE)
        }
    }
    /**
     ValidateTonumber
     */
    func validateTo(){
        if to == nil || !ValidatorHelper.minLength(to,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.TO] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorToRequired ) ?? ""
        }
            
        else {
            debugPrint("Verified to...")
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.TO)
        }
    }
    /**
     ValidateMessage
     */
    func validateMessage(){
        if message == nil || !ValidatorHelper.minLength(message,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.MESSAGE] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorMessageEmailRequired) ?? ""
        }
            
        else {
            debugPrint("Verified message...")
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.MESSAGE)
        }
    }
    /**
     ValidateUrl
     */
    
    func validateUrl(){
        if url == nil || !ValidatorHelper.minLength(url,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.URL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorUrlRequired) ?? ""
        }
//        else if ((url!.range(of: "http://", options: .caseInsensitive) == nil)) || (((url!.range(of: "https://", options: .caseInsensitive) == nil)))
//            {
//            errorMessages.value[GenerateViewModelKey.URL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorUrlInvalid) ?? ""
//        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.URL)
        }
    }
    /**
     ValidateText
     */
    func validateText(){
        if text == nil || !ValidatorHelper.minLength(text,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.TEXT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorTextRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.TEXT)
        }
    }
    /**
     Validation for email field
     */
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
     ValidateObjectEmail
     */
    func validateObjectEmail(){
        if objectEmail == nil || !ValidatorHelper.minLength(objectEmail,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorObjectEmailRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.OBJECT_EMAIL)
        }
    }
    /**
     ValidateMessageEmail
     */
    func validateMessageEmail(){
        if messageEmail == nil || !ValidatorHelper.minLength(messageEmail,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorMessageEmailRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.MESSAGE_EMAIL)
        }
    }
    /**
     ValidateFullnameContact
     */
    func validateFullnameContact(){
        if fullNameContact == nil || !ValidatorHelper.minLength(fullNameContact,minLength: 3) {
            errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorFullNameContactRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.FULLNAME_CONTACT)
        }
    }
    /**
     ValidateAddressContact
     */
    func validateAddressContact(){
        if addressContact == nil || !ValidatorHelper.minLength(addressContact,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorAddressContactRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.ADDRESS_CONTACT)
        }
    }
    /**
     ValidatePhoneContact
     */
    func validatePhoneContact(){
        if phoneContact == nil || !ValidatorHelper.minLength(phoneContact,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPhoneContactRequired ) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.PHONE_CONTACT)
        }
    }
    /**
     ValidateEMailContact
     */
    func validateEmailContact() {
        if emailContact == nil || !ValidatorHelper.minLength(emailContact) {
            errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorEmailContactRequired) ?? ""
        }
        else if !ValidatorHelper.isValidEmail(emailContact){
            errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorEmailInvalid) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.EMAIL_CONTACT)
        }
    }
    /**
     Validatelat
     */
    func validateLat(){
        if  !ValidatorHelper.minLength(String(lat!),minLength: 1) || lat == 0.0{
            errorMessages.value[GenerateViewModelKey.LAT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorLatRequired ) ?? ""
        }
        else if !ValidatorHelper.isValidLat(lat!){
            errorMessages.value[GenerateViewModelKey.LAT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorLatInvalid ) ?? ""
        }
        else {
            debugPrint("Verified to...")
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.LAT)
        }
    }
    /**
     ValidateLon
     */
    func validateLon(){
        if  !ValidatorHelper.minLength(String(lat!),minLength: 1) || lon == 0.0{
            errorMessages.value[GenerateViewModelKey.LON] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorLonRequired ) ?? ""
        }
        else if !ValidatorHelper.isValidLon(lon!){
            errorMessages.value[GenerateViewModelKey.LON] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorLonInvalid ) ?? ""
        }
        else {
            debugPrint("Verified to...")
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.LON)
        }
    }
    /**
        ValidateTitleEvent
        */
       func validateTitleEvent(){
           if titleEvent == nil || !ValidatorHelper.minLength(titleEvent,minLength: 1) {
               errorMessages.value[GenerateViewModelKey.TITLE_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorTitleEventRequired ) ?? ""
           }
           else {
               errorMessages.value.removeValue(forKey: GenerateViewModelKey.TITLE_EVENT)
           }
       }
    /**
           ValidateLocationEvent
           */
          func validateLocationEvent(){
              if locationEvent == nil || !ValidatorHelper.minLength(locationEvent,minLength: 1) {
                  errorMessages.value[GenerateViewModelKey.LOCATION_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorLocationEventRequired ) ?? ""
              }
              else {
                  errorMessages.value.removeValue(forKey: GenerateViewModelKey.LOCATION_EVENT)
              }
          }
    private let userService: UserService
    /**
     ValidateQuery
     */
    func validateQuery(){
        if query == nil || !ValidatorHelper.minLength(query,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.QUERY] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorQueryRequired) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.QUERY)
        }
    }
    /**
     ValidateDescription
     */
    func validateDescriptionEvent(){
        if descriptionEvent == nil || !ValidatorHelper.minLength(descriptionEvent,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.DESCRIPTION_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorDescriptionEventRequired) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.DESCRIPTION_EVENT)
        }
    }
    /**
     ValidateBeginTime
     */
    func validateBeginTimeEvent(){
        print(beginTimeEvent)
        if beginTimeEvent == nil {
            errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorQueryRequired) ?? ""
        }
        else if (endTimeEvent != nil && beginTimeEvent! > endTimeEvent!){
            errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorBeginDateGreaterEndDate) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.BEGINTIME_EVENT)
        }
    }
    /**
     ValidateEndTime
     */
    func validateEndTimeEvent(){
        print(endTimeEvent)
        if beginTimeEvent == nil {
            errorMessages.value[GenerateViewModelKey.ENDTIME_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorEndTimeRequired) ?? ""
        }
        else if (beginTimeEvent != nil && beginTimeEvent! > endTimeEvent!){
            errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorBeginDateGreaterEndDate) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.ENDTIME_EVENT)
        }
    }
    /**
     ValidateSSID
     */
    func validateSSID(){
        if ssid == nil || !ValidatorHelper.minLength(ssid,minLength: 1) {
            errorMessages.value[GenerateViewModelKey.SSID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorSSIDRequired) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.SSID)
        }
    }
    /**
        ValidateSSID
        */
       func validatePassword(){
           if password == nil || !ValidatorHelper.minLength(password,minLength: 1) {
               errorMessages.value[GenerateViewModelKey.SSID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPassWordWifiRequired) ?? ""
           }
           else {
               errorMessages.value.removeValue(forKey: GenerateViewModelKey.PASSWORD)
           }
       }
    /**
     Init model with user service
     */
    init(userService: UserService = UserService()) {
      self.userService = userService
      self.urlBinding = Bindable("")
      self.textBinding = Bindable("")
        self.emailBinding = Bindable("")
        self.objectEmailBinding = Bindable("")
        self.messageEmailBinding = Bindable("")
        self.phoneTelephoneBinding = Bindable("")
        self.toBinding = Bindable("")
        self.messageBinding = Bindable("")
        self.fullNameContactBinding = Bindable("")
        self.addressContactBinding = Bindable("")
        self.phoneContactBinding = Bindable("")
        self.emailContactBinding = Bindable("")
        self.latBinding = Bindable(0.0)
        self.lonBinding = Bindable(0.0)
        self.queryBinding = Bindable("")
        self.titleEventBinding = Bindable("")
        self.locationEventBinding = Bindable("")
        self.descriptionEventBinding = Bindable("")
        self.beginTimeEventBinding = Bindable(Date())
        self.endTimeEventBinding = Bindable(Date())
        self.ssidBinding = Bindable("")
        self.passwordBinding = Bindable("")
        self.protectBinding = Bindable("")
    }
    
    func doGenerateValue(){
        var value = ""
        print(typeCode)
        //typeCode = typeCode.uppercased()
        if typeCode == LanguageKey.Url{
            validateUrl()
            if ( errorMessages.value.count > 0 ) {
                return
            }
         
                value = "\(url!)"
        
        }
        else if typeCode == LanguageKey.Text{
            validateText()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "\(text!)"
            }
        }
        else if typeCode == LanguageKey.Location{
            validateLat()
            validateLon()
            validateQuery()
            if ( errorMessages.value.count > 0 ) {
                       return
                   }
                   else{
                       value = "geo:\(lat!),\(lon!)?q=\(query!)"
                   }
                    }
        else if typeCode == LanguageKey.Email{
            validateEmail()
            validateObjectEmail()
            validateMessageEmail()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "mailto:\(email!)?subject=\(objectEmail!)&body=\(messageEmail!)"
            }
        }
        else if typeCode == LanguageKey.Event{
            validateTitleEvent()
            validateLocationEvent()
            validateDescriptionEvent()
            validateBeginTimeEvent()
            validateEndTimeEvent()
            if ( errorMessages.value.count > 0 ) {
                           return
                       }
                       else{
                            let df = DateFormatter()
                                                       df.locale = Locale(identifier: "en_US_POSIX")
                                                       df.timeZone = TimeZone.autoupdatingCurrent
                                                       df.dateFormat = "yyyyMMdd'T'HHmmss"
                                                       let startDate = df.string(from: beginTimeEvent!)
                                                       let endDate = df.string(from: endTimeEvent!)
                                                       value = "BEGIN:VCALENDAR\nVERSION:2.0\nBEGIN:VEVENT\nSUMMARY:\(titleEvent!)\nLOCATION: \(locationEvent!)\nDESCRIPTION:\(descriptionEvent!)\nDTSTART: \(startDate)\nDTEND:\(endDate)\nEND:VEVENT\nEND:VCALENDAR"
                            //                       }
                                       
                       }
           
            
            
        }
        else if typeCode == LanguageKey.Message{
            validateTo()
            validateMessage()
            print(errorMessages.value)
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "SMSTO:\(to!):\(message!)"
            }
        }
        else if typeCode == LanguageKey.Wifi{
            validateSSID()
            validatePassword()
            if ( errorMessages.value.count > 0 ) {
                           return
                       }
                       else{
                value = "WIFI:T:\(protect!);S:\(ssid!);P:\(password!);;"
                       }

        }
        else if typeCode == LanguageKey.Telephone{
            validatePhoneTelephoneNumber()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "tel:\(phoneTelephone!)"
            }
        }
        else if typeCode == LanguageKey.Contact{
            validateFullnameContact()
            validateEmailContact()
            validatePhoneContact()
            validateAddressContact()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "MECARD:N:\(fullNameContact!);ADR:\(addressContact!);TEL:\(phoneContact!);EMAIL:\(emailContact!);;"
            }
        }
        
        result = generateDataQRCode(from: value)!
        if (result != nil) {
            responseToView!(EnumResponseToView.CREATE_SUCCESS.rawValue)
        }
        
    }
    func generateDataQRCode(from string: String) -> UIImage? {
        do {
            let writer = ZXMultiFormatWriter()
            let hints = ZXEncodeHints() as ZXEncodeHints
            hints.encoding = String.Encoding.utf8.rawValue
            let result = try writer.encode(string, format: kBarcodeFormatQRCode, width: 500, height: 500, hints: hints)
            if let imageRef = ZXImage.init(matrix: result, on: UIColor.blue.cgColor, offColor: nil) {
                if let image = imageRef.cgimage {
                    
                    return UIImage.init(cgImage: image)
                }
            }
        }
        catch {
            print(error)
        }
        return nil
    }
}
