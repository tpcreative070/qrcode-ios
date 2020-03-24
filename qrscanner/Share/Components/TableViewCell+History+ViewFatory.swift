//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UIStackView {
    func addBackground(color: UIColor) {
        let bglayer = CAShapeLayer()
        self.layer.insertSublayer(bglayer, at: 0)
        bglayer.path = UIBezierPath(rect: self.bounds).cgPath
        bglayer.fillColor = color.cgColor
    }
}
extension TableViewCell {
    func setupHistorySubView(){
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
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant:   -80),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor,constant: 0),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor,constant: -0)
            
        ])
        self.viewRoot.addSubview(lbCreatedDate)
        NSLayoutConstraint.activate([
            self.lbCreatedDate.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbCreatedDate.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:   0),
            self.lbCreatedDate.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: 0),
            
        ])
        self.viewRoot.addSubview(lbContent)
               NSLayoutConstraint.activate([
                   self.lbContent.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.lbContent.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:   0),
                   self.lbContent.topAnchor.constraint(equalTo: self.lbCreatedDate.bottomAnchor,constant: 10),
                   self.lbContent.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: -0)
                   
               ])
        self.viewBackgroundSecond.addSubview(viewSub)
               NSLayoutConstraint.activate([
                   self.viewSub.leadingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: 0),
                   self.viewSub.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant:   0),
                   self.viewSub.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor,constant: 0),
                   self.viewSub.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor,constant: -0)
                   
               ])
      
        self.viewSub.addSubview(imgIcon)
            self.imgIcon.centerYAnchor.constraint(equalTo: viewSub.centerYAnchor).isActive = true
        self.imgIcon.leadingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: 10).isActive = true
        self.imgIcon.image = UIImage(named: AppImages.IC_SHARE)
        
        self.viewBackgroundSecond.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        //  self.viewUnderLine.backgroundColor = .gray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionImageViewTap(sender:)))
        imgIcon.addGestureRecognizer(tapGesture)
        imgIcon.isUserInteractionEnabled  = true
        let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap(sender:)))
             viewRoot.addGestureRecognizer(tapGestureView)
             viewRoot.isUserInteractionEnabled  = true
     let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(actionCellViewLongPress))
        self.viewRoot.addGestureRecognizer(longPressRecognizer)
    }
}

