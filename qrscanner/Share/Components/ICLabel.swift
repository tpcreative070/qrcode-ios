//
//  ICLabel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class ICLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    func setupView() {
        self.textAlignment = .left
        self.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textColor = .label
    }
    
    var isBold : Bool! {
        didSet{
            if isBold {
                
                self.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.TEXTFIELD_TITLE_FONT_SIZE)
            }
        }
    }
}
