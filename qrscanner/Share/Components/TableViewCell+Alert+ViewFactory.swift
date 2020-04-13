//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension TableViewCell {
    func setupAlertSubView(){
        
        self.viewBackground.addSubview(self.viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM)
            
        ])
        //        viewRoot.backgroundColor = .yellow
        self.viewRoot.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            self.lbTitle.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
         
            self.lbTitle.topAnchor.constraint(equalTo: self.viewRoot.topAnchor),
            self.lbTitle.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor)
            
        ])

        self.viewRoot.addSubview(viewSub)
        NSLayoutConstraint.activate([
            self.viewSub.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:   (AppConstants.MARGIN_RIGHT)),
            self.viewSub.topAnchor.constraint(equalTo: self.viewRoot.topAnchor),
            self.viewSub.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor)
            
        ])
            self.viewSub.addSubview(checkBox)
            NSLayoutConstraint.activate([
                self.checkBox.widthAnchor.constraint(equalToConstant: AppConstants.MARGIN_LEFT),
                self.checkBox.heightAnchor.constraint(equalToConstant: AppConstants.MARGIN_LEFT),
                self.checkBox.centerYAnchor.constraint(equalTo: self.viewSub.centerYAnchor),
            ])
      
       
     
    }
}

