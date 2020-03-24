//
//  TableViewCell+Url+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit

extension TableViewCell  {
    
    func setupContentView(){
        self.addSubview(self.viewBackgroundSecond)
        NSLayoutConstraint.activate([
            self.viewBackgroundSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:10),
            self.viewBackgroundSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.viewBackgroundSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.viewBackgroundSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
        self.viewBackgroundSecond.addSubview(viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant:   AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor,constant: 0),
            //   self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
            
        ])
      
    }
    
}

