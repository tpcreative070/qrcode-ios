//
//  TableViewCell+Wifi+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import Foundation
import UIKit

extension TableViewCell  {
    
    func setupWifiView(){
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
            
            
        ])
        
        viewRoot.addSubview(lbTitleFirst)
        NSLayoutConstraint.activate([
            lbTitleFirst.topAnchor.constraint(equalTo: viewRoot.topAnchor, constant: 10),
            lbTitleFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(textFieldValueFirst)
        NSLayoutConstraint.activate([
            textFieldValueFirst.topAnchor.constraint(equalTo: lbTitleFirst.bottomAnchor, constant: 0),
            textFieldValueFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(lbTitleSecond)
        NSLayoutConstraint.activate([
            lbTitleSecond.topAnchor.constraint(equalTo: textFieldValueFirst.bottomAnchor, constant: 10),
            lbTitleSecond.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleSecond.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(textFieldValueSecond)
        NSLayoutConstraint.activate([
            textFieldValueSecond.topAnchor.constraint(equalTo: lbTitleSecond.bottomAnchor, constant: 0),
            textFieldValueSecond.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueSecond.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(lbTitleThird)
        NSLayoutConstraint.activate([
            lbTitleThird.topAnchor.constraint(equalTo: textFieldValueSecond.bottomAnchor, constant: 10),
            lbTitleThird.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleThird.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(textFieldValueThird)
        NSLayoutConstraint.activate([
            textFieldValueThird.topAnchor.constraint(equalTo: lbTitleThird.bottomAnchor, constant: 0),
            textFieldValueThird.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueThird.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(lbTitleFour)
        NSLayoutConstraint.activate([
            lbTitleFour.topAnchor.constraint(equalTo: textFieldValueThird.bottomAnchor, constant: 10),
            lbTitleFour.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleFour.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(textFieldValueFour)
        NSLayoutConstraint.activate([
            textFieldValueFour.topAnchor.constraint(equalTo: lbTitleFour.bottomAnchor, constant: 0),
            textFieldValueFour.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueFour.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.viewBackgroundSecond.addSubview(viewBackgroundThird)
        NSLayoutConstraint.activate([
            self.viewBackgroundThird.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundThird.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:  AppConstants.MARGIN_RIGHT),
            self.viewBackgroundThird.topAnchor.constraint(equalTo: self.textFieldValueFour.bottomAnchor,constant: 20),
            
        ])
        
        viewBackgroundThird.addSubview(imgWifi)
        NSLayoutConstraint.activate([
            imgWifi.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: 10),
            imgWifi.leadingAnchor.constraint(equalTo: viewBackgroundThird.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgWifi.widthAnchor.constraint(equalToConstant: 30),
            self.imgWifi.heightAnchor.constraint(equalToConstant: 30),
            self.imgWifi.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        viewBackgroundThird.addSubview(lbTitleFive)
        NSLayoutConstraint.activate([
            lbTitleFive.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: 10),
            lbTitleFive.leadingAnchor.constraint(equalTo: imgWifi.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleFive.trailingAnchor.constraint(equalTo: viewBackgroundThird.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleFive.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        
        self.viewBackgroundSecond.addSubview(viewClipboard)
        NSLayoutConstraint.activate([
            self.viewClipboard.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            viewClipboard.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewClipboard.heightAnchor.constraint(equalToConstant: 50),
            
            self.viewClipboard.topAnchor.constraint(equalTo: self.viewBackgroundThird.bottomAnchor,constant: 10),
        ])
        
        viewClipboard.addSubview(imgClipboard)
        NSLayoutConstraint.activate([
            imgClipboard.topAnchor.constraint(equalTo: viewClipboard.topAnchor, constant: 20),
            imgClipboard.leadingAnchor.constraint(equalTo: viewClipboard.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgClipboard.widthAnchor.constraint(equalToConstant: 30),
            self.imgClipboard.heightAnchor.constraint(equalToConstant: 30),
            
            
            
        ])
        viewClipboard.addSubview(lbClipboard)
        NSLayoutConstraint.activate([
            lbClipboard.topAnchor.constraint(equalTo: viewClipboard.topAnchor, constant: 10),
            lbClipboard.leadingAnchor.constraint(equalTo: imgClipboard.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbClipboard.trailingAnchor.constraint(equalTo: viewClipboard.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            lbClipboard.centerYAnchor.constraint(equalTo: self.viewClipboard.centerYAnchor)
            
        ])
        self.viewBackgroundSecond.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.topAnchor.constraint(equalTo: self.viewClipboard.bottomAnchor, constant: 20),
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLine.backgroundColor = .gray
        viewBackgroundThird.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wifiAction(sender:))))
        viewBackgroundThird.isUserInteractionEnabled  = true
        
        viewClipboard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clipboardAction(sender:))))
        viewClipboard.isUserInteractionEnabled  = true
    }
}
