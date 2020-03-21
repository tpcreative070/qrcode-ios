//
//  TableViewCell+Phone+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit

extension TableViewCell  {
  
    func setupLocationView(){
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
                   
                   
               ])
               
        viewRoot.addSubview(titleLbl1)
             NSLayoutConstraint.activate([
                 titleLbl1.topAnchor.constraint(equalTo: viewRoot.topAnchor, constant: 10),
                 titleLbl1.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                 titleLbl1.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
             ])
             viewRoot.addSubview(valueTxt1)
             NSLayoutConstraint.activate([
                 valueTxt1.topAnchor.constraint(equalTo: titleLbl1.bottomAnchor, constant: 0),
                 valueTxt1.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                 valueTxt1.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
             ])
           viewRoot.addSubview(titleLbl2)
                       NSLayoutConstraint.activate([
                           titleLbl2.topAnchor.constraint(equalTo: valueTxt1.bottomAnchor, constant: 10),
                           titleLbl2.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                           titleLbl2.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                       ])
                       viewRoot.addSubview(valueTxt2)
                       NSLayoutConstraint.activate([
                           valueTxt2.topAnchor.constraint(equalTo: titleLbl2.bottomAnchor, constant: 0),
                           valueTxt2.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                           valueTxt2.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                       ])
                     viewRoot.addSubview(titleLabel3)
                                           NSLayoutConstraint.activate([
                                               titleLabel3.topAnchor.constraint(equalTo: valueTxt2.bottomAnchor, constant: 10),
                                               titleLabel3.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                                               titleLabel3.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                                           ])
                                           viewRoot.addSubview(valueTxt3)
                                           NSLayoutConstraint.activate([
                                               valueTxt3.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: 0),
                                               valueTxt3.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                                               valueTxt3.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                                           ])
            self.backGroundView1.addSubview(bgView1)
                   NSLayoutConstraint.activate([
                       self.bgView1.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                       self.bgView1.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:  AppConstants.MARGIN_RIGHT),
                       self.bgView1.topAnchor.constraint(equalTo: self.valueTxt3.bottomAnchor,constant: 20),
                       
                   ])
                   

                 bgView1.addSubview(locationImg)
                 NSLayoutConstraint.activate([
                     locationImg.topAnchor.constraint(equalTo: bgView1.topAnchor, constant: 10),
                     locationImg.leadingAnchor.constraint(equalTo: bgView1.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                     self.locationImg.widthAnchor.constraint(equalToConstant: 30),
                     self.locationImg.heightAnchor.constraint(equalToConstant: 30),
                     self.locationImg.centerYAnchor.constraint(equalTo: self.bgView1.centerYAnchor)

                 ])
                 bgView1.addSubview(titleLabel4)
                 NSLayoutConstraint.activate([
                     titleLabel4.topAnchor.constraint(equalTo: bgView1.topAnchor, constant: 10),
                     titleLabel4.leadingAnchor.constraint(equalTo: locationImg.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                     titleLabel4.trailingAnchor.constraint(equalTo: bgView1.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                     self.titleLabel4.centerYAnchor.constraint(equalTo: self.bgView1.centerYAnchor)

                 ])
              
                  
                       self.backGroundView1.addSubview(clipboardView)
                       NSLayoutConstraint.activate([
                           self.clipboardView.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                           clipboardView.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
                           clipboardView.heightAnchor.constraint(equalToConstant: 50),
                           
                           self.clipboardView.topAnchor.constraint(equalTo: self.bgView1.bottomAnchor,constant: 10),
                       ])
                       
                       clipboardView.addSubview(clipboardImage)
                       NSLayoutConstraint.activate([
                           clipboardImage.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 20),
                           clipboardImage.leadingAnchor.constraint(equalTo: clipboardView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                           self.clipboardImage.widthAnchor.constraint(equalToConstant: 30),
                           self.clipboardImage.heightAnchor.constraint(equalToConstant: 30),
                           
                           
                           
                       ])
                       clipboardView.addSubview(clipboardLabel)
                       NSLayoutConstraint.activate([
                           clipboardLabel.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 10),
                           clipboardLabel.leadingAnchor.constraint(equalTo: clipboardImage.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                           clipboardLabel.trailingAnchor.constraint(equalTo: clipboardView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                           clipboardLabel.centerYAnchor.constraint(equalTo: self.clipboardView.centerYAnchor)
                           
                       ])
                       self.backGroundView1.addSubview(self.viewUnderLine)
                       NSLayoutConstraint.activate([
                           self.viewUnderLine.topAnchor.constraint(equalTo: self.clipboardView.bottomAnchor, constant: 20),
                           self.viewUnderLine.leadingAnchor.constraint(equalTo: self.backGroundView1.leadingAnchor),
                           self.viewUnderLine.trailingAnchor.constraint(equalTo: self.backGroundView1.trailingAnchor),
                           self.viewUnderLine.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor),
                           self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
                       ])
                       self.viewUnderLine.backgroundColor = .gray
                       bgView1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(locationAction(sender:))))
                       bgView1.isUserInteractionEnabled  = true
                       
                       clipboardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clipboardAction(sender:))))
                       clipboardView.isUserInteractionEnabled  = true
    }
}
