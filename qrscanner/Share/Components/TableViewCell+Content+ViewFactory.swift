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
        self.addSubview(self.backGroundView1)
        NSLayoutConstraint.activate([
            self.backGroundView1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:10),
            self.backGroundView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.backGroundView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.backGroundView1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
        self.backGroundView1.addSubview(viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.backGroundView1.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.backGroundView1.trailingAnchor,constant:   AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.backGroundView1.topAnchor,constant: 0),
            //   self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
            
        ])
      
    }
    
}

