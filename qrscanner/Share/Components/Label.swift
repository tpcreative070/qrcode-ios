//
//  Label.swift
//  qrscanner
//
//  Created by Mac10 on 3/8/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class Label : UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  func setupView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.textAlignment = .left
    self.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.TEXTFIELD_TITLE_FONT_SIZE)
    self.textColor = AppColors.BLACK_COLOR
  }
}
