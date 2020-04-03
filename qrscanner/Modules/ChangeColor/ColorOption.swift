//
//  GenerateOption.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

enum ColorOption: Int, CustomStringConvertible {
    
    case Black
    case Blue
    case DarkGreen
    case Pink
    case LightPurple
    case Purple
    case Indigo
    case BlackGreen
    case Cyan
    case MossGreen
    case Orange
    case Brown
    
    var name: String {
        switch self {
        case .Black: return ColorString.Black.rawValue
        case .Blue: return ColorString.Blue.rawValue
        case .DarkGreen: return ColorString.DarkGreen.rawValue
        case .Pink: return ColorString.Pink.rawValue
        case .LightPurple: return ColorString.LightPurple.rawValue
        case .Purple: return ColorString.Purple.rawValue
        case .Indigo: return ColorString.Indigo.rawValue
        case .BlackGreen: return ColorString.BlackGreen.rawValue
        case .Cyan: return ColorString.Cyan.rawValue
        case .MossGreen: return ColorString.MossGreen.rawValue
        case .Orange: return ColorString.Orange.rawValue
        case .Brown: return ColorString.Brown.rawValue
        }
    }
    var description: String {
        switch self {
        case .Black: return ColorString.Black.rawValue
        case .Blue: return ColorString.Blue.rawValue
        case .DarkGreen: return ColorString.DarkGreen.rawValue
        case .Pink: return ColorString.Pink.rawValue
        case .LightPurple: return ColorString.LightPurple.rawValue
        case .Purple: return ColorString.Purple.rawValue
        case .Indigo: return ColorString.Indigo.rawValue
        case .BlackGreen: return ColorString.BlackGreen.rawValue
        case .Cyan: return ColorString.Cyan.rawValue
        case .MossGreen: return ColorString.MossGreen.rawValue
        case .Orange: return ColorString.Orange.rawValue
        case .Brown: return ColorString.Brown.rawValue
        }
    }
    var colorImage: UIColor {
        switch self {
        case .Black: return AppColors.BLACK_COLOR
        case .Blue: return AppColors.BLUE
        case .DarkGreen: return AppColors.DARK_GREEN_COLOR
        case .Pink: return AppColors.PINK_COLOR
        case .LightPurple: return AppColors.LIGHT_PURPLE_COLOR
        case .Purple: return AppColors.PURPLE_COLOR
        case .Indigo: return AppColors.INDIGO_COLOR
        case .BlackGreen: return AppColors.BLACK_GREEN_COLOR
        case .Cyan: return AppColors.CYAN_COLOR
        case .MossGreen: return AppColors.MOSS_GREEN_COLOR
        case .Orange: return AppColors.ORANGE_IN_COLOR
        case .Brown: return AppColors.BROWN_COLOR
        }
    }
}
