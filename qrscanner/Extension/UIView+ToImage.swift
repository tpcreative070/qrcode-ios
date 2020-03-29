//
//  UIView+ToImage.swift
//  qrscanner
//
//  Created by Mac10 on 3/27/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)

        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
