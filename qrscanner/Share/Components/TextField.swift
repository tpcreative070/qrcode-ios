//
//  TextField.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TextField: UITextField {
  
  let padding = UIEdgeInsets(top: 0, left: AppConstants.FLOAT_LABEL_MARGIN_LEFT, bottom: 0, right: 0)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                    attributes: [NSAttributedString.Key.foregroundColor: AppColors.GREY2_COLOR])
    return bounds.inset(by: padding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}

