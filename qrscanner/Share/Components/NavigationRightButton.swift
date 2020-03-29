//
//  NavigationRightButton.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class NavigationRightButton : UIButton{
  
  var width = AppConstants.DEFAULT_RIGHT_BUTTON_WIDTH
  var height = AppConstants.DEFAULT_RIGHT_BUTTON_HEIGHT
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setupView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.layer.backgroundColor = UIColor.clear.cgColor
    self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    self.setImage(UIImage(named: AppImages.IC_CHECK)?.withRenderingMode(.alwaysOriginal), for: .normal)
    NSLayoutConstraint.activate([
      self.heightAnchor.constraint(equalToConstant: CGFloat(width)),
      self.widthAnchor.constraint(equalToConstant: CGFloat(height))
      ])
  }
}
