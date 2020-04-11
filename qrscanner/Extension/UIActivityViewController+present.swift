//
//  UIActivityViewController+present.swift
//  qrscanner
//
//  Created by Mac10 on 4/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UIActivityViewController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("height >= 22.5") || constraint.debugDescription.contains("height == 52") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
