//
//  Extension.swift
//  Collec
//
//  Created by Mac10 on 4/2/20.
//  Copyright © 2020 Mac10. All rights reserved.
//

import UIKit
extension UIView{
    func setCellShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
    }
    func setAnchor(top : NSLayoutYAxisAnchor?, left :NSLayoutXAxisAnchor?, bottom:NSLayoutYAxisAnchor?, right : NSLayoutXAxisAnchor?,paddingTop: CGFloat , paddingLeft:CGFloat ,paddingBottom:CGFloat , paddingRight: CGFloat, width : CGFloat = 0, height : CGFloat = 0){

        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if  width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if  height != 0 {
                   self.widthAnchor.constraint(equalToConstant: width).isActive = true
               }
    }
}
