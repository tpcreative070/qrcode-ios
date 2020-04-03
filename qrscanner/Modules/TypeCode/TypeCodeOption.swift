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
        case .Email: return EnumType.EMAIL.rawValue
        case .Message: return EnumType.MESSAGE.rawValue
        case .Location: return EnumType.LOCATION.rawValue
        case .Event: return EnumType.EVENT.rawValue
        case .Contact: return EnumType.CONTACT.rawValue
        case .Telephone: return EnumType.TELEPHONE.rawValue
        case .Text: return EnumType.TEXT.rawValue
        case .Wifi: return EnumType.WIFI.rawValue
        case .Url: return EnumType.URL.rawValue
            
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
        case .Email: return AppImages.IC_EMAIL
        case .Message: return AppImages.IC_SMS
        case .Location: return AppImages.IC_LOCATION
        case .Event: return AppImages.IC_EVENT
        case .Contact: return AppImages.IC_CONTACT_CALENDAR
        case .Telephone: return AppImages.IC_PHONE
        case .Text: return AppImages.IC_TEXT
        case .Wifi: return AppImages.IC_WIFI
        case .Url: return AppImages.IC_LANGUAGE
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
