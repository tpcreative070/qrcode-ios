//
//  DeviceHelper.swift
//  screenrecorder
//
//  Created by phong070 on 2/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class DeviceHelper {
    
    /**
     This function check current device is Iphone SE, Iphone 5, Iphone 5s
     */
    static func isSmallScreen() -> Bool {
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            return true
        default:
            return false
        }
    }
    
    /**
     This function check current device is Iphone SE, Iphone 5, Iphone 5s
     */
    static func isNormalScreen() -> Bool {
        switch UIDevice().type {
        case .iPhone6, .iPhone7, .iPhone8, .iPhone6S:
            return true
        default:
            return false
        }
    }
    
    /**
     This function check current device is Iphone 6 plus, Iphone 7 plus, Iphone 8 plus, Iphone XR, Iphone XS
     */
    static func isPlusScreen() -> Bool {
        switch UIDevice().type {
        case .iPhone6plus, .iPhone7plus, .iPhone8plus, .iPhone6Splus, .iPhoneX:
            return true
        default:
            return false
        }
    }
    
    /**
     This function check current device is Iphone XSMAX
     */
    static func isMaxScreen() -> Bool {
        switch UIDevice().type {
        case  .iPhoneXS, .iPhoneX:
            return true
        default:
            return false
        }
    }
    
    static func isXSmax() -> Bool {
        switch UIDevice().type {
        case .iPhoneXSmax, .iPhoneXR:
            return true
        default:
            return false
        }
    }
    
    /**
     This function check current device is IPad 2...4
     */
    static func isIpad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }
    
    /**
     Check hasNotch Xr
     */
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    
    /**
     Fetch device's info
     */
    static func getDeviceInfo() -> String{
        let device = UIDevice.current
        return device.type.rawValue
    }
    
    /**
     Fetch device's unique id
     */
    static func getUniqueId() ->String{
        let device = UIDevice.current
        return device.currentUUID()
    }
    struct Shared {
        static var MARGIN_LEFT : CGFloat = CGFloat()
        static var MARGIN_LEFT_SCAN : CGFloat = CGFloat()
        static var MARGIN_BOTTOM_SCAN : CGFloat = CGFloat()
        
        static var MARGIN_RIGHT : CGFloat = CGFloat()
        static var MARGIN_RIGHT_SCAN : CGFloat = CGFloat()
        
        static var HEIGHT_BACKGROUND_ITEM : CGFloat = CGFloat()
        static var HEIGHT_BACKGROUND : CGFloat = CGFloat()
        static var HEIGHT_IMAGE_SETTING : CGFloat = CGFloat()
        static var HEIGHT_LABLE : CGFloat = CGFloat()
        static var HEIGHT_BACKGROUND_BAR : CGFloat = CGFloat()
        static var HEIGHT_BACKGROUND_ITEM_BAR : CGFloat = CGFloat()
        static var HEIGHT_BGDROPDOWN : CGFloat = CGFloat()
        static var ICON_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var ICON_CROWN_HEIGHT : CGFloat = CGFloat()
        static var ICON_SCAN_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var MARGIN_LEFT_ICON : CGFloat = CGFloat()
        static var MARGIN_RIGHT_ICON : CGFloat = CGFloat()
        static var SWITCH_HEIGHT_DEFAULT : CGFloat = CGFloat()
        static var SWITCH_WIDTH_DEFAULT : CGFloat = CGFloat()
        static var LABEL_TITLE_FONT_SIZE : CGFloat = CGFloat()
        static var LABEL_TITLE_FONT_SIZE_HELP : CGFloat = CGFloat()
        static var LABEL_FONT_SIZE : CGFloat = CGFloat()
        static var CONTENT_FONT_SIZE : CGFloat = CGFloat()
        static var HEIGHT_IMAGE_HELP : CGFloat = CGFloat()
        static var CHECKBOX_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var TEXTFIELD_TITLE_FONT_SIZE : CGFloat = CGFloat()
        static var ICON_SWIPE : CGFloat = CGFloat()
        static var IMAGE_QR_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var ICON_QR_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var SCAN_WIDTH_HEIGHT : CGFloat = CGFloat()
        static var HEIGHT_Y : CGFloat = CGFloat()
        static var SPACING_NAV : CGFloat = CGFloat()

        func isIpad() -> Bool {
            if UIDevice.current.userInterfaceIdiom == .pad {
                return true
            } else {
                return false
            }
        }
        func moderateScale(fontName: String = AppFonts.SFranciscoRegular, size: CGFloat = AppFonts.LABEL_FONT_SIZE, factor: CGFloat = 1)->UIFont{
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
        init() {
            if isIpad(){
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM = CGFloat(100)
                DeviceHelper.Shared.HEIGHT_BACKGROUND = CGFloat(140)
                DeviceHelper.Shared.HEIGHT_IMAGE_SETTING = CGFloat(60)
                DeviceHelper.Shared.HEIGHT_LABLE = CGFloat(20)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_BAR = CGFloat(200)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM_BAR = CGFloat(160)
                DeviceHelper.Shared.HEIGHT_BGDROPDOWN = CGFloat(160)
                DeviceHelper.Shared.ICON_WIDTH_HEIGHT = CGFloat(37)
                DeviceHelper.Shared.ICON_CROWN_HEIGHT = CGFloat(42)
                DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT = CGFloat(40)
                DeviceHelper.Shared.MARGIN_LEFT_ICON = CGFloat(50)
                DeviceHelper.Shared.MARGIN_RIGHT_ICON = CGFloat(-50)
                DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT = CGFloat(20)
                DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT = CGFloat(50)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE = CGFloat(20)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP = CGFloat(22)
                DeviceHelper.Shared.LABEL_FONT_SIZE = CGFloat(18)
                DeviceHelper.Shared.CONTENT_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.HEIGHT_IMAGE_HELP = CGFloat(250)
                DeviceHelper.Shared.CHECKBOX_WIDTH_HEIGHT = CGFloat(25)
                DeviceHelper.Shared.TEXTFIELD_TITLE_FONT_SIZE = CGFloat(18)
                DeviceHelper.Shared.ICON_SWIPE = CGFloat(35)
                DeviceHelper.Shared.IMAGE_QR_WIDTH_HEIGHT = CGFloat(150)
                DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT = CGFloat(300)
                DeviceHelper.Shared.MARGIN_LEFT_SCAN = CGFloat(35)
                DeviceHelper.Shared.MARGIN_RIGHT_SCAN = CGFloat(-35)
                DeviceHelper.Shared.MARGIN_BOTTOM_SCAN = CGFloat(-35)
                DeviceHelper.Shared.HEIGHT_Y = CGFloat(50)
                DeviceHelper.Shared.SPACING_NAV = CGFloat(30)

            }
                
            else if isNormalScreen (){
                DeviceHelper.Shared.MARGIN_LEFT = CGFloat(20)
                DeviceHelper.Shared.MARGIN_RIGHT = CGFloat(-20)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM = CGFloat(90)
                DeviceHelper.Shared.HEIGHT_BACKGROUND = CGFloat(130)
                DeviceHelper.Shared.HEIGHT_IMAGE_SETTING = CGFloat(50)
                DeviceHelper.Shared.HEIGHT_LABLE = CGFloat(18)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_BAR = CGFloat(178)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM_BAR = CGFloat(140)
                DeviceHelper.Shared.HEIGHT_BGDROPDOWN = CGFloat(160)
                DeviceHelper.Shared.ICON_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.ICON_CROWN_HEIGHT = CGFloat(37)
                DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.MARGIN_LEFT_ICON = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_ICON = CGFloat(-30)
                DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT = CGFloat(18)
                DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT = CGFloat(45)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE = CGFloat(18)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP = CGFloat(20)
                DeviceHelper.Shared.LABEL_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.CONTENT_FONT_SIZE = CGFloat(14)
                DeviceHelper.Shared.HEIGHT_IMAGE_HELP = CGFloat(250)
                DeviceHelper.Shared.CHECKBOX_WIDTH_HEIGHT = CGFloat(20)
                DeviceHelper.Shared.TEXTFIELD_TITLE_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.ICON_SWIPE = CGFloat(25)
                DeviceHelper.Shared.IMAGE_QR_WIDTH_HEIGHT = CGFloat(120)
                DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT = CGFloat(250)
                DeviceHelper.Shared.MARGIN_LEFT_SCAN = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_SCAN = CGFloat(-30)
                DeviceHelper.Shared.MARGIN_BOTTOM_SCAN = CGFloat(-45)
                DeviceHelper.Shared.HEIGHT_Y = CGFloat(40)
                DeviceHelper.Shared.SPACING_NAV = CGFloat(20)

            }
            else if isMaxScreen(){
                
                DeviceHelper.Shared.MARGIN_LEFT = CGFloat(20)
                DeviceHelper.Shared.MARGIN_RIGHT = CGFloat(-20)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM = CGFloat(90)
                DeviceHelper.Shared.HEIGHT_BACKGROUND = CGFloat(130)
                DeviceHelper.Shared.HEIGHT_IMAGE_SETTING = CGFloat(50)
                DeviceHelper.Shared.HEIGHT_LABLE = CGFloat(18)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_BAR = CGFloat(178)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM_BAR = CGFloat(140)
                DeviceHelper.Shared.HEIGHT_BGDROPDOWN = CGFloat(160)
                DeviceHelper.Shared.ICON_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.ICON_CROWN_HEIGHT = CGFloat(37)
                DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.MARGIN_LEFT_ICON = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_ICON = CGFloat(-30)
                DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT = CGFloat(18)
                DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT = CGFloat(45)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE = CGFloat(18)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP = CGFloat(20)
                DeviceHelper.Shared.LABEL_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.CONTENT_FONT_SIZE = CGFloat(14)
                DeviceHelper.Shared.HEIGHT_IMAGE_HELP = CGFloat(250)
                DeviceHelper.Shared.CHECKBOX_WIDTH_HEIGHT = CGFloat(20)
                DeviceHelper.Shared.TEXTFIELD_TITLE_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.ICON_SWIPE = CGFloat(25)
                DeviceHelper.Shared.IMAGE_QR_WIDTH_HEIGHT = CGFloat(120)
                DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT = CGFloat(250)
                DeviceHelper.Shared.MARGIN_LEFT_SCAN = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_SCAN = CGFloat(-30)
                DeviceHelper.Shared.MARGIN_BOTTOM_SCAN = CGFloat(-45)
                DeviceHelper.Shared.HEIGHT_Y = CGFloat(50)
                DeviceHelper.Shared.SPACING_NAV = CGFloat(20)

            }
            else {
                DeviceHelper.Shared.MARGIN_LEFT = CGFloat(20)
                DeviceHelper.Shared.MARGIN_RIGHT = CGFloat(-20)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM = CGFloat(90)
                DeviceHelper.Shared.HEIGHT_BACKGROUND = CGFloat(130)
                DeviceHelper.Shared.HEIGHT_IMAGE_SETTING = CGFloat(50)
                DeviceHelper.Shared.HEIGHT_LABLE = CGFloat(18)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_BAR = CGFloat(178)
                DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM_BAR = CGFloat(140)
                DeviceHelper.Shared.HEIGHT_BGDROPDOWN = CGFloat(160)
                DeviceHelper.Shared.ICON_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.ICON_CROWN_HEIGHT = CGFloat(37)
                DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT = CGFloat(30)
                DeviceHelper.Shared.MARGIN_LEFT_ICON = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_ICON = CGFloat(-30)
                DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT = CGFloat(18)
                DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT = CGFloat(45)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE = CGFloat(18)
                DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP = CGFloat(20)
                DeviceHelper.Shared.LABEL_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.CONTENT_FONT_SIZE = CGFloat(14)
                DeviceHelper.Shared.HEIGHT_IMAGE_HELP = CGFloat(250)
                DeviceHelper.Shared.CHECKBOX_WIDTH_HEIGHT = CGFloat(20)
                DeviceHelper.Shared.TEXTFIELD_TITLE_FONT_SIZE = CGFloat(16)
                DeviceHelper.Shared.ICON_SWIPE = CGFloat(25)
                DeviceHelper.Shared.IMAGE_QR_WIDTH_HEIGHT = CGFloat(120)
                DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT = CGFloat(250)
                DeviceHelper.Shared.MARGIN_LEFT_SCAN = CGFloat(30)
                DeviceHelper.Shared.MARGIN_RIGHT_SCAN = CGFloat(-30)
                DeviceHelper.Shared.MARGIN_BOTTOM_SCAN = CGFloat(-45)
                DeviceHelper.Shared.HEIGHT_Y = CGFloat(50)
                DeviceHelper.Shared.SPACING_NAV = CGFloat(20)

            }
           
        }
        
    }
}
