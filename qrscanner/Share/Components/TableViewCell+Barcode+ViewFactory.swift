//
//  TableViewCell+Message+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/18/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import Foundation
import UIKit

extension TableViewCell  {
    
    func setupBarcodeView(){
        self.addSubview(self.viewBackgroundSecond)
        NSLayoutConstraint.activate([
            self.viewBackgroundSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBackgroundSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBackgroundSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.MARGIN_TOP),
            self.viewBackgroundSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.viewBackgroundSecond.addSubview(viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant:   AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor),
            
        ])
        viewRoot.addSubview(lbTitleFirst)
        NSLayoutConstraint.activate([
            lbTitleFirst.topAnchor.constraint(equalTo: viewRoot.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbTitleFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(textFieldValueFirst)
        NSLayoutConstraint.activate([
            textFieldValueFirst.topAnchor.constraint(equalTo: lbTitleFirst.bottomAnchor),
            textFieldValueFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
       
        viewRoot.addSubview(textFieldValueSecond)
        NSLayoutConstraint.activate([
            textFieldValueSecond.topAnchor.constraint(equalTo: textFieldValueFirst.bottomAnchor),
            textFieldValueSecond.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldValueSecond.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        self.viewBackgroundSecond.addSubview(viewBackgroundThird)
        NSLayoutConstraint.activate([
            self.viewBackgroundThird.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundThird.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:  AppConstants.MARGIN_RIGHT),
            self.viewBackgroundThird.topAnchor.constraint(equalTo: self.textFieldValueSecond.bottomAnchor,constant: AppConstants.MARGIN_TOP),
            
        ])
        
        
        viewBackgroundThird.addSubview(imgSearch)
        NSLayoutConstraint.activate([
            imgSearch.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: AppConstants.MARGIN_TOP),
            imgSearch.leadingAnchor.constraint(equalTo: viewBackgroundThird.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgSearch.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgSearch.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgSearch.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        viewBackgroundThird.addSubview(lbTitleThird)
        NSLayoutConstraint.activate([
            lbTitleThird.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbTitleThird.leadingAnchor.constraint(equalTo: imgSearch.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleThird.trailingAnchor.constraint(equalTo: viewBackgroundThird.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleThird.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        
               self.viewBackgroundSecond.addSubview(viewClipboard)
                     NSLayoutConstraint.activate([
                         self.viewClipboard.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                         self.viewClipboard.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
                         self.viewClipboard.topAnchor.constraint(equalTo: self.viewBackgroundThird.bottomAnchor,constant:  AppConstants.MARGIN_TOP),
                         
                     ])
                     
                     
                     viewClipboard.addSubview(imgClipboard)
                     NSLayoutConstraint.activate([
                         imgClipboard.topAnchor.constraint(equalTo: viewClipboard.topAnchor, constant:  AppConstants.MARGIN_TOP),
                         imgClipboard.leadingAnchor.constraint(equalTo: viewClipboard.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                         self.imgClipboard.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                         self.imgClipboard.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                         self.imgClipboard.centerYAnchor.constraint(equalTo: self.viewClipboard.centerYAnchor)
                         
                     ])
                     viewClipboard.addSubview(lbClipboard)
                     NSLayoutConstraint.activate([
                       lbClipboard.topAnchor.constraint(equalTo: viewClipboard.topAnchor, constant: AppConstants.MARGIN_TOP),
                         lbClipboard.leadingAnchor.constraint(equalTo: imgClipboard.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                         lbClipboard.trailingAnchor.constraint(equalTo: viewClipboard.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                         self.lbClipboard.centerYAnchor.constraint(equalTo: self.viewClipboard.centerYAnchor)
                         
                     ])
         
          
          
          self.viewBackgroundSecond.addSubview(self.viewUnderLine)
          NSLayoutConstraint.activate([
              self.viewUnderLine.topAnchor.constraint(equalTo: self.viewClipboard.bottomAnchor, constant: AppConstants.MARGIN_TOP),
              self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor),
              self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor),
              self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor),
              self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
          ])
          self.viewUnderLine.backgroundColor = .lightGray
        viewBackgroundThird.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchBarcodeAction(sender:))))
        viewBackgroundThird.isUserInteractionEnabled  = true
        
        viewClipboard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clipboardAction(sender:))))
        viewClipboard.isUserInteractionEnabled  = true
    }
}
