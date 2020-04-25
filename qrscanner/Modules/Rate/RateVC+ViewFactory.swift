//
//  RateVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension RateVC {
    func initUI(){
        view.backgroundColor = .clear
        view.tintColor = .clear
       self.view.addSubview(viewBackground)
       NSLayoutConstraint.activate([
           viewBackground.topAnchor.constraint(equalTo: view.topAnchor),
           viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
       ])
       
       viewBackground.addSubview(wrapperView)
              NSLayoutConstraint.activate([
                  wrapperView.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
                  wrapperView.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
//                  wrapperView.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT_SCAN),
//                  wrapperView.rightAnchor.constraint(equalTo: viewBackground.rightAnchor * 2/3, constant: DeviceHelper.Shared.MARGIN_RIGHT_SCAN),
                wrapperView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2.5), wrapperView.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3)
                
              ])
        wrapperView.backgroundColor = .white
        wrapperView.addSubview(imgApp)
                      NSLayoutConstraint.activate([
                          imgApp.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                          imgApp.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: AppConstants.MARGIN_TOP),
                        imgApp.heightAnchor.constraint(equalToConstant: 50), imgApp.widthAnchor.constraint(equalToConstant: 50)
                        
                      ])
        imgApp.image = UIImage(named: "ic_launch")
        wrapperView.addSubview(lbContent)
                      NSLayoutConstraint.activate([
                          lbContent.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                          lbContent.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT),
                          lbContent.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT),
                          lbContent.topAnchor.constraint(equalTo: imgApp.bottomAnchor, constant: AppConstants.MARGIN_TOP)
                        
                      ])
        lbContent.text = "Tap a star to rate it on the App Store"
        lbContent.textAlignment = .center
        lbContent.numberOfLines = 0
       self.wrapperView.addSubview(self.viewUnderLine1)
             NSLayoutConstraint.activate([
                 self.viewUnderLine1.topAnchor.constraint(equalTo: self.lbContent.bottomAnchor, constant: AppConstants.MARGIN_TOP),
                 self.viewUnderLine1.leadingAnchor.constraint(equalTo: self.wrapperView.leadingAnchor),
                 self.viewUnderLine1.trailingAnchor.constraint(equalTo: self.wrapperView.trailingAnchor),
                 self.viewUnderLine1.heightAnchor.constraint(equalToConstant: 1)
             ])
             self.viewUnderLine1.backgroundColor = .lightGray
        wrapperView.addSubview(cosmosView)
      NSLayoutConstraint.activate([
          cosmosView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
//          cosmosView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT),
//          cosmosView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT),
          cosmosView.topAnchor.constraint(equalTo: viewUnderLine1.bottomAnchor, constant: 15)

      ])
        self.wrapperView.addSubview(self.viewUnderLine2)
                      NSLayoutConstraint.activate([
                          self.viewUnderLine2.topAnchor.constraint(equalTo: self.cosmosView.bottomAnchor, constant: 15),
                          self.viewUnderLine2.leadingAnchor.constraint(equalTo: self.wrapperView.leadingAnchor),
                          self.viewUnderLine2.trailingAnchor.constraint(equalTo: self.wrapperView.trailingAnchor),
                          self.viewUnderLine2.heightAnchor.constraint(equalToConstant: 1)
                      ])
                      self.viewUnderLine2.backgroundColor = .lightGray
      wrapperView.addSubview(lbNotNow)
                      NSLayoutConstraint.activate([
                          lbNotNow.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                          lbNotNow.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT),
                          lbNotNow.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT),
                          lbNotNow.topAnchor.constraint(equalTo: viewUnderLine2.bottomAnchor, constant: AppConstants.MARGIN_TOP)
                        
                      ])
        lbNotNow.text = "Not Now"
        lbNotNow.textAlignment = .center
    }
}
