//
//  Constant.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Security
import UIKit

/// Constants used by the library
public struct KeychainSwiftConstants {
    /// Specifies a Keychain access group. Used for sharing Keychain items between apps.
    public static var accessGroup: String { return toString(kSecAttrAccessGroup) }
    
    /**
     A value that indicates when your app needs access to the data in a keychain item. The default value is AccessibleWhenUnlocked. For a list of possible values, see KeychainSwiftAccessOptions.
     
     */
    public static var accessible: String { return toString(kSecAttrAccessible) }
    
    /// Used for specifying a String key when setting/getting a Keychain value.
    public static var attrAccount: String { return toString(kSecAttrAccount) }
    
    /// Used for specifying synchronization of keychain items between devices.
    public static var attrSynchronizable: String { return toString(kSecAttrSynchronizable) }
    
    /// An item class key used to construct a Keychain search dictionary.
    public static var klass: String { return toString(kSecClass) }
    
    /// Specifies the number of values returned from the keychain. The library only supports single values.
    public static var matchLimit: String { return toString(kSecMatchLimit) }
    
    /// A return data type used to get the data from the Keychain.
    public static var returnData: String { return toString(kSecReturnData) }
    
    /// Used for specifying a value when setting a Keychain value.
    public static var valueData: String { return toString(kSecValueData) }
    
    /// Used for returning a reference to the data from the keychain
    public static var returnReference: String { return toString(kSecReturnPersistentRef) }
    
    static func toString(_ value: CFString) -> String {
        return value as String
    }
}



struct AppConstants {
    static let sharedIndentifier = "group.co.tpcreative.qrscanner.share"
    static let shareKey = "Images"
    static var ischoose = 0
    static var isVibrate = 0
    static var isBeep = 0
    static var isCam = 0

    static let soundID = 1057
    static let ISSEEN = 1
    static let NUMBER_OF_LINE = 2

    static let ISUPDATE = 2
    static let ISCHOOSE = 1
    static let WIDTH_BORDER = CGFloat(1)
      static let WIDTH_BORDER_SCAN = CGFloat(2)
    static let CORNER_RADIUS = CGFloat(10)
    static let SPACING = CGFloat(10)

    static let LARGE_SIZE = 200
    static let MEDIUM_SIZE = 50
    static let SMALL_SIZE = 20
    static let MAX_LENGHT_QRCODE = 1000
    static let MAX_LENGHT = 250
    static let MIN_LENGHT = 1
    static let EQUAL_LENGHT_8 = 8
    static let EQUAL_LENGHT_13 = 8
    
    static let WIDTH_HEIGHT_RADIO = CGFloat(17)
    static let HEIGHT_DATEPICKER = CGFloat(35)

    static let MAX_CASH_AMOUNT = 1000
    static let FLOAT_LABEL_MARGIN_LEFT = CGFloat(30)
    static let FLOAT_LABEL_HEIGHT = CGFloat(25)
    static let INPUT_FIELD_HEIGHT = CGFloat(30)
    static let HEIGHT_BUTTON_DEFAULT = CGFloat(50)
    static let HEIGHT_BACKGROUND_ITEM = CGFloat(90)
    static let HEIGHT_BACKGROUND = CGFloat(130)
    static let HEIGHT_IMAGE_HELP = CGFloat(200)
    static let HEIGHT_IMAGE_SETTING = CGFloat(50)
    static let HEIGHT_IMAGE_QR = CGFloat(300)
    static let HEIGHT_IMAGE_COLOR = CGFloat(64)
    static let HEIGHT_BACKGROUND_BAR = CGFloat(175)
    static let HEIGHT_BACKGROUND_ITEM_BAR = CGFloat(140)
static let IC_DEFAULT_DROP = CGFloat(18)
    static let WIDTH_BUTTON_DEFAULT = CGFloat(120)
    static let IC_DEFAULT = CGFloat(25)
    static let ICON_WIDTH_HEIGHT = CGFloat(30)
    static let ICON_SCAN_WIDTH_HEIGHT = CGFloat(30)
    static let IC_CLOSE_WIDTH = CFloat(30)
    static let IC_CLOSE_HEIGHT = CFloat(30)
    static let MARGIN_LEFT_SETTING = CGFloat(5)
    static let MARGIN_LEFT = CGFloat(20)
    static let MARGIN_LEFT_HELP = CGFloat(10)
    static let MARGIN_LEFT_SCAN = CGFloat(15)

    static let DEFAULT_CONSTRAINT = CGFloat(0)
    static let MARGIN_LEFT_COLOR = CGFloat(10)

    static let MARGIN_LEFT_ICON = CGFloat(30)
    static let MARGIN_LEFT_ALERT_BTN = CGFloat(100)
    static let MARGIN_RIGHT_SETTING = CGFloat(-5)

    static let MARGIN_RIGHT = CGFloat(-20)
    static let MARGIN_RIGHT_ALERT_BTN = CGFloat(-100)
    static let MARGIN_RIGHT_HELP = CGFloat(-10)
    static let MARGIN_RIGHT_COLOR = CGFloat(-10)

    static let MARGIN_RIGHT_ITEMPLUS = CGFloat(-40)
    
    static let MARGIN_TOP = CGFloat(20)
    static let MARGIN_LEFT_ITEM_HIS = CGFloat(-80)
    static let MARGIN_RIGHT_ITEM_HIS = CGFloat(70)
    static let MARGIN_TOP_ALERT = CGFloat(130)
    static let MARGIN_BOTTOM_ALERT = CGFloat(-130)
    static let SWITCH_HEIGHT_DEFAULT = CGFloat(17)
    static let SWITCH_WIDTH_DEFAULT = CGFloat(45)
    static let MARGIN_TOP_ITEM = CGFloat(12)
    static let MARGIN_TOP_ITEM_SETTING = CGFloat(8)

    static let MARGIN_TOP_SUBITEM = CGFloat(5)
    static let MARGIN_TOP_CONTAINER = CGFloat(20)
    static let MARGIN_LEFT_CONTAINER = CGFloat(60)
    
    static let MARGIN_BOTTOM_ITEM = CGFloat(-12)
    
    static let MARGIN_BOTTOM = CGFloat(-20)
    static let MARGIN_BOTTOM_TAB = CGFloat(-30)
    
    static let ALPHA_DEFAULT = CGFloat(1)
    static let ALPHA_DISBALE = CGFloat(0.5)
    static let TABLE_ROW_HEIGHT = CGFloat(40)
    //Scanner
    static let CAPTURE_ROTATION = Double(0)
    static let SCAN_REACT_ROTATION_90 = Double(90)
    static let SCAN_REACT_ROTATION_180 = Double(180)
    static let SCAN_REACT_ROTATION_270 = Double(270)
      static let WITH_ALPHA_COMPONENT = CGFloat(0.5)
    static let VIDEO_HEIGHT_1080 = CGFloat(1080.0)
    static let VIDEO_HEIGHT_1920 = CGFloat(1920.0)
    static let VIDEO_HEIGHT_720 = CGFloat(720.0)
    static let VIDEO_HEIGHT_1280 = CGFloat(1280.0)

    
    
    
    // switch button default config
    static let SWITCH_ON_TINT_COLOR = UIColor(red: 247/255, green: 204/255, blue: 119/255, alpha: 1)
    static let SWITCH_OFF_TINT_COLOR = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
    static let SWITCH_CORNER_RADIUS = CGFloat(0.5)
    static let SWITCH_THUMB_CORNER_RADIUS = CGFloat(0.5)
    static let SWITCH_THUMB_SIZE_WIDTH = 25
    static let SWITCH_THUMB_SIZE_HEIGHT = 25
    static let SWITCH_THUMB_ON_TINT_COLOR = UIColor(red: 225/255, green: 151/255, blue: 4/255, alpha: 1)
    static let SWITCH_THUMB_OFF_TINT_COLOR = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let SWITCH_ANIMATION_DURATION = 0.25
    static let HEIGHT_CONSTRAINT_LABLE = CGFloat(20)
    static let HEIGHT_CONSTRAINT_VIEW = CGFloat(50)
    static let HEIGHT_CONSTRAINT_LABLE_PASSENGERS = CGFloat(20)
    static let SOUND_EMPTY = "empty.wav"
    //Menu
    static let MENU_FOOTER_SIZE = CGFloat(100)
    static let MENU_ITEM_IMAGE_DOUBLE_SIZE = CGFloat(40)
    static let MENU_ITEM_IMAGE_SIZE = CGFloat(30)
    static let MENU_ITEM_IMAGE_LEADING = CGFloat(12)
    static let MENU_ITEM_TITLE_TOP = CGFloat(10)
    static let MENU_ITEM_TITLE_TRAILING = CGFloat(-50)
    static let MENU_ITEM_TITLE_LEADING = CGFloat(12)
    static let MENU_ITEM_CONTAINER_BOTTOM = CGFloat(-17)
    static let MENU_ITEM_DESCRIPTION_BOTTOM = CGFloat(-8)
    static let MENU_ITEM_BADGE_SIZE = CGFloat(25)
    static let MENU_ITEM_BADGE_LEADING = CGFloat(12)
    static let MENU_ITEM_UNDER_LINE_BOTTOM = CGFloat(-24)
    static let MENU_ITEM_UNDER_LINE_LEADING = CGFloat(50)
    static let MENU_ITEM_UNDER_LINE_TRAILING = CGFloat(-10)
    static let IC_SKIP_WIDTH = CFloat(80)
    static let IC_SKIP_HEIGHT = CFloat(50)
    static let IC_QR_HEIGHT = CFloat(50)
    
