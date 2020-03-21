//
//  UIStoryboard+List.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UIStoryboard {
    @nonobjc class var main: UIStoryboard {
        return UIStoryboard(name: Storyboard.main, bundle: nil)
    }
    
    @nonobjc class var author: UIStoryboard {
        return UIStoryboard(name: Storyboard.author, bundle: nil)
    }
    
    @nonobjc class var settings: UIStoryboard {
        return UIStoryboard(name: Storyboard.settings, bundle: nil)
    }
    
    @nonobjc class var lixi: UIStoryboard {
        return UIStoryboard(name: Storyboard.lixi, bundle: nil)
    }
}
