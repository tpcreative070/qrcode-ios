//
//  TextView.swift
//  qrscanner
//
//  Created by Mac10 on 3/27/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class TextView: UITextView {
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    self.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.TEXTFIELD_TITLE_FONT_SIZE)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
