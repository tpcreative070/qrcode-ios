//
//  Helper.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import SystemConfiguration

enum LINE_POSITION {
  case LINE_POSITION_TOP
  case LINE_POSITION_BOTTOM
}

struct Helper {
  static func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
    let lineView = UIView()
    lineView.backgroundColor = color
    lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
    view.addSubview(lineView)
    
    let metrics = ["width" : NSNumber(value: width)]
    let views = ["lineView" : lineView]
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
    
    switch position {
    case .LINE_POSITION_TOP:
      view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
      break
    case .LINE_POSITION_BOTTOM:
      view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
      break
    }
  }
  
  /**
   emailValidation
   */
  static func emailValidation(email: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
    return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
  }
  
  /**
   UTCToLocal
  */
  static func UTCToLocal(date:String) -> String {
    var newDate = date
    newDate = date.replacingOccurrences(of: "Z[UTC]", with: "")
    newDate = newDate.replacingOccurrences(of: "T", with: " ")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
    let dt = dateFormatter.date(from: date)
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    
    return dateFormatter.string(from: dt!)
  }
  
  /**
   getAccessToken
   */
  static func getAccessToken() -> (String) {
    let defaults = UserDefaults.standard
    let token = defaults.string(forKey: "accessToken") ?? ""
    return token
  }
  
  /**
   isIpad
   */
  static func isIpad() -> (Bool) {
    return UIDevice.current.userInterfaceIdiom == .pad
  }
  
  /**
   isIphone
   */
  static func isIphone() -> (Bool) {
    return UIDevice.current.userInterfaceIdiom == .phone
  }
  
  /**
   presentModal
   */
  static func presentModal(container:UIViewController, vc: UIViewController) {
    if self.isIpad() {
      container.navigationController?.pushViewController(vc, animated: true)
    } else {
      let navVC = UINavigationController(rootViewController: vc)
      container.view.window?.rootViewController!.present(navVC,  animated: true, completion: nil)
    }
  }
  static func presentOverlayModal(container:UIViewController, vc: UIViewController) {
    let navVC = UINavigationController(rootViewController: vc)
    container.view.window?.rootViewController!.present(navVC,  animated: true, completion: nil)
  }
  
  /**
   pushModal
   */
  static func pushModal(_ container: UIViewController, vc: UIViewController ) {
    container.navigationController?.pushViewController(vc, animated: true)
  }
  
  /**
   back
   */
  static func back(_ container: UIViewController) {
    if self.isIpad() {
      container.navigationController?.popViewController(animated: true)
    } else {
      container.navigationController?.popViewController(animated: true)
    }
  }
    
  static func addCloseWhiteButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICCloseWhiteButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        var marginTop = CGFloat(0)
        if !DeviceHelper.isNormalScreen() && !DeviceHelper.isSmallScreen() {
            marginTop = CGFloat(AppConstants.MARGIN_TOP)
        }
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.trailingAnchor.constraint(equalTo: viewToAdd!.trailingAnchor, constant: AppConstants.MARGIN_RIGHT)
            ])
        return backButton
    }
    
    static func addCloseBlackButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICCloseBlackButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(0)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.trailingAnchor.constraint(equalTo: viewToAdd!.trailingAnchor, constant: AppConstants.MARGIN_RIGHT)
            ])
        return backButton
    }
    
    static func addCloseLeftBlackButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICCloseBlackButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(0)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
            ])
        return backButton
    }
    
    static func addCloseLeftWhiteButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICCloseWhiteButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(0)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
            ])
        return backButton
    }
    
    static func addLeftBackButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICBackBlueButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(10)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
            ])
        return backButton
    }
    
    static func addLeftBackGrayButton(_ viewToAdd: UIView?) -> UIButton? {
        let backButton = ICBackGrayButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(10)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
            backButton.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
            ])
        return backButton
    }
    
    static func addButtonCustom(_ viewToAdd: UIView?, isLeft : Bool, image : UIImage) -> UIButton? {
        let backButton = ICButtonCustom(type: .system)
        backButton.setupView(image:image)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        viewToAdd?.addSubview(backButton)
        let marginTop = CGFloat(10)
        if isLeft{
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
                backButton.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
                ])
        }else{
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
                backButton.trailingAnchor.constraint(equalTo: viewToAdd!.trailingAnchor, constant: AppConstants.MARGIN_RIGHT)
                ])
        }
        return backButton
    }
    
    static func addButtonCustom(_ viewToAdd: UIView?, isLeft : Bool, text : String) -> ICButton? {
        let button = ICButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        viewToAdd?.addSubview(button)
        let marginTop = CGFloat(10)
        if isLeft{
            NSLayoutConstraint.activate([
                   button.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
                   button.leadingAnchor.constraint(equalTo: viewToAdd!.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
                   ])
        }else{
            NSLayoutConstraint.activate([
                   button.topAnchor.constraint(equalTo: viewToAdd!.safeAreaLayoutGuide.topAnchor, constant: marginTop),
                   button.trailingAnchor.constraint(equalTo: viewToAdd!.trailingAnchor, constant: AppConstants.MARGIN_RIGHT)
                   ])
        }
        return button
    }
    
  /**
   addGradientLayerButton
   */
  static func addGradientLayerButton(button: UIButton, colors: [Any]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = button.bounds
    gradientLayer.colors = colors
    gradientLayer.cornerRadius = 3
    button.layer.insertSublayer(gradientLayer, at: 0)
  }
  static func removeGradientLayoutButton(button: UIButton) {
    button.layer.sublayers!.remove(at: 0)
  }

  /**
   Check connect Internet
   */
  static func isConnectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
      $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
        SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
      }
    }
    
    var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
    if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
      return false
    }
    
    /* Only Working for WIFI
     let isReachable = flags == .reachable
     let needsConnection = flags == .connectionRequired
     
     return isReachable && !needsConnection
     */
    
    // Working for Cellular and WIFI
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    let ret = (isReachable && !needsConnection)
    
    return ret
  }
  
  static func getData(from externalUrl: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: externalUrl, completionHandler: completion).resume()
  }
    static func getValueContent(typeCode : String, contentData: String) -> String{
        var valueShowContent = ""
        if typeCode == EnumType.URL.rawValue{
              
                  let content = ContentModel(data :(contentData.toObject(value: UrlModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent!)
                  valueShowContent = urlModel.url ?? ""
                  
              }
                  //
              else if typeCode == EnumType.TEXT.rawValue{
                  let content = ContentModel(data: (contentData.toObject(value: TextModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent!)
                  valueShowContent = textModel.text ?? ""
              }
              else if typeCode == EnumType.LOCATION.rawValue{
                  let content = ContentModel(data: (contentData.toObject(value: LocationModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent!)
                  valueShowContent = "\(locationModel.latitude ?? 0),\(locationModel.longtitude ?? 0),(\(locationModel.query ?? ""))"
              }
              else if typeCode == EnumType.EMAIL.rawValue{
                  let content = ContentModel(data: (contentData.toObject(value: EmailModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let emailModel : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent!)
                  valueShowContent = emailModel.email ?? ""
              }
              else if typeCode == EnumType.EVENT.rawValue{
                  
                  let content = ContentModel(data: (contentData.toObject(value: EventModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let eventModel : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent!)
                  valueShowContent = eventModel.title ?? ""
                  
              }
              else if typeCode == EnumType.MESSAGE.rawValue{
                  
                  let content = ContentModel(data: (contentData.toObject(value: MessageModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let messageModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent!)
                  valueShowContent = messageModel.message ?? ""
              }
              else if typeCode == EnumType.WIFI.rawValue{
                  
                  let content = ContentModel(data: (contentData.toObject(value: WifiModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let wifiModel : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent!)
                  valueShowContent = wifiModel.ssid ?? ""
              }
              else if typeCode == EnumType.TELEPHONE.rawValue{
                  
                  let content = ContentModel(data: (contentData.toObject(value: PhoneModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let phoneModel : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent!)
                  valueShowContent = phoneModel.phone ?? ""
              }
              else if typeCode == EnumType.CONTACT.rawValue{
                  
                  let content = ContentModel(data: (contentData.toObject(value: ContactModel.self))!)
                  let stringContent = content.content?.data(using: .utf8 )
                  let contactModel : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent!)
                  valueShowContent = contactModel.fullNameContact ?? ""
              }
        return valueShowContent
    }
    static func getValueShareContent(typeCode : String, contentData: String) -> String{
           var valueShowContent = ""
           if typeCode == EnumType.URL.rawValue{
                 
                     let content = ContentModel(data :(contentData.toObject(value: UrlModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Url)!)): \(urlModel.url ?? "")"
                     
                 }
                     //
                 else if typeCode == EnumType.TEXT.rawValue{
                     let content = ContentModel(data: (contentData.toObject(value: TextModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let textModel : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Text)!)): \(textModel.text ?? "")"
                 }
                 else if typeCode == EnumType.LOCATION.rawValue{
                     let content = ContentModel(data: (contentData.toObject(value: LocationModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let locationModel : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent!)
                     valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Latitude)!)): \(locationModel.latitude ?? 0)\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Longtitude)!)): \(locationModel.longtitude ?? 0)\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Query)!)): \(locationModel.query ?? "")"
                 }
                 else if typeCode == EnumType.EMAIL.rawValue{
                     let content = ContentModel(data: (contentData.toObject(value: EmailModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let emailModel : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Email)!)): \(emailModel.email ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Subject)!)): \(emailModel.objectEmail ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Message)!)):\(emailModel.messageEmail ?? "")"
                 }
                 else if typeCode == EnumType.EVENT.rawValue{
                     
                     let content = ContentModel(data: (contentData.toObject(value: EventModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let eventModel : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Title)!)): \(eventModel.title ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Description)!)): \(eventModel.description ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Location)!)): \(eventModel.location ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.TimeBegin)!)): \(eventModel.beginTime ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.TimeEnd)!)): \(eventModel.endTime ?? "")"
                     
                 }
                 else if typeCode == EnumType.MESSAGE.rawValue{
                     
                     let content = ContentModel(data: (contentData.toObject(value: MessageModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let messageModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Phone)!)): \(messageModel.to ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Message)!)): \(messageModel.message ?? "")"
                 }
                 else if typeCode == EnumType.WIFI.rawValue{
                     
                     let content = ContentModel(data: (contentData.toObject(value: WifiModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let wifiModel : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.SSID)!)): \(wifiModel.ssid ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Password)!)): \(wifiModel.password ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.NetworkEncryption)!)): \(wifiModel.protect ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Hidden)!)): \(wifiModel.hidden)"
                 }
                 else if typeCode == EnumType.TELEPHONE.rawValue{
                     
                     let content = ContentModel(data: (contentData.toObject(value: PhoneModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let phoneModel : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent!)
                     valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Phone)!)): \(phoneModel.phone ?? "")"
                 }
                 else if typeCode == EnumType.CONTACT.rawValue{
                     
                     let content = ContentModel(data: (contentData.toObject(value: ContactModel.self))!)
                     let stringContent = content.content?.data(using: .utf8 )
                     let contactModel : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent!)
            valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Address)!)): \(contactModel.addressContact ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.FullName)!)): \(contactModel.fullNameContact ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Email)!)): \(contactModel.emailContact ?? "")\n\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.Phone)!)): \(contactModel.phoneContact ?? "")"
                 }
        else if typeCode == EnumType.BARCODE.rawValue{
                          
                          let content = ContentModel(data: (contentData.toObject(value: BarcodeModel.self))!)
                          let stringContent = content.content?.data(using: .utf8 )
                          let contactModel : BarcodeModel = try! JSONDecoder().decode(BarcodeModel.self, from: stringContent!)
                 valueShowContent = "\(String(describing: LanguageHelper.getTranslationByKey(LanguageKey.ProductID)!)): \(contactModel.productID ?? "")\n \(contactModel.barcodetype ?? "")"
                      }
           return valueShowContent
       }
    static func getVersion() -> String? {
        return "CFBundleShortVersionString".infoForKey()
    }
   
}


