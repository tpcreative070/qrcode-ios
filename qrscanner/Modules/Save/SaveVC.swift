//
//  SaveVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class SaveVC : BaseViewController {
     lazy var lbTest : UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          self.view.backgroundColor = .white
          self.view.addSubview(lbTest)
          NSLayoutConstraint.activate([
              self.lbTest.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
              self.lbTest.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
          ])
          self.lbTest.text = "Save"
      }
}
