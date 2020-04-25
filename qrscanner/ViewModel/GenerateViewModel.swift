//
//  MessageGenerateViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
import MapKit
struct GenerateViewModelKey {
    public static let TO = "to"
    public static let MESSAGE = "message"
    public static let URL = "url"
    public static let PRODUCTID = "productID"
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
    
    var beginTime : Date?
    var endTime: Date?
    let regionMeter : Double = 10000.0
    let locationManager = CLLocationManager()
    var navigate: (() -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var errorMessages: Bindable<Dictionary<String, String>> = Bindable(Dictionary<String, String>())
    var responseToView: ((String) -> ())?
    var focusTextField: UITextField?
    var result : UIImage?
    var dataImage : Data?
    var typeCode : String = ""
    var generateValue : GenerateEntityModel?
    var stringResult: String = ""
    var productIDBinding : Bindable<String> = Bindable("")
    var typeBarcodeBinding : Bindable<String> = Bindable("")
    var urlBinding : Bindable<String> = Bindable("")
    var textBinding : Bindable<String> = Bindable("")
    var emailBinding : Bindable<String> = Bindable("")
    var objectEmailBinding : Bindable<String> = Bindable("")
    var messageEmailBinding : Bindable<String> = Bindable("")
    var phoneTelephoneBinding : Bindable<String> = Bindable("")
    var fullNameContactBinding : Bindable<String> = Bindable("")
    var addressContactBinding : Bindable<String> = Bindable("")
    var phoneContactBinding : Bindable<String> = Bindable("")
    var emailContactBinding : Bindable<String> = Bindable("")
    var latBinding : Bindable<Float> = Bindable(0.0)
    var lonBinding : Bindable<Float> = Bindable(0.0)
    var queryBinding : Bindable<String> = Bindable("")
    var titleEventBinding : Bindable<String> = Bindable("")
    var locationEventBinding : Bindable<String> = Bindable("")
    var descriptionEventBinding : Bindable<String> = Bindable("")
    var beginTimeEventBinding : Bindable<Date> = Bindable(Date())
    var endTimeEventBinding : Bindable<Date> = Bindable(Date())
    var ssidBinding : Bindable<String> = Bindable("")
    var passwordBinding : Bindable<String> = Bindable("")
    var protectBinding : Bindable<String> = Bindable("")
    var text: String?{
          didSet {
              validateText()
          }
      }
    var url: String?{
        didSet {
            validateUrl()
        }
    }
    var productID: String?{
        didSet {
            if typeBarcode == "EAN_8"{
                validateProductID8()
            }
            else{
                  validateProductID13()
            }
        }
    }
    var typeBarcode: String?{
          didSet {
              
          }
      }
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
    var phoneTelephone: String?{
        didSet {
            validatePhoneTelephoneNumber()
        }
    }
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
            
        }
    }
    /**
     ValidatePhoneTelephonenumber
     */
    func validatePhoneTelephoneNumber(){
        if phoneTelephone == nil || !ValidatorHelper.minLength(phoneTelephone) {
            errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPhoneNumberRequired) ?? ""
        }
