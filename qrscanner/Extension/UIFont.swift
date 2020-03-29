//
//  UIFont.swift
//  qrscanner
//
//  Created by Mac10 on 3/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
extension UIFont {

    static func availableFonts() {

        // Get all fonts families
        for family in UIFont.familyNames {
            NSLog("\(family)")

            // Show all fonts for any given family
            for name in UIFont.fontNames(forFamilyName: family) {
                NSLog("   \(name)")
            }
        }
    }
}
