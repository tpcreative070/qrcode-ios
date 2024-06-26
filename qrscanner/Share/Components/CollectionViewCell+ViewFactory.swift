//
//  CollectionViewCell+ViewFactory.swift
//  vietlifetravel
//
//  Created by phong070 on 7/12/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import UIKit
extension CollectionViewCell {
    
    func setupView(){
        self.setupBackgroud()
        switch CollectionViewCell.identifier {
        case .ChangeColor:
            setupSubView()
            break
        default :
            break
        }
    }
    
    func setupBackgroud(){
        self.addSubview(self.backGroundView)
        NSLayoutConstraint.activate([
            self.backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.DEFAULT_CONSTRAINT),
            self.backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.DEFAULT_CONSTRAINT),
            self.backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.DEFAULT_CONSTRAINT),
            self.backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: AppConstants.DEFAULT_CONSTRAINT)
            ])
        backGroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (IndexTapped(sender:))))
    }

    func setupSubView(){
     
       self.backGroundView.addSubview(imgIcon)
        NSLayoutConstraint.activate([
           self.imgIcon.centerXAnchor.constraint(equalTo: self.backGroundView.centerXAnchor),
           self.imgIcon.centerYAnchor.constraint(equalTo: self.backGroundView.centerYAnchor),
           self.imgIcon.widthAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_COLOR),
           self.imgIcon.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_COLOR),
        ])
      
    
    }

}