    static let MENU_BUTTON_MARGIN_LEFT = CGFloat(10)
    static let MENU_BUTTON_MARGIN_RIGHT = CGFloat(-10)
    static let MARGIN_BOTTOM_TO_BUTTON = CGFloat(-90)
    static let MENU_HEADER_TOP_SIZE = CGFloat(40)
    static let MENU_HEADER_NORMAL_TOP_SIZE = CGFloat(20)
    static let MENU_HEADER_BOTTOM_SIZE = CGFloat(-40)
    static let MENU_HEADER_BOTTOM_NORMAL_SIZE = CGFloat(-20)
    static let MENU_FOOTER_NORMAL_SIZE = CGFloat(85)
    static let MENU_HEIGHT_CELL_SIZE = CGFloat(80)
    static let MENU_HEIGHT_CELL_NORMAL_SIZE = CGFloat(60)
    static let MENU_HEIGHT_CELL_PLUS_SIZE = CGFloat(60)
    static let MENU_HEIGHT_CELL_MAX_SIZE = CGFloat(60)
    static let MENU_HEIGHT_CELL_SMALL_SIZE = CGFloat(50)
    static let MENU_ITEM_TITLE_NORMAL_TOP = CGFloat(9)
    static let MENU_ITEM_TITLE_PLUS_TOP = CGFloat(12)
    static let MENU_ITEM_TITLE_MAX_TOP = CGFloat(17)
    static let MENU_ITEM_TITLE_SMALL_TOP = CGFloat(9)
    static let MENU_ITEM_DESCRIPTION_NORMAL_BOTTOM = CGFloat(-6)
    static let MENU_ITEM_DESCRIPTION_PLUS_BOTTOM = CGFloat(-8)
    static let MENU_ITEM_DESCRIPTION_MAX_BOTTOM = CGFloat(-13)
    static let MENU_ITEM_DESCRIPTION_SMALL_BOTTOM = CGFloat(-8)
    static let MENU_ITEM_CONTAINER_NORMAL_BOTTOM = CGFloat(-10)
    static let MENU_ITEM_IMAGE_DOUBLE_NORMAL_SIZE = CGFloat(40)
    static let MENU_ITEM_IMAGE_DOUBLE_PLUS_SIZE = CGFloat(40)
    static let MENU_ITEM_IMAGE_DOUBLE_MAX_SIZE = CGFloat(40)
    static let MENU_ITEM_IMAGE_DOUBLE_SMALL_SIZE = CGFloat(30)
    static let MENU_ITEM_IMAGE_NORMAL_SIZE = CGFloat(25)
    static let MENU_FOOTER_PLUS_SIZE = CGFloat(90)
    static let MENU_FOOTER_MAX_SIZE = CGFloat(130)
    static let LOGO_NORMAL_WIDTH = CGFloat(100)
    static let LOGO_NORMAL_HEIGHT = CGFloat(25)
    static let MARGIN_TOP_LOGIN_CENTER = CGFloat(20)
    static let MARGIN_TOP_BETWEEN_TEXT_FIELD = CGFloat(15)
    static let IG_INPUT_FIELD_WITH_ERROR_HEIGHT_DEFAULT = CGFloat(100)
    static let DEFAULT_RIGHT_BUTTON_HEIGHT = CGFloat(32)
    static let DEFAULT_RIGHT_BUTTON_WIDTH = CGFloat(32)
    static let MARGIN_TOP_TRIGGER = CGFloat(-80)
    static let TOOLBAR_HEIGHT = CGFloat(44.0)
    
}

struct AppFonts {
    // official font
    static let SFranciscoSemiBold = "SFProText-Semibold"
    static let SFranciscoBold = "SFProText-Bold"
    static let SFranciscoRegular = "SFProText-Regular"
    static let SFranciscoLight = "SFProText-Light"
    
    // 4 levels
    static let TITLE_FONT_SIZE = CGFloat(32)
    static let SUB_TITLE_FONT_SIZE = CGFloat(18)
    static let TEXTFIELD_TITLE_FONT_SIZE = CGFloat(16)
    static let BUTTON_TITLE_SIZE = CGFloat(20)
    static let FOOTER_LABEL_FONT_SIZE = CGFloat(14)
    
    static let LABEL_FONT_SIZE = CGFloat(16)
    static let LABEL_TITLE_FONT_SIZE = CGFloat(18)
    static let LABEL_TITLE_FONT_SIZE_HELP = CGFloat(20)
    
    static let LABEL_DETAIL_ITEM_FONT_SIZE = CGFloat(14)
    static let BUTTON_HEIGHT = CGFloat(45)
    static let TEXTFIELD_HEIGHT = CGFloat(50)
    
    static let ERROR_LABEL_FONT_SIZE = CGFloat(15)
    static let FLOAT_LABEL_FONT_SIZE = CGFloat(16)
    static let FLOAT_PLACEHOLDER_FONT_SIZE = CGFloat(14)
    static let NOTICE_LABEL_FONT_SIZE = CGFloat(18)
    static let NOTICE_LABEL_SUB_FONT_SIZE = CGFloat(16)
    static let INPUT_TEXT_FONT_SIZE_DEFAULT = CGFloat(15)
    static let VERSION_FONT_SIZE = CGFloat(18)
    static let GROUP_ITEM_TITLE = CGFloat(20)
    static let ITEM_LABEL_FONT_SIZE = CGFloat(16)
    static let ITEM_LABEL_SUB_FONT_SIZE = CGFloat(16)
    static let ITEM_LABEL_SMALL_FONT_SIZE = CGFloat(14)
    static let BUTTON_FONT_SIZE = CGFloat(16)
    static let VERSION_FONT_NORMAL_SIZE = CGFloat(16)
    
    
    static func moderateScale(fontName: String = AppFonts.SFranciscoRegular, size: CGFloat = AppFonts.LABEL_FONT_SIZE, factor: CGFloat = 1)->UIFont{
        let guidelineBaseWidth = CGFloat(375) // Scaling font for iPhone 5s, 5
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        _ = screenSize.height
        let temp = (screenWidth / guidelineBaseWidth * size)
        var font: UIFont?
        if Helper.isIpad() {
            font =  UIFont(name: fontName, size: (size * 1.2))!
        } else {
            
            if screenWidth >= guidelineBaseWidth {
                font =  UIFont(name: fontName, size: (size + (temp - size) * factor))!
            }else{
                font =  UIFont(name: fontName, size: (size + (temp - size) * 1))!
            }
        }
        return font!
    }
}

struct AppImages {
    static let IC_GENERATE = "ic_generate"
    static let IC_HISTORY = "ic_history"
    static let IC_SCAN = "ic_scan"
    static let IC_SCAN_QR = "ic_scanqr"

    static let IC_SAVE = "ic_save"
    static let IC_SETTING = "ic_settings_white"
    
    static let IC_CONTACT_CALENDAR = "ic_contact_calendar"
    static let IC_COPY = "ic_copy"
    static let IC_CREATE = "ic_create"
    static let IC_DELETE = "ic_delete"
    static let IC_EMAIL = "ic_email"
    static let IC_EVENT = "ic_event"
    static let IC_FLASH_OFF = "ic_flash_off"
    static let IC_FLASH_ON = "ic_flash_on"
    static let IC_PRINT = "ic_print"
    static let IC_BARCODE = "ic_barcode"
    static let IC_FLIP_CAMERA = "ic_flip_camera"
    static let IC_HELP = "ic_help"
    static let IC_IMAGE = "ic_image"
    static let IC_KEYBOARD = "ic_keyboard"
    static let IC_LABEL = "ic_label"
    static let IC_LANGUAGE = "ic_language"
    static let IC_LOCATION = "ic_location"
    static let IC_MENU = "ic_menu"
    static let IC_PHONE = "ic_phone"
    static let IC_SHARE = "ic_share"
    static let IC_SEARCH = "ic_search"
    static let IC_SELECT_ALL = "ic_select_all"
    static let IC_SETTINGS_WHITE = "ic_settings_white"
    static let IC_SUPPORT = "ic_support"
    static let IC_TEXT = "ic_text"
    static let IC_SMS = "ic_textsms"
    static let IC_SCAN_MULTI = "ic_scanqr"
    static let IC_VIBRATION = "ic_vibration"
    static let IC_WIFI = "ic_wifi"
    static let BG1 = "bg1"
    static let BG2 = "bg2"
    static let BG3 = "bg3"
    static let IC_COLOR = "ic_color"
    static let IC_BEEP = "ic_beep"
    static let IC_PRIVACY = "ic_privacy"
    static let IC_START = "ic_start"
    static let IC_PERMISSION = "ic_permission"
    static let IC_FLAG = "ic_flag"

    
    static let IC_HOME = "ic_home"
    static let IC_CONTACT = "ic_contact"
    static let IC_TRANSACTION = "ic_history"
    static let IC_WALLET = "ic_wallet"
    static let IC_SCANNER = "ic_scan"
    static let IC_SCANNER_BLUE = "ic_scanner_blue"
    static let IC_QRCODE = "ic_qrcode"
    static let IC_LOGO = "ic_logo"
    static let IC_USER = "ic_user"
    static let IC_PASSWORD = "ic_password"
    static let IC_DROPDOWN = "ic_dropdown"
    static let IC_CIRCLE_CASH_IN = "ic_circle_cash_in"
    static let IC_CIRCLE_CASH_OUT = "ic_circle_cash_out"
    static let IC_CIRCLE_CASH_CHANGE = "ic_circle_cash_change"
    static let IC_CIRCLE_TRANSFER = "ic_circle_transfer"
    
    static let IC_CIRCLE_CASH_IN_GRAY = "ic_circle_cash_in_gray"
    static let IC_CIRCLE_CASH_OUT_GRAY = "ic_circle_cash_out_gray"
    static let IC_CIRCLE_CASH_CHANGE_GRAY = "ic_circle_cash_change_gray"
    static let IC_CIRCLE_TRANSFER_GRAY = "ic_circle_transfer_gray"
    
    static let IC_BELL = "ic_bell"
    static let IC_LIXI = "ic_lixi"
    static let IC_GIFT = "ic_gift"
    static let IC_LIXI_CLOSE = "ic_lixi_close"
    static let IC_LIXI_OPEN = "ic_lixi_open"
    static let IC_LIXI_BACKGROUND = "ic_lixi_background"
    static let IC_ELECTRONIC = "ic_electronic"
    static let IC_WATER = "ic_water"
    static let IC_SHOP = "ic_shop"
    static let IC_CABLE = "ic_cable"
    static let IC_BG_HEADER = "ic_bg_header"
    static let IC_FULL_HEADER = "ic_full_header"
    static let IC_ERROR = "ic_error"
    static let IC_SUCCESS = "ic_success"
    static let IC_SIGN_OUT = "ic_sign_out"
    static let IC_DESTROY = "ic_block"
    static let IC_CHANGE_PASSWORD = "ic_change_password"
    static let IC_NEXT = "ic_next"
    static let IC_NEXT_IOS = "ic_next_ios"
    static let IC_EDIT_PICTURE = "ic_edit_picture"
    static let IC_EXCLAMATION = "ic_exclamation"
    static let IC_GALLERY = "ic_gallery"
    static let IC_CONTACT_ACTIVE = "ic_contact_active"
    static let IC_BACK = "ic_back"
    static let IC_PLUS = "ic_plus"
    static let IC_CHECK_LIST = "ic_check_list"
    static let IC_CHECK_LIST_ACTIVE = "ic_check_list_active"
    static let IC_CHECKBOX = "ic_checkbox"
    static let IC_CHECKBOX_ACTIVE = "ic_checkbox_active"
    static let IC_CHECK_SUCCESS = "ic_check_success"
    static let IC_CHECK_FAIL = "ic_check_fail"
    static let IC_MORE = "ic_more"
    static let IC_FILTER = "ic_filter"
    static let IC_DOWNLOAD = "ic_download"
    static let IC_SIGN_OUT_RED = "ic_sign_out_red"
    static let IC_CHECK = "ic_check"
    static let IC_INTRO_BACKGROUND = "ic_intro_background"
    static let IC_INTRO_1 = "ic_intro_1"
    static let IC_INTRO_2 = "ic_intro_2"
    static let IC_INTRO_3 = "ic_intro_3"
    static let IC_INTRO_4 = "ic_intro_4"
    static let IC_INTRO_LIXI_1 = "ic_intro_lixi_1"
    static let IC_INTRO_LIXI_2 = "ic_intro_lixi_2"
    static let IC_INTRO_LIXI_3 = "ic_intro_lixi_3"
    static let IC_INTRO_LIXI_4 = "ic_intro_lixi_4"
    static let IC_AVATAR = "ic_avatar"
    static let IC_SEND = "ic_send"
    static let IC_LIX_TRANSACTION = "ic_lixi_transaction"
}

