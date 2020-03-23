//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension TableViewCell {
    func setupSaveSubView(){
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
           self.viewRoot.trailingAnchor.constraint(equalTo: self.backGroundView1.trailingAnchor,constant:   -80),
           self.viewRoot.topAnchor.constraint(equalTo: self.backGroundView1.topAnchor,constant: 0),
           self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
           
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
       self.backGroundView1.addSubview(viewSub)
              NSLayoutConstraint.activate([
                  self.viewSub.leadingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: 0),
                  self.viewSub.trailingAnchor.constraint(equalTo: self.backGroundView1.trailingAnchor,constant:   0),
                  self.viewSub.topAnchor.constraint(equalTo: self.backGroundView1.topAnchor,constant: 0),
                  self.viewSub.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
                  
              ])
     
       self.viewSub.addSubview(imgIcon)
           self.imgIcon.centerYAnchor.constraint(equalTo: viewSub.centerYAnchor).isActive = true
       self.imgIcon.leadingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: 10).isActive = true
           self.imgIcon.image = UIImage(named: "ic_create")
       
       self.backGroundView1.addSubview(self.viewUnderLine)
       NSLayoutConstraint.activate([
           self.viewUnderLine.leadingAnchor.constraint(equalTo: self.backGroundView1.leadingAnchor),
           self.viewUnderLine.trailingAnchor.constraint(equalTo: self.backGroundView1.trailingAnchor),
           self.viewUnderLine.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor),
           self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
       ])
       //  self.viewUnderLine.backgroundColor = .gray
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionImgCreateViewTap(sender:)))
       imgIcon.addGestureRecognizer(tapGesture)
       imgIcon.isUserInteractionEnabled  = true
       let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap(sender:)))
            viewRoot.addGestureRecognizer(tapGestureView)
            viewRoot.isUserInteractionEnabled  = true
    let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(actionCellViewLongPress))
       self.viewRoot.addGestureRecognizer(longPressRecognizer)
    }
}

