//
//  GenerateOption.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

enum TypeCodeOption: Int, CustomStringConvertible {
  case Email
  case Message
  case Location
  case Event
  case Contact
  case Telephone
  case Text
  case Wifi
    case Url
  var name: String {
    switch self {
    case .Email: return LanguageHelper.getTranslationByKey(LanguageKey.Email) ?? "Email"
    case .Message: return LanguageHelper.getTranslationByKey(LanguageKey.Message) ?? "Message"
      case .Location: return LanguageHelper.getTranslationByKey(LanguageKey.Location) ?? "Location"
    case .Event: return LanguageHelper.getTranslationByKey(LanguageKey.Event) ?? "Event"
    case .Contact: return LanguageHelper.getTranslationByKey(LanguageKey.Contact) ?? "Contact"
    case .Telephone: return LanguageHelper.getTranslationByKey(LanguageKey.Telephone) ?? "Telephone"
      case .Text: return LanguageHelper.getTranslationByKey(LanguageKey.Text) ?? "Text"
      case .Wifi: return LanguageHelper.getTranslationByKey(LanguageKey.Wifi) ?? "Wifi"
        case .Url: return LanguageHelper.getTranslationByKey(LanguageKey.Url) ?? "Url"

    }
  }
    var description: String {
      switch self {
      case .Email: return LanguageHelper.getTranslationByKey(LanguageKey.Email) ?? "Email"
      case .Message: return LanguageHelper.getTranslationByKey(LanguageKey.Message) ?? "Message"
        case .Location: return LanguageHelper.getTranslationByKey(LanguageKey.Location) ?? "Location"
      case .Event: return LanguageHelper.getTranslationByKey(LanguageKey.Event) ?? "Event"
      case .Contact: return LanguageHelper.getTranslationByKey(LanguageKey.Contact) ?? "Contact"
      case .Telephone: return LanguageHelper.getTranslationByKey(LanguageKey.Telephone) ?? "Telephone"
        case .Text: return LanguageHelper.getTranslationByKey(LanguageKey.Text) ?? "Text"
        case .Wifi: return LanguageHelper.getTranslationByKey(LanguageKey.Wifi) ?? "Wifi"
          case .Url: return LanguageHelper.getTranslationByKey(LanguageKey.Url) ?? "Url"

      }
    }
  
  
  
  var iconName: String {
    switch self {
      case .Email: return "ic_read"
      case .Message: return "ic_scan"
      case .Location: return "icon_create"
      case .Event: return "ic_read"
      case .Contact: return "ic_read"
      case .Telephone: return "ic_read"
      case .Text: return "ic_read"
      case .Wifi: return "ic_read"
        case .Url: return "ic_read"
    }
  }
  var viewType: Int {
    switch self {
    case .Email: return AppViewOptions.NAV_VIEW
    case .Message: return AppViewOptions.NAV_VIEW
    case .Location: return AppViewOptions.NAV_VIEW
    case .Event: return AppViewOptions.NAV_VIEW
    case .Contact: return AppViewOptions.NAV_VIEW
    case .Telephone: return AppViewOptions.NAV_VIEW
    case .Text: return AppViewOptions.NAV_VIEW
    case .Wifi: return AppViewOptions.NAV_VIEW
    case .Url: return AppViewOptions.NAV_VIEW
    }
  }
    
}
