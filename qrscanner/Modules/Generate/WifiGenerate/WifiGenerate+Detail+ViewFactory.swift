//
//  WifiGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension WifiGenerateVC {
    func detailUI() {
        view.backgroundColor = .white
     
        let value_item = view.frame.height/7
          
        view.addSubview(ssidBg)
               NSLayoutConstraint.activate([
                ssidBg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                            ssidBg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                            ssidBg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                       ssidBg.heightAnchor.constraint(equalToConstant: value_item)
                        ])
        
        ssidBg.addSubview(ssidLbL)
            NSLayoutConstraint.activate([
                ssidLbL.topAnchor.constraint(equalTo: ssidBg.topAnchor, constant: 10),
                ssidLbL.leadingAnchor.constraint(equalTo: ssidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                ssidLbL.trailingAnchor.constraint(equalTo: ssidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            ssidBg.addSubview(ssidTxt)
            NSLayoutConstraint.activate([
                ssidTxt.topAnchor.constraint(equalTo: ssidLbL.bottomAnchor, constant: 5),
                ssidTxt.leadingAnchor.constraint(equalTo: ssidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                ssidTxt.trailingAnchor.constraint(equalTo: ssidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
        view.addSubview(passBg)
        NSLayoutConstraint.activate([
            passBg.topAnchor.constraint(equalTo: ssidBg.bottomAnchor, constant: 10),
                     passBg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                     passBg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                passBg.heightAnchor.constraint(equalToConstant: value_item)
                 ])
        passBg.addSubview(passLbL)
           NSLayoutConstraint.activate([
               passLbL.topAnchor.constraint(equalTo: passBg.topAnchor, constant: 10),
               passLbL.leadingAnchor.constraint(equalTo: passBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               passLbL.trailingAnchor.constraint(equalTo: passBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])
           passBg.addSubview(passTxt)
           NSLayoutConstraint.activate([
               passTxt.topAnchor.constraint(equalTo: passLbL.bottomAnchor, constant: 5),
               passTxt.leadingAnchor.constraint(equalTo: passBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               passTxt.trailingAnchor.constraint(equalTo: passBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])

        
        view.addSubview(networkBg)
              NSLayoutConstraint.activate([
                  networkBg.topAnchor.constraint(equalTo: passBg.bottomAnchor, constant: 10),
                           networkBg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                           networkBg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                           networkBg.heightAnchor.constraint(equalToConstant: value_item)
                       ])
     networkBg.addSubview(networkLbL)
               NSLayoutConstraint.activate([
                   networkLbL.topAnchor.constraint(equalTo: networkBg.topAnchor, constant: 10),
                   networkLbL.leadingAnchor.constraint(equalTo: networkBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                   networkLbL.trailingAnchor.constraint(equalTo: networkBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
               ])
               networkBg.addSubview(networkTxt)
               NSLayoutConstraint.activate([
                   networkTxt.topAnchor.constraint(equalTo: networkLbL.bottomAnchor, constant: 5),
                   networkTxt.leadingAnchor.constraint(equalTo: networkBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                   networkTxt.trailingAnchor.constraint(equalTo: networkBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
               ])
        view.addSubview(protectBg)
                     NSLayoutConstraint.activate([
                         protectBg.topAnchor.constraint(equalTo: networkBg.bottomAnchor, constant: 10),
                                  protectBg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                                  protectBg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                                  protectBg.heightAnchor.constraint(equalToConstant: value_item)
                              ])
            protectBg.addSubview(hiddenLbL)
                      NSLayoutConstraint.activate([
                          hiddenLbL.topAnchor.constraint(equalTo: protectBg.topAnchor, constant: 10),
                          hiddenLbL.leadingAnchor.constraint(equalTo: protectBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                          hiddenLbL.trailingAnchor.constraint(equalTo: protectBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                      ])
                      protectBg.addSubview(hidenTxt)
                      NSLayoutConstraint.activate([
                          hidenTxt.topAnchor.constraint(equalTo: hiddenLbL.bottomAnchor, constant: 5),
                          hidenTxt.leadingAnchor.constraint(equalTo: protectBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                          hidenTxt.trailingAnchor.constraint(equalTo: protectBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                      ])
                      self.view.addSubview(wifiView)
                      NSLayoutConstraint.activate([
                          self.wifiView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                          wifiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                          wifiView.heightAnchor.constraint(equalToConstant: 50),
                          
                          self.wifiView.topAnchor.constraint(equalTo: self.protectBg.bottomAnchor,constant: 20),
                          
                      ])
                      
                      wifiView.addSubview(wifiImg)
                      NSLayoutConstraint.activate([
                          wifiImg.topAnchor.constraint(equalTo: wifiView.topAnchor, constant: 10),
                          wifiImg.leadingAnchor.constraint(equalTo: wifiView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                          
                      ])
                      wifiView.addSubview(wifiLabel)
                      NSLayoutConstraint.activate([
                          wifiLabel.topAnchor.constraint(equalTo: wifiView.topAnchor, constant: 10),
                          wifiLabel.leadingAnchor.constraint(equalTo: wifiView.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                          wifiLabel.trailingAnchor.constraint(equalTo: wifiView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                      ])
                      self.view.addSubview(clipboardView)
                      NSLayoutConstraint.activate([
                          self.clipboardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                          clipboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                          clipboardView.heightAnchor.constraint(equalToConstant: 50),
                          
                          self.clipboardView.topAnchor.constraint(equalTo: self.wifiView.bottomAnchor,constant: 20),
                          
                      ])
                      
                      clipboardView.addSubview(clipboardImage)
                      NSLayoutConstraint.activate([
                          clipboardImage.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 10),
                          clipboardImage.leadingAnchor.constraint(equalTo: clipboardView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                          
                      ])
                      clipboardView.addSubview(clipboardLabel)
                      NSLayoutConstraint.activate([
                          clipboardLabel.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 10),
                          clipboardLabel.leadingAnchor.constraint(equalTo: clipboardImage.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                          clipboardLabel.trailingAnchor.constraint(equalTo: clipboardView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                      ])
//            addTarget(ssidTxt)
//            addTarget(passTxt)
        
        
    }
   
 
}