//        else if !ValidatorHelper.minLength(phoneTelephone, minLength: 10) || !ValidatorHelper.maxLength(phoneTelephone, maxLength: 10){
//            errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPhoneNumberInvalid) ?? ""
//        }
        else {
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
        else if !verifyUrl(urlString: url) {
            errorMessages.value[GenerateViewModelKey.URL] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorUrlInvalid) ?? ""
        }
        else {
            errorMessages.value.removeValue(forKey: GenerateViewModelKey.URL)
        }
    }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
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
     ValidateProductID
     */
    func validateProductID8(){
        if productID == nil || productID == ""{
            errorMessages.value[GenerateViewModelKey.PRODUCTID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductInvalid ) ?? ""
        }
            else if !ValidatorHelper.isValidNumber(productID){
                                 errorMessages.value[GenerateViewModelKey.PRODUCTID] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductRequired8) ?? ""
                             }
        else if (  !ValidatorHelper.equalLength8(productID,ength: 7) || !ValidatorHelper.equalLength8(productID,ength: 8))
        {
                     errorMessages.value[GenerateViewModelKey.PRODUCTID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductRequired8 ) ?? ""
          
           }
           else {
               errorMessages.value.removeValue(forKey: GenerateViewModelKey.PRODUCTID)
           }
    }
    func validateProductID13(){
        if productID == nil || productID == ""{
            errorMessages.value[GenerateViewModelKey.PRODUCTID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductInvalid ) ?? ""
        }
            else if !ValidatorHelper.isValidNumber(productID){
                      errorMessages.value[GenerateViewModelKey.PRODUCTID] = LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductRequired13) ?? ""
                  }
        else if (  !ValidatorHelper.equalLength13(productID,ength: 12) || !ValidatorHelper.equalLength13(productID,ength: 13))
        {
                     errorMessages.value[GenerateViewModelKey.PRODUCTID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductRequired13 ) ?? ""
           }
           else {
               errorMessages.value.removeValue(forKey: GenerateViewModelKey.PRODUCTID)
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
        if beginTimeEvent == nil {
            errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorBeginTimeRequired) ?? ""
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
        if beginTimeEvent?.date == nil {
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
            errorMessages.value[GenerateViewModelKey.PASSWORD] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorPassWordWifiRequired) ?? ""
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
    
    func doGenerateQRValue(){
        var value = ""
        //typeCode = typeCode.uppercased()
        if typeCode == EnumType.URL.rawValue{
            validateUrl()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            
            value = "\(url!)"
            
        }
        else if typeCode == EnumType.TEXT.rawValue{
            validateText()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "\(text!)"
            }
        }
        else if typeCode == EnumType.LOCATION.rawValue{
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
        else if typeCode == EnumType.EMAIL.rawValue{
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
        else if typeCode == EnumType.EVENT.rawValue{
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
        else if typeCode == EnumType.MESSAGE.rawValue{
            validateTo()
            validateMessage()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "SMSTO:\(to!):\(message!)"
            }
        }
        else if typeCode == EnumType.WIFI.rawValue{
            validateSSID()
            validatePassword()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "WIFI:T:\(protect!);S:\(ssid!);P:\(password!);;"
            }
            
        }
        else if typeCode == EnumType.TELEPHONE.rawValue{
            validatePhoneTelephoneNumber()
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "tel:\(phoneTelephone!)"
            }
        }
        else if typeCode == EnumType.CONTACT.rawValue{
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
        dataImage = result?.pngData()
        if (result != nil) {
            let val = result?.pngData()?.base64EncodedString()
            print(val!)
            stringResult = value
            responseToView!(EnumResponseToView.CREATE_SUCCESS.rawValue)
        }
        
    }
    func doGenerateBarCode(){
        var value = ""
        if typeCode == EnumType.BARCODE.rawValue{
            if typeBarcode == EnumType.EAN_8.rawValue{
                           validateProductID8()
                       }
                       else{
                             validateProductID13()
                       }
            if ( errorMessages.value.count > 0 ) {
                return
            }
            else{
                value = "\(productID!)"
                result = (generateDataBarcode(from: value, format: typeBarcode!))
                if (result != nil) {
                    stringResult = value
                    responseToView!(EnumResponseToView.CREATE_SUCCESS.rawValue)
                }
                else{
//                    errorMessages.value[GenerateViewModelKey.PRODUCTID] =  LanguageHelper.getTranslationByKey(LanguageKey.ErrorProductRequired ) ?? ""
                }
            }
        }
    }
    func getColor (value: String) -> UIColor{
        var color = UIColor()
        if value == ColorString.Black.rawValue{
            color = AppColors.BLACK_COLOR
        }
        else if value == ColorString.Blue.rawValue {
            color = AppColors.BLUE_IN_COLOR
        }
        else if value == ColorString.DarkGreen.rawValue {
            color = AppColors.DARK_GREEN_COLOR
        }
        else if value == ColorString.Pink.rawValue {
            color = AppColors.PINK_COLOR
        }
        else if value == ColorString.LightPurple.rawValue {
            color = AppColors.LIGHT_PURPLE_COLOR
        }
        else if value == ColorString.Purple.rawValue {
            color = AppColors.PURPLE_COLOR
        }
        else if value == ColorString.Indigo.rawValue {
            color = AppColors.INDIGO_COLOR
        }
        else if value == ColorString.BlackGreen.rawValue {
            color = AppColors.BLACK_GREEN_COLOR
        }
        else if value == ColorString.Cyan.rawValue {
            color = AppColors.CYAN_COLOR
        }
        else if value == ColorString.MossGreen.rawValue {
            color = AppColors.MOSS_GREEN_COLOR
        }
        else if value == ColorString.Orange.rawValue {
            color = AppColors.ORANGE_IN_COLOR
        }
        else if value == ColorString.Brown.rawValue {
            color = AppColors.BROWN_COLOR
        }
        return color
        
    }
    func generateDataBarcode(from string: String, format: String) -> UIImage? {
         let valueColor = String(CommonService.getUserDefault(key: KeyUserDefault.ChangeColor) ?? ColorString.Black.rawValue)
        var valueFormat : ZXBarcodeFormat = kBarcodeFormatEan8
        if format == BarcodeType.EAN_8.rawValue{
            valueFormat = kBarcodeFormatEan8
        }
        if format == BarcodeType.EAN_13.rawValue{
            valueFormat = kBarcodeFormatEan13
        }
          do {
              let writer = ZXMultiFormatWriter()
              let hints = ZXEncodeHints() as ZXEncodeHints
              hints.encoding = String.Encoding.utf8.rawValue
            let result = try writer.encode(string, format: valueFormat, width: Int32(AppConstants.HEIGHT_IMAGE_QR), height: Int32(AppConstants.HEIGHT_IMAGE_QR), hints: hints)
            
              if let imageRef = ZXImage.init(matrix: result, on: getColor(value: valueColor).cgColor, offColor: nil) {
                  if let image = imageRef.cgimage {
                      return UIImage.init(cgImage: image)
                  }
              }
          }
          catch {
              print(error)
            return nil
          }
          return nil
      }

func generateDataQRCode(from string: String) -> UIImage? {
    let valueColor = String(CommonService.getUserDefault(key: KeyUserDefault.ChangeColor) ?? ColorString.Black.rawValue)
    do {
        let writer = ZXMultiFormatWriter()
        let hints = ZXEncodeHints() as ZXEncodeHints
        hints.encoding = String.Encoding.utf8.rawValue
        let result = try writer.encode(string, format: kBarcodeFormatQRCode, width: Int32(AppConstants.HEIGHT_IMAGE_QR), height: Int32(AppConstants.HEIGHT_IMAGE_QR), hints: hints)
        if let imageRef = ZXImage.init(matrix: result, on: getColor(value: valueColor).cgColor, offColor: nil) {
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