struct AppColors {
    static let gray_default = UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
    static let gray_border = UIColor.init(red: 210/255, green: 207/255, blue: 208/255, alpha: 1)
    static let gray_background = UIColor.init(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    
    static let TEXTFIELD_BORDER = UIColor.init(rgb: 0x797979)
    static let BUTTON_BG_COLOR = UIColor.init(rgb: 0x3A4455)
    
    static let GRAY_COLOR = UIColor.init(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    static let GRAY_COLOR_0_7 = UIColor.init(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 0.7)
    static let FLOAT_LABEL_COLOR = UIColor.init(red: 132/255.0, green: 136/255.0, blue: 143/255.0, alpha: 1.0)
    static let PLACEHOLDER_LABEL_COLOR = UIColor.init(red: 47/255.0, green: 47/255.0, blue: 47/255.0, alpha: 1.0)
    static let TITLE_COLOR_GLOBAL = UIColor.init(red: 77/255.0, green: 77/255.0, blue: 77/255.0, alpha: 1.0)
    // Official color
    static let BLUE_COLOR = UIColor.init(red: 58/255.0, green: 68/255.0, blue: 85/255.0, alpha: 1.0) // For links buttons, actions, labels and functions
    static let RED_COLOR = UIColor.init(red: 204/255.0, green: 50/255.0, blue: 50/255.0, alpha: 1.0) // For special elements, UI status & hover effects
    static let GREY_COLOR = UIColor.init(red: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1.0) // For element backgrounds ex: Sub-menu
    static let WHITE_COLOR = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0) // For menu / List-Buttons
    static let BLACK_COLOR = UIColor.init(red: 46/255.0, green: 45/255.0, blue: 44/255.0, alpha: 1.0) // For regular text and labels
    static let RED2_COLOR = UIColor.init(red: 134/255.0, green: 26/255.0, blue: 23/255.0, alpha: 1.0) // For special text, buttons, and active states
    static let GREY2_COLOR = UIColor.init(red: 178/255.0, green: 178/255.0, blue: 178/255.0, alpha: 1.0) // For placeholders and inactive elemenet
    static let GREY3_COLOR = UIColor.init(rgb: 0xb2b2b2) // for episode left side background
    
    static let GREEN_COLOR = UIColor.init(red: 73/255.0, green: 170/255.0, blue: 75/255.0, alpha: 1.0) // For UI status & confirmations
    static let ORANGE_COLOR = UIColor.init(red: 241/255.0, green: 119/255.0, blue: 10/255.0, alpha: 1.0) // For UI status and elements
    static let ALARM_COLOR = UIColor.init(rgb: 0x861a17)
    static let OVERLAY_BG_COLOR = UIColor.init(white: 0, alpha: 0.5)
    static let STATUS_COLOR = UIColor.darkGray
    static let GREEN_LIGHT_COLOR = UIColor.init(red: 137/255.0, green: 176/255.0, blue: 35/255.0, alpha: 1.0) // For UI background color for header
    static let GREEN_DARK_COLOR = UIColor.init(red: 15/255.0, green: 124/255.0, blue: 126/255.0, alpha: 1.0) // For UI background
    static let BLUE_LIGHT_COLOR = UIColor.init(red: 0/255.0, green: 104/255.0, blue: 139/255.0, alpha: 1.0) // For UI search view
    static let PRIMARY_COLOR = UIColor.init(red: 25/255.0, green: 167/255.0, blue: 167/255.0, alpha: 1.0)
    static let PRIMARY_COLOR_DARK = UIColor.init(red: 13/255.0, green: 121/255.0, blue: 121/255.0, alpha: 1.0)
    static let COLOR_ACCENT = UIColor.init(red: 225/255.0, green: 151/255.0, blue: 4/255.0, alpha: 1.0)
    static let COLOR_ACCENT_DARK = UIColor.init(red: 171/255.0, green: 115/255.0, blue: 4/255.0, alpha: 1.0)
    
    //    blue: #38BBE9
    //    blue-light: #38BBE9 (50% opacity)
    //    gray: #99A9B3
    //    gray-light: #F0F0F0
    //    gray-light-text : #828899
    //    black: #000000
    //    popup background: #082034 (50% opacity)
    //    F0F0F0 : background color of contact
    static let BLUE = UIColor.init(red: 56/255.0, green: 187/255.0, blue: 233/255.0, alpha: 1.0)
    static let BLUE_LIGHT = UIColor.init(red: 56/255.0, green: 187/255.0, blue: 233/255.0, alpha: 0.5)
    static let GRAY = UIColor.init(red: 153/255.0, green: 169/255.0, blue: 179/255.0, alpha: 1.0)
    static let GRAY_LIGHT = UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
    static let GRAY_LIGHT_TEXT = UIColor.init(red: 130/255.0, green: 136/255.0, blue: 153/255.0, alpha: 1.0)
    static let POPUP_BACKGROUND = UIColor.init(red: 8/255.0, green: 32/255.0, blue: 52/255.0, alpha: 0.5)
    static let ORANGE = UIColor.init(red: 241/255.0, green: 89/255.0, blue: 43/255.0, alpha: 1.0)
    static let GRAY_LIGHT_90 = UIColor.init(red: 242/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
    
    static let BLUE_IN_COLOR = UIColor.init(red: 60/255.0, green: 102/255.0, blue: 210/255.0, alpha: 1.0)
    static let DARK_GREEN_COLOR = UIColor.init(red: 19/255.0, green: 121/255.0, blue: 120/255.0, alpha: 1.0)
    static let PINK_COLOR = UIColor.init(red: 234/255.0, green: 56/255.0, blue: 120/255.0, alpha: 1.0)
    static let LIGHT_PURPLE_COLOR = UIColor.init(red: 124/255.0, green: 23/255.0, blue: 159/255.0, alpha: 1.0)
    static let PURPLE_COLOR = UIColor.init(red: 83/255.0, green: 41/255.0, blue: 164/255.0, alpha: 1.0)
    static let INDIGO_COLOR = UIColor.init(red: 16/255.0, green: 125/255.0, blue: 143/255.0, alpha: 1.0)
    static let BLACK_GREEN_COLOR = UIColor.init(red: 2/255.0, green: 77/255.0, blue: 63/255.0, alpha: 1.0)
    static let CYAN_COLOR = UIColor.init(red: 101/255.0, green: 160/255.0, blue: 62/255.0, alpha: 1.0)
    static let MOSS_GREEN_COLOR = UIColor.init(red: 126/255.0, green: 142/255.0, blue: 25/255.0, alpha: 1.0)
    static let ORANGE_IN_COLOR = UIColor.init(red: 234/255.0, green: 80/255.0, blue: 9/255.0, alpha: 1.0)
    static let BROWN_COLOR = UIColor.init(red: 91/255.0, green: 64/255.0, blue: 53/255.0, alpha: 1.0)

}
struct AppViewOptions {
    static let SPLIT_VIEW = 0
    static let NAV_VIEW = 1
    static let NO_VIEW = 2
}
struct KeyUserDefault{
     static let Vibrate = "Vibrate"
     static let Beep = "Beep"
     static let MultiScan = "MultiScan"
     static let MultiLoad = "MultiLoad"
     static let Copy = "Copy"
    static let OpenWeb = "OpenWeb"
     static let ChangeColor = "ChangeColor"
}
struct LanguageKey {
    //Link
    static let Link_Privacy = "http://sites.google.com/view/tpcreative/home"
    static let Email_Help = "care@tpcreative.me"
    static let Link_Share = "https://play.google.com/store/apps/detail?id=tpcreative.co.qrscanner"
    //Scanner
    static let Placeholder_Ean8 = "PLACEHOLDER_EAN8"
    static let Placeholder_Ean13 = "PLACEHOLDER_EAN13"
    static let Back = "BACK"
    static let Aztec = "Aztec"
    static let CODABAR = "CODABAR"
    static let Code_39 = "Code 39"
    static let Code_93 = "Code 93"
    static let Code_128 = "Code 128"
    static let Data_Matrix = "Data Matrix"
    static let EAN_8 = "EAN_8"
    static let EAN_13 = "EAN_13"
    static let ITF = "ITF"
    static let PDF417 = "PDF417"
    static let QR_Code = "QR Code"
    static let RSS_14 = "RSS 14"
    static let RSS_Expanded = "RSS Expanded"
    static let UPCA = "UPCA"
    static let UPCE = "UPCE"
    static let UPC_EAN_extension = "UPC/EAN extension"
    static let Unknown = "Unknown"
    

    
    static let Clipboard = "CLIPBOARD"
    //Floaty Button
    static let Csv = "CSV"
    static let Select = "SELECT"
    static let Selected = "SELECTED"
    //Wifi
    static let SSID = "SSID"
    static let NetworkEncryption = "NETWORK_ENCRYPTION"
    static let Hidden = "HIDDEN"
    static let WPA = "WPA_WPA2"
    static let WEP = "WEP"
    static let None = "NONE"
    //Phone
    static let Phone = "PHONE"
    //Contact
    static let Fullname = "FULLNAME"
    static let Address = "ADDRESS"
    static let AddressBook = "ADDRESS_BOOK"
    
    //Event
    static let Title = "TITLE"
    static let Description = "DESCRIPTION"
    static let TimeBegin = "TIME_BEGIN"
    static let TimeEnd = "TIME_END"
    static let Calendar = "CALENDAR"
    
    //Location
    static let Latitude = "LATITUDE"
    static let Longtitude = "LONGTITUDE"
    static let Query = "QUERY"
    //Message
    static let To = "TO"
    static let Subject = "SUBJECT"
    //Text
    //Email
    static let EmailAddress = "EMAIL_ADDRESS"
    static let Object = "OBJECT"
    static let SaveSuccess = "SAVE_SUCCESS"
    static let Copy_Item_Success = "COPY_ITEM_SUCCESS"
    //Setting
    static let Scan = "SCAN"
    static let Advance_Feature = "AVANCE_FEATURE"
    static let Information = "INFORMATION"
    static let Vibrate  = "VIBRATE"
    static let Beep = "BEEP"
    static let Change_code_color = "CHANGE_CODE_COLOR"
    static let Change_code_color_content = "CHANGE_CODE_COLOR_CONTENT"
    static let CopyClipboard = "COPY_CLIPBOARD"
      static let CopyClipboard_Content = "COPY_CLIPBOARD_CONTENT"
    static let  OpenWeb = "OPEN_WEB"
     static let  OpenWebContent = "OPEN_WEB_CONTENT"
    static let AppPermission = "APP_PERMISSION"
    static let Privacy = "PRIVACY"
    static let Rate = "RATE"
    static let Support = "SUPPORT"
    static let SupportContent = "SUPPORT_CONTENT"
    static let QRVersion = "QR_VERSION"
    static let QRVersionContent = "QR_VERSION_CONTENT"
    static let MultiScan = "MULTI_SCAN"
    static let MultiLoad = "MULTI_LOAD"
    static let MultiScanContent = "MULTI_SCAN_CONTENT"
    static let MultiLoadContent = "MULTI_LOAD_CONTENT"

    
    static let CancelButtonTitle = "CANCEL"
    static let DoneButtonTitle = "DONE"
    static let TimeFrame = "TIME_FRAME"
    
    static let RequestFailed = "REQUEST_FAILED"
    static let InvalidData = "INVALID_DATA"
    static let ResponseUnsuccessful = "RESPONSE_UNSUCCESSFUL"
    static let NoInternetConnection = "NO_INTERNET_CONNECTION"
    static let JsonParsingFailure = "JSON_PARSING_FAILURE"
    static let JsonConversionFailure = "JSON_CONVERSION_FAILURE"
    static let ErrorPasswordRequired = "ERROR_PASSWORD_REQUIRED"
    static let ErrorOldPasswordRequired = "ERROR_OlD_PASSWORD_REQUIRED"
    static let ErrorNewPasswordRequired = "ERROR_NEW_PASSWORD_REQUIRED"
    static let ErrorConfirmPasswordRequired = "ERROR_CONFIRM_PASSWORD_REQUIRED"
    static let ErrorPasswordInvalid = "ERROR_PASSWORD_INVALID"
    static let ErrorPasswordLength = "ERROR_PASSWORD_LENGTH"
    static let ErrorEmailRequired = "ERROR_EMAIL_REQUIRED"
    static let ErrorEmailInvalid = "ERROR_EMAIL_INVALID"
    static let ErrorUserNameRequired = "ERROR_USERNAME_REQUIRED"
    static let ErrorUserNameInvalid = "ERROR_USERNAME_INVALID"
    static let ErrorPhoneNumberRequired = "ERROR_PHONENUMBER_REQUIRED"
    static let ErrorPhoneNumberInvalid = "ERROR_PHONENUMBER_INVALID"
    
    static let UsernamePlaceHolder = "USERNAME"
    static let EmailPlaceHolder = "EMAIL"
    static let PasswordPlaceHolder = "PASSWORD"
    static let PhonePlaceHolder = "PHONE"
    static let SignInButton = "SIGNIN"
    static let Error = "ERROR"
    static let Success = "SUCCESS"
    static let Fail = "FAIL"
    
    static let ErrorFirstNameRequired = "ERROR_FIRSTNAME_REQUIRED"
    static let ErrorLastNameRequired = "ERROR_LASTNAME_REQUIRED"
    static let ErrorBirthdayRequired = "ERROR_BIRTHDAY_REQUIRED"
    static let ErrorBirthdayInvalid = "ERROR_BIRTHDAY_INVALID"
    
    //time
    static let Time_Day = "DAY"
    static let Time_Days = "DAYS"
    static let Time_Hour = "HOUR"
    static let Time_Hours = "HOURS"
    static let Time_Minute = "MINUTE"
    static let Time_Minutes = "MINUTES"
    static let Time_Second = "SECOND"
    static let Time_Seconds = "SECONDS"
    
    //Home
    static let FROM = "FROM"
    static let Passengers = "PASSENGERS"
    static let SeatClass = "SEATCLASS"
    static let DepartureDate = "DEPARTURE_DATE"
    static let ReturnDate = "RETURN_DATE"
    static let Search = "SEARCH"
    static let Price = "PRICE"
    static let Direct = "DIRECT"
    static let StopNumber = "STOPNUMBER"
    static let Continue = "CONTINUE"
    static let Departure = "DEPARTURE"
    static let Return = "RETURN"
    static let History = "HISTORY"
    static let Sync  = "SYNC"
    static let AccountName = "ACCOUNTNAME"
    static let eCashId = "ECASHID"
    static let eCashBalance = "ECASHBALANCE"
    static let eDongId = "EDONGID"
    static let eDongBalance = "EDONGBALANCE"
    static let AddeCash = "ADDECASH"
    static let WithDraweCash = "WITHDRAWECASH"
    static let ExchangeeCash = "EXCHANGEECASH"
    static let Transfer = "TRANSFER"
    static let PaymentServices = "PAYMENTSERVICES"
    static let PayEVN = "PAYEVN"
    static let PayWATER = "PAYWATER"
    static let PaySupermarket = "PAYSUPERMARKET"
    static let PayVTVCab = "PAYVTVCAB"
    static let ActiveAccountNow = "ACTIVE_ACCOUNT_NOW"
    //typeCode
    
    static let ProductID = "PRODUCTID"

    static let Total = "TOTAL"
    static let Sms = "SMS"
    static let Email = "EMAIL"
    static let Barcode = "BARCODE"
    static let Message = "MESSAGE"
    static let Location = "LOCATION"
    static let Event = "EVENT"
    static let Contact = "CONTACT"
    static let Telephone = "TELEPHONE"
    static let Text = "TEXT"
    static let Wifi = "WIFI"
    static let Url = "URL"
    static let True = "TRUE"
    static let False = "FALSE"
    static let Copy_item = "COPY_ITEMS"
    static let Content_copy = "CONTENT_COPY"
    static let ChooseQRCode = "CHOOSE_QRCODE"
      static let ChooseOneQRCode = "CHOOSE_ONE_QRCODE"
    static let AppPermissonContent1 = "APPPERMISSIONCONTENT1"
     static let AppPermissonContent2 = "APPPERMISSIONCONTENT2"
     static let AppPermissonContent3 = "APPPERMISSIONCONTENT3"
    static let AppPermissonContent4 = "APPPERMISSIONCONTENT4"

    static let AppPermissonContent5 = "APPPERMISSIONCONTENT5"

    static let AppPermissonContent6 = "APPPERMISSIONCONTENT6"

    //Confirm
    static let Gender = "GENDER"
    static let FirstName = "FIRSTNAME"
    static let LastName = "LASTNAME"
    static let Birthday = "BIRTHDAY"
    static let ContactInfo = "CONTACTINFO"
    static let Booking = "BOOKING"
    static let FillUp = "FILL_UP"
    //Checkout
    static let TicketNumber = "TICKETNUMBER"
    static let Status = "STATUS"
    static let TotalMoney = "TOTALMONEY"
    static let NoPayment = "NOPAYMENT"
    static let Paymented = "PAYMENTED"
    static let Checkout = "CHECKOUT"
    static let FLIGHTNAME = "FLIGHTNAME"
    //Destination
    static let SearchPlaceholder = "SEARCHPLACEHOLDER"
    static let NoResult = "NORESULT"
    static let Cancel = "CANCEL"
    static let Copy = "COPY"
    
    static let TryAgain = "TRY_AGAIN"
    static let Ok = "OK"
    
    //SignIn
    static let TitleBrand = "ECASH"
    static let SignOut = "SIGNOUT"
    static let SignInWithGoogle = "SIGNINWITHGOOGLE"
    static let ErrorUserNameNotMathCurrentUserName = "ERROR_USERNAME_DOES_NOT_MATH_CURRENT_USERNAME"
    static let USER_NOT_ACTIVE = "USER_NOT_ACTIVE"
    //HistoryCheckout
    static let OneWay = "ONEWAY"
    static let Quantity = "QUANTITY"
    static let CreatedDate = "CREATEDDATE"
    static let Maximum7Passengers = "MAXIMUM7PASSENGERS"
    static let InfantCouldNotMoreThanAdult = "INFANTCOUNTNOTMORETHANADULT"
    //Gallery
    static let ChooseFromLibrary = "CHOOSEFROMLABRARY"
    static let ChooseFromPhotoRoll = "CHOOSEFROMPHOTOROLL"
    static let NoSources = "NOSOURCES"
    static let TakePhoto = "TAKEPHOTO"
    static let TakeVideo = "TAKEVIDEO"
    //Tab bar
    static let Home = "HOME"
    static let Generate = "GENERATE"
    static let Scanner = "SCANNER"
    static let Save = "SAVE"
    static let Setting = "SETTING"
    //SignIn
    static let CouldNotSignIn = "COULD_NOT_SIGN_IN"
    static let DoNotHaveAnAccount = "DO_NOT_HAVE_AN_ACCOUNT"
    static let SignUpNow = "SIGN_UP_NOW"
    static let ActiveSuccessful = "ACTIVE_SUCCESSFUL"
    static let UsernameCouldNotContainSpecialCharacter = "USERNAME_COULD_NOT_CONTAIN_SPECIAL_CHARACTER"
    //SignUp
    static let SignUp = "SIGNUP"
    static let AccountNumber = "ACCOUNTNUMBER"
    static let FullName = "FULLNAME"
    static let Password = "PASSWORD"
    static let EnterId = "ENTERID"
    static let EnterPhoneNumber = "ENTERPHONENUMBER"
    static let ConfirmPassWord = "CONFIRMPASSWORD"
    static let ErrorAccountNumberRequired = "ERROR_ACCOUNT_NUMBER_REQUIRED"
    static let ErrorUsernameRequired = "ERROR_USER_NAME_REQUIRED"
    static let ErrorFullNameRequired = "ERROR_FULLNAME_REQUIRED"
    static let ErrorConfirmRequired = "ERROR_CONFIRM_REQUIRED"
    static let ErrorIdRequired = "ERROR_ID_REQUIRED"
    static let ErrorIdInvalid = "ERROR_ID_INVALID"
    static let ErrorPasswordDoNotMatch = "PASSWORD_DO_NOT_MATCH"
    static let Alert = "ALERT"
    static let ErrorOTPRequest = "ERROR_OTP_REQUIRED"
    static let AddOTP = "ADD_OTP"
    static let PleaseEnterTheOTPCode = "PLEASE_ENTER_THE_OTP_CODE"
    static let Active = "ACTIVE"
    static let OTPCode = "OTP_CODE"
    static let IdMustBeDigitNumber = "ID_MUST_BE_DIGIT_NUMBERS"
    //GenerateQR
    static let ErrorToRequired = "ERROR_TO_REQUIRED"
    static let ErrorUrlRequired = "ERROR_URL_REQUIRED"
    static let ErrorUrlInvalid = "ERROR_URL_INVALID"
    static let ErrorTextRequired = "ERROR_TEXT_REQUIRED"
     static let ErrorProductRequired8 = "ERROR_PRODUCT_REQUIRED8"
      static let ErrorProductRequired13 = "ERROR_PRODUCT_REQUIRED13"
    static let ErrorProductInvalid = "ERROR_PRODUCT_INVALID"
    static let ErrorObjectEmailRequired = "ERROR_OBJECT_EMAIL_REQUIRED"
    static let ErrorMessageEmailRequired = "ERROR_MESSAGE_EMAIL_REQUIRED"
    static let ErrorFullNameContactRequired = "ERROR_FULLNAME_CONTACT_REQUIRED"
    static let ErrorAddressContactRequired = "ERROR_ADDRESS_CONTACT_REQUIRED"
    static let ErrorPhoneContactRequired = "ERROR_PHONE_CONTACT_REQUIRED"
    static let ErrorEmailContactRequired = "ERROR_EMAIL_CONTACT_REQUIRED"
    static let ErrorLatRequired = "ERROR_LAT_REQUIRED"
    static let ErrorLatInvalid = "ERROR_LAT_INVALID"
    static let ErrorLonRequired = "ERROR_LON_REQUIRED"
    static let ErrorLonInvalid = "ERROR_LON_INVALID"
    static let ErrorQueryRequired = "ERROR_QUERY_REQUIRED"
    static let ErrorBeginDateGreaterEndDate = "ERROR_BEGINDAY_GREATER_ENDDAY"
    static let ErrorEndTimeRequired = "ERROR_ENDTIME_REQUIRED"
    static let ErrorBeginTimeRequired = "ERROR_BEGINTIME_REQUIRED"
    static let ErrorDescriptionEventRequired = "ERROR_DESCRIPTION_EVENT_REQUIRED"
    static let ErrorLocationEventRequired = "ERROR_LOCATION_EVENT_REQUIRED"
    static let ErrorTitleEventRequired = "ERROR_TITLE_EVENT_REQUIRED"
    static let ErrorSSIDRequired = "ERROR_SSID_REQUIRED"
    static let ErrorPassWordWifiRequired = "ERROR_PASS_WIFI_REQUIRED"
    static let ErrorMessageRequired = "ERROR_MESSAGE_REQUIRED"
    //Help
    static let Title_Help1 = "TITLE_HELP1"
    static let Title_Help2 = "TITLE_HELP2"
    static let Title_Help_Content1 = "TITLE_HELP_CONTENT1"
    static let Title_Help_Content2 = "TITLE_HELP_CONTENT2"
    static let Title_Help_Content3 = "TITLE_HELP_CONTENT3"
    static let Title_Help_Content4 = "TITLE_HELP_CONTENT4"
    
    //Add eCash
    static let Verify = "VERIFY"
    static let Money = "MONEY"
    static let M500 = "M500"
    static let M200 = "M200"
    static let M100 = "M100"
    static let M50 = "M50"
    static let M20 = "M20"
    static let M10 = "M10"
    static let YoureDongBalanceIsNotEnough = "EDONG_NOT_ENOUGH"
    static let SocketConnectError = "SOCKET_CONNECT_ERROR"
    static let NotFoundeDongId = "NOT_FOUND_EDONG_ID"
    static let eCashToeCash = "ECASH_TO_ECASH"
    static let NoListAvailable = "NO_LIST_AVAILABLE"
    static let SelectMoney = "SELECT_MONEY"
    static let Count = "COUNT"
    static let Amount = "AMOUNT"
    //WithdraweCash
    static let WithdraweCash = "WITHDRAW_ECASH"
    static let WithdrawToeDong = "WITHDRAW_TO_EDONG"
    static let EnterMoney = "ENTERMONEY"
    static let ErrorMoneyRequired = "ERROR_MONEY_REQUIRED"
    static let YoureCashBalanceIsNotEnough = "ECASH_NOT_ENOUGH"
    
    //Transfer
    static let EntereCashId = "ENTER_ECASH_ID"
    static let EnterContent = "ENTER_CONTENT"
    static let TransferToeCash = "TRANSFER_TO_ECASH"
    static let ErrorWalletIdRequired = "ERROR_WALLET_ID_REQUIRED"
    static let ErrorMonenyRequired = "ERROR_MONEY_REQUIRED"
    static let ErrorContentRequired = "ERROR_CONTENT_REQUIRED"
    
    //Alert
    static let ErrorOcurred = "ERROR_OCURRED"
    static let IdNumber = "ID_NUMBER"
    static let Username  = "USERNAME"
    static let NotExisted = "NOT_EXISTED"
    static let AlreadyExisted = "ALREADYEXISTED"
    static let Close = "CLOSE"
    static let Yes = "YES"
    static let No = "NO"
    static let DoYouWantToSignIn = "DO_YOU_WANT_TO_SIGIN"
    static let TransactionSuccessful = "TRANSACTION_SUCCESSFUL"
    static let YouHaveAddedToeCash = "YOU_HAVE_ADDED_TO_ECASH"
    static let YouHaveWithdrawnFromeDong = "YOU_HAVE_WITHDRAWN_FROM_EDONG"
    static let YouHaveTransferredToeCash = "YOU_HAVE_TRANSFERRED_TO_ECASH"
    static let YouHaveExchangedCash = "YOU_HAVE_EXCHANGED_CASH"
    
    
    //My Wallet
    static let ChangePassword = "CHANGE_PASSWORD"
    static let Help = "HELP"
    static let DeleteAccount = "DELETEACCOUNT"
    static let DoYouWantExitThisSession = "DO_YOU_WANT_EXIT_THIS_SESSION"
    
    //My Profile
    static let PhoneNumber = "PHONE_NUMBER"
    static let Change = "CHANGE"
    static let SessionExpried = "SESSION_EXPIRED"
    static let SignIn = "SIGN_IN"
    static let ThisFeatureComingSoon = "THIS_FEATURE_COMING_SOON"
    static let MyAvatar = "MY_AVATAR"
    static let MyQRCode = "MY_QRCODE"
    //Scanner
    static let Flash = "FLASH"
    static let Gallery = "GALLERY"
    static let ScanQR = "SCANQR"
    static let CreatedQR = "CREATED_QR"
    static let QRTitle = "QRTITLE"
    static let QRStatus = "QRSTATUS"
    static let UseQRCode = "USEQRCODE"
    static let GeneratedQR = "GENERATEDQR"
    static let AskPermissionAlert = "ASK_PERMISSION_ALERT"
    static let QRCodeHasBeenReceivedBefore = "QRCODE_HAS_BEEN_RECEIVED_BEFORE"
    static let InvalidQRCode = "INVALID_QRCODE"
    static let TransactionAreSentToAnother = "TRANSACTION_ARE_SENT_TO_ANOTHER"
    //Exchange eCash
    static let CashListAvailable = "CASH_LIST_AVAILABLE"
    static let CashExchage = "CASH_EXCHANGE"
    static let CashReceive = "CASH_RECEIVE"
    static let ExchangeCash = "EXCHANGE_CASH"
    static let TotalExchangeCash = "TOTAL_EXCHANGE_CASH"
    static let TotalExpectationCash = "TOTAL_EXPECTATION_CASH"
    
    //Transactions History
    static let StatusSuccess = "STATUS_SUCCESS"
    static let StatusFail = "STATUS_FAIL"
    static let Months = "MONTHS"
    
    //Generated QRCode
    static let Send = "SEND"
    static let Delete = "DELETE"
    //Scanner Result
    static let ReceiveeCash = "RECEIVEECASH"
    static let TransactionsInfo = "TRANSACTIONSINFO"
    static let eCashTotal = "ECASHTOTAL"
    static let Sender = "SENDER"
    static let Content = "CONTENT"
    static let ReceiverNotFound = "RECEIVER_NOT_FOUND"
    static let AskPermission = "ASK_PERMISSION"
    static let ReceivedLixiSuccessfully = "RECEIVED_LIXI_SUCCESSFULLY"
    //Contact
    static let Edit = "EDIT"
    static let DeviceInfo = "DEVICE_INFO"
    static let WalletNumber = "WALLET_NUMBER"
    static let TypeName = "TYPE_NAME"
    //Add contact
    static let AddContact = "ADD_CONTACT"
    static let AddContactSuccess = "ADD_CONTACT_SUCCESS"
    static let AddContactExisted = "ADD_CONTACT_EXISTED"
    static let Add = "ADD"
    static let TypePhoneNumberWalletId = "TYPE_PHONE_NUMBER_OR_WALLET_ID"
    //Transaction filter
    static let Time = "TIME"
    static let TransactionType = "TRANSACTION_TYPE"
    static let Done = "DONE"
    static let TransactionDetail = "TRANSACTION_DETAIL"
    static let eCashEmount = "ECASH_AMOUNT"
    static let Clear = "CLEAR"
    static let ChooseTime = "CHOOSE_TIME"
    static let ChooseType = "CHOOSE_TYPE"
    static let ChooseStatus = "CHOOSE_STATUS"
    //Transaction log detail
    static let QRCode = "QRCODE"
    static let Share = "SHARE"
    static let SaveToDevice = "SAVE_TO_DEVICE"
    static let ReceiverCode = "RECEIVER_CODE"
    static let Issuer = "ISSUER"
    static let SenderCode  = "SENDER_CODE"
    static let FullNameTitle = "FULLNAME_TITLE"
    static let AlreadySavedQRCodeToDevice = "ALREADY_SAVED_QRCODE_TO_DEVICE"
    static let AreYouSureDeleteThisAccount  = "ARE_YOU_SURE_DELETE_THIS_ACCOUNT"
    static let SavedToDevice = "SAVED_TO_DEVICE"
    //Destroy Wallet
    static let DestroyAccount = "DESTROY_ACCOUNT"
    static let DestroyContent   = "DESTROY_CONTENT"
    static let TransfereCash = "TRANSFER_ECASH"
    static let Exit = "EXIT"
    static let DestroyAccountSuccessfully = "DESTROY_ACCOUNT_SUCCESSFULLY"
    //Change Password
    static let EnterNewPassword = "ENTER_NEW_PASSWORD"
    static let EnterOldPassword = "ENTER_OLD_PASSWORD"
    static let NewPasswordIsTheSameWithOldPassword = "NEW_PASSWORD_IS_THE_SAME_WITH_OLD_PASSWORD"
    //Forgot password
    static let ForgotPassword  = "FORGOTPASSWORD"
    static let VerifyOTP = "VERIFY_OTP"
    static let TheCodeWasSentTo = "THE_CODE_WAS_SEND_TO"
    static let EnterOTPCode = "ENTER_OTP_CODE"
    static let Resend = "RESEND"
    static let RecoverPassword = "RECOVERPASSWORD"
    static let RecoverPasswordSuccessfully = "RECOVER_PASSWORD_SUCCESSFULLY"
    //Mutiple languages
    static let ChooseYourLanguage = "CHOOSE_YOUR_LANGUAGE"
    static let Vietnamese = "VIETNAMESE"
    static let English = "English"
    static let Spanish = "SPANISH"
    static let Portuguese = "PORTUGUESE"
    static let Language =  "LANGUAGE"
    //My QRCode
    static let ScanQRCodeLetToEWallet = "SCANQRCODELETTOADDEWALLET"
    static let CouldNotAddToItself  = "COULD_NOT_ADD_TO_ITSELF"
    static let CouldNotTransferToItself = "COULD_NOT_TRANSFER_TO_ITSELF"
    static let YourImagesSaveToPhotos = "YOUR_IMAGE_WAS_SAVED_TO_PHOTOS"
    //Intro
    static let Skip = "SKIP"
    static let Start = "START"
    static let NotificationHistory = "NOTIFICATION_HISTORY"
    
    //Profile info
    static let ProfileInfo = "PROFILE_INFO"
    static let Full_Name = "FULL_NAME_PROFILE"
    static let ErrorAddressRequired = "ERROR_ADDRESS_REQUIRED"
    //GalleryOptions
    static let ChangeAvatar = "CHANGE_AVATAR"
    static let ChooseFromGallery = "CHOOSE_FROM_GALLERY"
    static let TakePicture = "TAKE_PICTURE"
    static let YouCouldNotSelectMoreThan = "YOU_COULD_NOT_SELECT_MORE_THAN"
    //Lixi
    static let Opened = "OPENED"
    static let Lock = "LOCK"
    static let YourLixi = "YOUR_LIXI"
    static let LuckyMoneyFrom = "LUCKY_MONEY_FROM"
    static let LuarNewYearFromECPAY = "LUNAR_NEW_YEAR_FROM_ECPAY"
    //SendLixi
    static let SendLixi = "SEND_LIXI"
    //ReceiveLixiOptions
    static let Greetings = "GREETINGS"
    static let GreetingsMessage = "GREETINGS_MESSAGE"
    static let LuckyMoney = "LUCKY_MONEY"
    static let ChooseTemplate  = "CHOOSE_TEMPLATE"
    static let ErrorOccurredLocalDB = "ERROR_OCCURREDLOCAL_DB"
    static let UpdatedSuccessfully = "UPDATED_SUCCESSFULLY"
    static let InsertedSuccessfully = "INSERTED_SUCCESSFULLY"
    static let ErrorOccurredFromSystem = "ERROR_OCCURRED_FROM_SYSTEM"
    static let PleaseActiveAccountToUseThisFeature = "PLEASE_ACTIVE_ACCOUNT_TO_USE_THIS_FEATURE"
    static let NotFound = "NOT_FOUND"
    static let AccountDoesNotExist = "ACCOUNT_DOES_NOT_EXIST"
    static let PasswordIncorrect = "PASSWORD_INCORRECT"
    static let OTPInvalid = "OTP_INVALID"
    static let OTPIncorrect = "OTP_INCORRECT"
}

struct LanguageCode {
    static let English = "en"
    static let Vietnamese = "vi"
      static let Spanish = "es"
      static let Portuguese = "pt"
}

struct StorageKey {
    static let activeAccountData = "ActiveAccountData"
    static let signupData = "SignUpData"
    static let signInData = "SignInData"
    static let signInNoneWalletData = "SignInNoneWalletData"
    static let configData = "configurationData"
    static let cipherKey = "cipherKey"
    static let eDongInfoData = "eDongInfoData"
    static let isAlreadyStore = "isAlreadyStore"
    static let keychain = "keychain"
    static let keychainFirebase = "keychainFirebase"
    static let masterkey = "masterkey"
    static let firstCreatedKeyChain = "firstCreatedKeyChain"
    static let deviceId  = "deviceId"
    static let multipleLanguages = "multipleLanguages"
    static let firebaseToken = "firebaseToken"
    static let channelPublicKey = "channelPublicKey"
    static let isIntro = "isIntro"
    static let isSignOut = "isSignOut"
    static let valueImageGenerate = "valueImageGenerate"
    
}

struct FolderName {
    static let db = "db"
    static let gallery = "gallery"
    static let png = "png"
}

struct ConfigKey {
    static let BaseUrl = "RootUrl"
    static let WSUrl = "WSUrl"
    static let AppName = "CFBundleName"
    static let GoogleClientId = "GoogleClientId"
    static let GoogleReversedClientId = "GoogleReversedClientId"
    static let AppDataFolder = "appDataFolder"
    static let RequestUpdateeDong = "RequestUpdateeDong"
    static let DismissView = "DismissView"
    static let RequestQRCodeResult = "RequestQRCodeResult"
    static let UpdatedUIForChangedLanguage = "UpdatedUIForChangedLanguage"
    static let RequestCheckAvailableNotification = "RequestCheckAvailableNotification"
    static let RequestNavigationNotificationHistory = "RequestNavigationNotificationHistory"
    static let RequestSaveToPhotos = "RequestSaveToPhotos"
    static let ActionToView = "ActionToView"
}

struct CipherKey {
    static let Key = "0123456789ABCDEFGHIJKL0123456789"
    static let EDONGECPAY = 1238161606
    static let ECPAY = "ECPAY"
    static let ExchangeCash = "Exchange cash"
}

struct GoogleScopes {
    static let DRIVE_FILE = " https://www.googleapis.com/auth/drive.file"
    static let DRIVE_APPDATA = "https://www.googleapis.com/auth/drive.appdata"
}

struct ApiEndPointUrl {
    static let BaseUrl = ConfigKey.BaseUrl
    static let CheckingIdNumberAndPhoneNumber = "/ecgateway/execute/FU100"
    static let CheckingUsername = "/ecgateway/execute/FU00003"
    static let SignUp = "/ecgateway/execute/FU0001"
    static let ActiveAccount = "/ecgateway/execute/FU0003"
    static let SignIn = "/ecgateway/execute/FU00004"
    static let SignOut = "/ecgateway/execute/GW000001"
    static let eDongToeCashOwner = "/ecgateway/execute/GWEC0004"
    static let eDongToeCashOwnerAmount = "/ecgateway/execute/GWEC0001"
    static let eDongToeCashToSomeone = "/ecgateway/execute/GWEC0002"
    static let eDongToeCashToSomeoneAmount = "/ecgateway/execute/GWEC0003"
    static let GeteDongInfo = "/ecgateway/execute/FU0002"
    static let eCashToeDong = "/ecgateway/execute/GW000001"
    static let SignInWithNoneWallet = "/ecgateway/execute/GWEC0029"
    static let SignInWithNoneWalletValidatedOTP = "/ecgateway/execute/GWEC0030"
    static let GetWalletInfo = "/ecgateway/execute/GWEC0007"
    static let GetPublicKeyeCashRelease = "/ecgateway/execute/GWEC0005"
    static let GetPublicKeyOrganizeRelease = "/ecgateway/execute/GWEC0006"
    static let ReSendOTP = "/ecgateway/execute/GW000004"
    static let ChangePassword = "/ecgateway/execute/GW000003"
    static let DestroyWallet = "/ecgateway/execute/GWEC0020"
    static let VerifyTransaction = "/ecgateway/execute/GWEC0008"
    static let ExchangeCash = "/ecgateway/execute/GWEC0011"
    static let SyncContact = "/ecgateway/execute/GWEC0017"
    static let SearchByPhoneNumber = "/ecgateway/execute/GWEC0016"
    static let SendOTP = "/ecgateway/execute/GWEC0024"
    static let UpdatedForgotPassword = "/ecgateway/execute/GWEC0025"
    static let EditProfile = "/ecgateway/execute/GWEC0021"
    static let UploadAvatar = "/ecgateway/execute/GWEC0022"
    static let GetDenomination = "/ecgateway/execute/GWEC0031"
    static let AddContact = "/ecgateway/execute/GWEC0023"
    static let DeleteContact = "/ecgateway/execute/GWEC0038"
    
    static let UserSignIn = "/api/login"
    static let UserList = "/api/users/"
    static let SearchList = "/api/Airline/Search"
    static let Donwload = "/api/download"
    static let Upload = "/api/upload"
    static let Booking = "/api/Airline/Book"
    static let SaveInfo = "/api/Airline/SavePaymentInfo"
    static let ExecutePayment = "/api/airline/excusePayments"
    static let UpdatePaymentInfo = "/api/Airline/UpdatePaymentInfo"
    static let UserPassword = "/api/v2/users/password"
    static let UserDetail = "/api/v2/users/{userId}"
    static let UserAction = "/api/v2/users/{userId}/action"
    static let UserChangeUserData = "/api/v2/users/{userId}"
    static let UserPhoto = "/api/v2/users/{userId}/photo"
    static let ListUser = "/api/v2/users"
    static let AllUserEvent = "/api/v2/events/users"
}

struct Storyboard {
    static let main = "Main"
    static let author = "Author"
    static let settings = "Settings"
    static let lixi = "Lixi"
}

struct Controller {
    static let email = "Email"
    static let signin = "SignIn"
    static let signup = "SignUp"
    static let settings = "Settings"
    static let contact = "Contact"
    static let scanner = "Scanner"
    static let transaction = "TransactionsLogs"
    static let myWallet = "MyWallet"
    static let home = "Home"
    static let tabWallet = "TabWallet"
    static let tabProfile = "TabProfile"
    static let addeCash = "AddeCash"
    static let withdraweCash = "WithdraweCash"
    static let withdraweCashMultiple = "WithdraweCashMultiple"
    static let exchangeeCash = "ExchangeeCash"
    static let transfereCash = "TransfereCash"
    static let transfereCashMultiple = "TransfereCashMultiple"
    static let alert = "Alert"
    static let scannerResult = "ScannerResult"
    static let qrCodeHistory = "QRCodeHistory"
    static let exchangeeCashOptions = "ExchangeeCashOptions"
    static let addGenerate  = "AddGenerate"
    static let editContact = "EditContact"
    static let transactionFilter = "TransactionFilter"
    static let transactionLogsDetail = "TransactionLogsDetail"
    static let signOutOptions = "SignOutOptions"
    static let destroyWalletOptions = "DestroyWalletOptions"
    static let destroyWalletSuccessfulOptions = "DestroyWalletSuccessfulOptions"
    static let changePassword = "ChangePassword"
    static let forgotPassword = "ForgotPassword"
    static let forgotPasswordOTPOptions = "ForgotPasswordOTPOptions"
    static let recoverPassword = "RecoverPassword"
    static let multipleLanguages = "MultipleLanguages"
    static let myQRCode = "MyQRCode"
    static let intro = "Intro"
    static let notificationHistory = "NotificationHistory"
    static let exchangeeCashOverviewOptions = "ExchangeeCashOverviewOptions"
    static let helpSupport = "HelpSupport"
    static let editProfile = "EditProfile"
    static let galleryOptions = "GalleryOptions"
    static let lixi = "Lixi"
    static let sendLixi = "SendLixi"
    static let receiveLixiOptions = "ReceiveLixiOptions"
}

enum EnumIdentifier : String {
    case Scan = "Scan"
    case QRCodeList = "QRCodeList"
    case Advance_Feature = "Advance_Feature"
    case Information = "Information"
    case ChangeColor = "ChangeColor"

    case None = "None"
    case Home  = "Home"
    case HistoryCheckout = "HistoryCheckout"
    case PaymentServices = "PaymentServices"
    case TransfereCashToeCash = "transferecashtoecash"
    case WithdrawMultipleeCash = "WithdrawMultipleeCash"
    case History = "history"
    case Dropdown = "dropdown"
    case HistoryChoose = "history_choose"
    case SaveChoose = "save_choose"
    case Save = "save"
    case Generate = "generate"
    case Alert = "alert"
    
    case Url = "URL"
    case Text = "TEXT"
    case Phone = "PHONE"
    case Email = "EMAIL"
    case Wifi = "WIFI"
    case Contact = "CONTACT"
    case Location = "LOCATION"
    case Message = "MESSAGE"
    case Event = "EVENT"
    case Barcode = "BARCODE"
    case Detail = "detail"
    case Content = "content"
    case Telephone = "TELEPHONE"
    case Transactions = "transactions"
    case QRCodeHistory = "qrcodeHistory"
    case ScannerResult = "ScannerResult"
    case ExchangeeCash = "ExchangeeCash"
    case ExchangeeCashAvailable = "ExchangeeCashAvailable"
    case ExpectationCash = "ExpectationCash"
    case AddContact = "AddContact"
    case TransactionsLogsDetail = "TransactionsLogsDetail"
    case Intro = "Intro"
    case NotificationHistory = "NotificationHistory"
    case ExchangeOverviewOptions = "ExchangeOverviewOptions"
    case ExpectationOverviewOptions = "ExpectationOverviewOptions"
    case Denomination = "Denomination"
    case SendLixi = "SendLixi"
    case Lixi = "Lixi"
    case ReceiveLixiOptions = "ReceiveLixiOptions"
}
enum EnumType : String {
    case BARCODE = "BARCODE"
    case URL = "URL"
    case TEXT = "TEXT"
    case TELEPHONE = "TELEPHONE"
    case EMAIL = "EMAIL"
    case WIFI = "WIFI"
    case CONTACT = "CONTACT"
    case LOCATION = "LOCATION"
    case MESSAGE = "MESSAGE"
    case EVENT = "EVENT"
}
enum BarcodeType : String {
   case EAN_8, EAN_13
static var allValues = [BarcodeType.EAN_8, .EAN_13]
}
enum ColorString : String {
    case Black = "Black"
    case Blue = "Blue"
    case DarkGreen = "DarkGreen"
    case Pink = "Pink"
    case LightPurple = "LightPurple"
    case Purple = "Purple"
    case Indigo = "Indigo"
    case BlackGreen = "BlackGreen"
    case Cyan = "Cyan"
     case MossGreen = "MossGreen"
     case Orange = "Orange"
     case Brown = "Brown"
}
enum EnumResponseCode : String {
    case USER_IS_NOT_EXISTED = "3035"
    case NOT_EXISTING_USER = "1004"
    case SIGNATURE_INVALID = "3029"
    case EXISTING_VALUE = "0000"
    case USER_IS_EXISTED = "1006"
    case SESSION_NOT_EXISTED = "3043"
    case OTP_INCORRECT = "3014"
    case OTP_INVALID = "0998"
    case USER_NOT_ACTIVE = "3077"
    case PASSWORD_INVALID = "3019"
}

enum EnumResponseAction : String {
    case CREATED_SUCCESSFULLY = "CREATED_SUCCESSFULLY"
    case EXISTING_USERNAME = "EXISTING_USERNAME"
    case ERROR = "ERROR"
    case ERROR_USERNAME = "ERROR_USERNAME"
    case ERROR_IDNUMBER_PHONENUMBER = "ERROR_IDNUMBER_PHONENUMBER"
    case ECASH_TO_EDONG = "ECASH_TO_EDONG"
    case ECASH_TO_ECASH = "ECASH_TO_ECASH"
    case EDONG_TO_ECASH = "EDONG_TO_ECASH"
    case EXCHANGE_CASH = "EXCHANGE_CASH"
    case TRANSACTION = "TRANSACTION"
    case UPDATE = "UPDATE"
    case REQUEST_SIGN_IN = "REQUEST_SIGN_IN"
}

enum EnumFunctionName : String {
    case CHECKING_ID_NUMBER_PHONE_NUMBER = "FU100"
    case CHECKING_USERNAME = "FU00003"
    case ACTIVE_ACCOUNT = "FU0003"
    case SIGN_UP_USER = "FU0001"
    case SIGN_IN_USER  = "FU00004"
    case WEB_SOCKET = "EC00027"
    case GET_EDONG = "FU0002"
    case SIGN_IN_WITH_NONE_WALLET = "GWEC0029"
    case SIGN_IN_WITH_NONE_WALLET_VALIDATED_OTP = "GWEC0030"
    case WALLET_INFO = "GWEC0007"
    case ECASH_RELEASE = "GWEC0005"
    case ORGANIZE_RELEASE = "GWEC0006"
    case EDONG_TO_ECASH_OWNER = "GWEC0004"
    case EDONG_TO_ECASH_OWNER_AMOUNT = "GWEC0001"
    case EDONG_TO_ECASH_RECEIVER = "GWEC0002"
    case ECASH_TO_EDONG = "GWEC0009"
    case SIGN_OUT = "GW000001"
    case RESEND_OTP = "GW000004"
    case CHANGE_PASSWORD = "GW000003"
    case DESTROY_WALLET = "GWEC0010"
    case VERIFY_TRANSACTION = "GWEC0008"
    case EXCHANGE_CASH = "GWEC0011"
    case SYNC_CONTACT = "GWEC0017"
    case SEARCH_BY_PHONE = "GWEC0016"
    case SEND_OTP = "GWEC0024"
    case UPDATED_FORGOT_PASSWORD = "GWEC0025"
    case EDIT_PROFILE = "GWEC0021"
    case UPLOAD_AVATAR = "GWEC0022"
    case DENOMINATION = "GWEC0031"
    case AddContact = "GWEC0023"
    case DeleteContact = "GWEC0038"
}

enum EnumChannelName : String {
    case MB001 = "MB001"
}

enum EnumResponseToView : String {
    case ACTIVE_SUCCESS  = "ACTIVE_SUCCESS"
    case CREATE_SUCCESS  = "CREATE_SUCCESS"
    case SIGN_IN_SUCCESS = "SIGN_IN_SUCCESS"
    case SIGN_UP_SUCCESS = "SIGN_UP_SUCCESS"
    case SIGN_OUT_SUCCESS = "SIGN_OUT_SUCCESS"
    case OTP_INVALID = "OTP_INVALID"
    case NO_LIST_AVAILABLE = "NO_LIST_AVAILABLE"
    case LIST_AVAILABLE = "LIST_AVAILABLE"
    case CLEAN_CONTROL = "CLEAN_CONTROL"
    case EDONG_TO_ECASH = "EDONG_TO_ECASH"
    case ECASH_TO_EDONG = "ECASH_TO_EDONG"
    case ECASH_TO_ECASH = "ECASH_TO_ECASH"
    case EXCHANGE_CASH = "EXCHANGE_CASH"
    case UPDATE_DATA_SOURCE = "UPDATE_DATA_SOURCE"
    case GET_DATA_SOURCE = "GET_DATA_SOURCE"

    case UPDATE_DATA_SOURCE_COLLECTION_VIEW = "UPDATE_DATA_SOURCE_COLLECTION_IVEW"
    case NO_INTERNET_CONNECTION = "NO_INTERNET_CONNECTION"
    case NO_SOCKET_CONNECTION = "NO_SOCKET_CONNECTION"
    case UPDATED_CONTACT_SUCCESSFULLY = "UPDATED_CONTACT_SUCCESSFULLY"
    case RESEND_OTP_CODE = "RESEND_OTP_CODE"
    case DELETE_ACCOUNT_SUCCESSFULLY = "DELETE_ACCOUNT_SUCCESSFULLY"
    case ECASH_AVAILABLE = "ECASH_AVAILABLE"
    case NO_ECASH = "NO_ECASH"
    case CHANGED_PASSWORD_SUCCESSFULLY = "CHANGED_PASSWORD_SUCCESSFULLY"
    case SENT_OTP_SUCCESSFULLY = "SENT_OTP_SUCCESSFULLY"
    case UPDATED_FORGOT_PASSWORD_SUCCESSFULLY = "UPDATED_FORGOT_PASSWORD_SUCCESSFULLY"
    case USER_NOT_ACTIVE = "USER_NOT_ACTIVE"
    case UPDATED_UI = "UPDATED_UI"
    case SAVED_TO_DEVICE = "SAVED_TO_DEVICE"
    case INVALID_QRCODE = "INVALID_QRCODE"
    case TRANSACTION_WAS_RECEIVED = "TRANSACTION_WAS_RECEIVED"
    case TRANSACTION_WAS_SENT_TO_ANOTHER = "TRANSACTION_WAS_SENT_TO_ANOTHER"
    case REQUEST_OTP = "REQUEST_OTP"
    case SignIn = "SIGN_IN"
    case Intro = "INTRO"
    case START = "START"
    case SKIP = "SKIP"
    case EDITED_PROFILE_SUCCESSFULLY = "EDITED_PROFILE_SUCCESSFULLY"
    case MULTIPLE_SELECTED_DONE = "MULTIPLE_SELECTED_DONE"
    case READY_TO_SUBMIT = "READY_TO_SUBMIT"
    case ACTION_GIFT = "ACTION_GIFT"
    case UPDATE_HOME_TO_LIXI = "UPDATE_HOME_TO_LIXI"
    case UPDATE_LIXI_UI = "UPDATE_LIXI_UI"
    case UPDATED_SUCCESSFULLY = "UPDATED_SUCCESSFULLY"
    case INSERTED_SUCCESSFULLY = "INSERTED_SUCCESSFULLY"
}

enum EnumPassdata : String {
    case NONE = "NONE"
    case ALERT = "ALERT"
    case SIGNUP_RESPONSE = "SIGNUP_RESPONSE"
    case ALREADY_EXISTING_USER = "ALREADY_EXISTING_USER"
    case SIGNUP_RESPONSE_SUCCESSFULLY = "SIGNUP_RESPONSE_SUCCESSFULLY"
    case NAVIGATION = "NAVIGATION"
    case TRANSACTION_RESPONSE = "TRANSACTION_RESPONSE"
    case ECASH_TO_EDONG = "ECASH_TO_EDONG"
    case ECASH_TO_ECASH = "ECASH_TO_ECASH"
    case EDONG_TO_ECASH = "EDONG_TO_ECASH"
    case SCANNER_RESULT = "SCANNER_RESULT"
    case EXCHANGE_CASH = "EXCHANGE_CASH"
    case CONTACT_ENTITIES = "CONTACT_ENTITIES"
    case TRANSACTION_LOGS_HISTORY = "TRANSACTION_LOGS_HISTORY"
    case TRANSACTION_LOGS_DETAIL = "TRANSACTION_LOGS_DETAIL"
    case DESTROY_WALLET_OPTIONS = "DESTROY_WALLET_OPTIONS"
    case OTP = "OTP"
    case UPDATED_FORGOT_PASSWORD_COMPLETED = "UPDATED_FORGOT_PASSWORD_COMPLETED"
    case GALLERY_OPTIONS = "GALLERY_OPTIONS"
    case ReceiveLixiOptions = "ReceiveLixiOptions"
}

enum EnumTransferType : String {
    case ECASH_TO_ECASH  = "CT"
    case ECASH_TO_EDONG = "ND"
    case EDONG_TO_ECASH = "NC"
    case EXCHANGE_MONEY = "DC"
    case STOPPING_SOCKET = "CF"
    case RECEIVE_SYNC_CONTACT = "DB"
    case DESTROY_WALLET = "HV"
    case LIXI = "LX"
}


enum EnumTransactionStatus : String {
    case STATUS_SUCCESS  = "1"
    case STATUS_FAIL = "0"
}

enum InputOutputType : Bool {
    case INPUT
    case OUTPUT
}

enum EnumTransactionsAction  : String {
    case INSERT_TRANSACTION_SUCCESS = "INSERT_TRANSACTION_SUCCESS"
    case INSERT_TRANSACTION_FAILED  = "INSERT_TRANSACTION_FAILED"
    case UPDATE_TRANSACTION_SUCCESS = "UPDATE_TRANSACTION_SUCCESS"
    case UPDATE_TRANSACTION_FAILED = "UPDATE_TRANSACTION_FAILED"
    
    case INSERT_CASH_LOGS_TEMPORARY_SUCCESS = "INSERT_CASH_LOGS_TEMPORARY_SUCCESS"
    case INSERT_CASH_LOGS_TEMPORARY_FAILED = "INSERT_CASH_LOGS_TEMPORARY_FAILED"
    case UPDATE_CASH_LOGS_TEMPORARY_SUCCESS = "UPDATE_CASH_LOGS_TEMPORARY_SUCCESS"
    case UPDATE_CASH_LOGS_TEMPORARY_FAILED = "UPDATE_CASH_LOGS_TEMPORARY_FAILED"
    
    case INSERT_CASH_LOGS_SUCCESS = "INSERT_CASH_LOGS_SUCCESS"
    case INSERT_CASH_LOGS_COMPLETED = "INSERT_CASH_LOGS_COMPLETED"
    case INSERT_CASH_LOGS_FAILED = "INSERT_CASH_LOGS_FAILED"
    case UPDATE_CASH_LOGS_SUCCESS = "UPDATE_CASH_LOGS_SUCCESS"
    case UPDATE_CASH_LOGS_FAILED = "UPDATE_CASH_LOGS_FAILED"
    case CASH_LOGS_EXISTING = "CASH_LOGS_EXISTING"
    
    case INSERT_CASH_INVALID_LOGS_SUCCESS = "INSERT_CASH_INVALID_LOGS_SUCCESS"
    case INSERT_CASH_INVALID_LOGS_FAILED = "INSERT_CASH_INVALID_LOGS_FAILED"
    case UPDATE_CASH_INVALID_LOGS_SUCCESS = "UPDATE_CASH_INVALID_LOGS_SUCCESS"
    case UPDATE_CASH_INVALID_LOGS_FAILED = "UPDATE_CASH_INVALID_LOGS_FAILED"
    case CASH_INVALID_LOGS_EXISTING = "CASH_INVALID_LOGS_EXISTING"
    
    case INSERT_DECISIONS_DIARY_SUCCESS = "INSERT_DECISIONS_DIARY_SUCCESS"
    case INSERT_DECISIONS_DIARY_FAILED = "INSERT_DECISIONS_DIARY_FAILED"
    case UPDATE_DECISIONS_DIARY_SUCCESS = "UPDATE_DECISIONS_DIARY_SUCCESS"
    case UPDATE_DECISIONS_DIARY_FAILED = "UPDATE_DECISIONS_DIARY_FAILED"
    
    case CASH_RELEASE_SUCCESS = "CASH_RELEASE_SUCCESS"
    case CASH_RELEASE_COMPLETE = "CASH_RELEASE_COMPLETE"
    case VERIFY_KEY_SUCCESS = "VERIFY_KEY_SUCCESS"
    case VERIFY_KEY_FAILED = "VERIFY_KEY_FAILED"
    case FINISH_TRANSACTION_SUCCESS = "FINISH_TRANSACTION_SUCCESS"
    
    case WALLET_PUBLIC_KEY_SUCCESS = "WALLET_PUBLIC_KEY_SUCCESS"
    case WALLET_PUBLIC_KEY_FAILED = "WALLET_PUBLIC_KEY_FAILED"
}

enum EnumTransactionsName : String {
    case CASH_LOGS = "CASH_LOGS"
    case CASH_INVALID_LOGS = "CASH_INVALID_LOGS"
    case CASH_LOGS_TEMPORARY = "CASH_LOGS_TEMPORARY"
    case TRANSACTIONS_LOGS = "TRANSACTIONS_LOGS"
    case DECISIONS_DIARY = "DECISIONS_DIARY"
    case CASH_RELEASE = "CASH_RELEASE"
    case VERIFY_KEY = "VERIFY_KEY"
    case FINISH_TRANSACTION = "FINISH_TRANSACTION"
    case WALLET_PUBLIC_KEY = "WALLET_PUBLIC_KEY"
}

public enum KeychainSwiftAccessOptions {
    
    /**
     
     The data in the keychain item can be accessed only while the device is unlocked by the user.
     
     This is recommended for items that need to be accessible only while the application is in the foreground. Items with this attribute migrate to a new device when using encrypted backups.
     
     This is the default value for keychain items added without explicitly setting an accessibility constant.
     
     */
    case accessibleWhenUnlocked
    
    /**
     
     The data in the keychain item can be accessed only while the device is unlocked by the user.
     
     This is recommended for items that need to be accessible only while the application is in the foreground. Items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
     
     */
    case accessibleWhenUnlockedThisDeviceOnly
    
    /**
     
     The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
     
     After the first unlock, the data remains accessible until the next restart. This is recommended for items that need to be accessed by background applications. Items with this attribute migrate to a new device when using encrypted backups.
     
     */
    case accessibleAfterFirstUnlock
    
    /**
     
     The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
     
     After the first unlock, the data remains accessible until the next restart. This is recommended for items that need to be accessed by background applications. Items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
     
     */
    case accessibleAfterFirstUnlockThisDeviceOnly
    
    /**
     
     The data in the keychain item can always be accessed regardless of whether the device is locked.
     
     This is not recommended for application use. Items with this attribute migrate to a new device when using encrypted backups.
     
     */
    case accessibleAlways
    
    /**
     
     The data in the keychain can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
     
     This is recommended for items that only need to be accessible while the application is in the foreground. Items with this attribute never migrate to a new device. After a backup is restored to a new device, these items are missing. No items can be stored in this class on devices without a passcode. Disabling the device passcode causes all items in this class to be deleted.
     
     */
    case accessibleWhenPasscodeSetThisDeviceOnly
    
    /**
     
     The data in the keychain item can always be accessed regardless of whether the device is locked.
     
     This is not recommended for application use. Items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
     
     */
    case accessibleAlwaysThisDeviceOnly
    
    static var defaultOption: KeychainSwiftAccessOptions {
        return .accessibleWhenUnlocked
    }
    
    var value: String {
        switch self {
        case .accessibleWhenUnlocked:
            return toString(kSecAttrAccessibleWhenUnlocked)
            
        case .accessibleWhenUnlockedThisDeviceOnly:
            return toString(kSecAttrAccessibleWhenUnlockedThisDeviceOnly)
            
        case .accessibleAfterFirstUnlock:
            return toString(kSecAttrAccessibleAfterFirstUnlock)
            
        case .accessibleAfterFirstUnlockThisDeviceOnly:
            return toString(kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly)
            
        case .accessibleAlways:
            return toString(kSecAttrAccessibleAlways)
            
        case .accessibleWhenPasscodeSetThisDeviceOnly:
            return toString(kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly)
            
        case .accessibleAlwaysThisDeviceOnly:
            return toString(kSecAttrAccessibleAlwaysThisDeviceOnly)
        }
    }
    
    func toString(_ value: CFString) -> String {
        return KeychainSwiftConstants.toString(value)
    }
}

