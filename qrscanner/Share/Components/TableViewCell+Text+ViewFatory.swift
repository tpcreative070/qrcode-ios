//
//  TableViewCell+Text+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//


import Foundation
import UIKit

extension TableViewCell  {
    
    func setupTextView(){
        self.addSubview(self.viewBackgroundSecond)
        NSLayoutConstraint.activate([
            self.viewBackgroundSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBackgroundSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBackgroundSecond.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackgroundSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.viewBackgroundSecond.addSubview(viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant:   AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor),
            //   self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
            
        ])
        
        viewRoot.addSubview(lbTitleFirst)
        NSLayoutConstraint.activate([
            lbTitleFirst.topAnchor.constraint(equalTo: viewRoot.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbTitleFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewRoot.addSubview(lbValueFirst)
                            NSLayoutConstraint.activate([
                                lbValueFirst.topAnchor.constraint(equalTo: lbTitleFirst.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
                                lbValueFirst.leadingAnchor.constraint(equalTo: viewRoot.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                                lbValueFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
                            ])
             
        self.viewBackgroundSecond.addSubview(viewBackgroundThird)
        NSLayoutConstraint.activate([
            self.viewBackgroundThird.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundThird.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:  AppConstants.MARGIN_RIGHT),
            self.viewBackgroundThird.topAnchor.constraint(equalTo: self.lbValueFirst.bottomAnchor,constant: AppConstants.MARGIN_TOP),
        ])
        viewBackgroundThird.addSubview(imgSearch)
        NSLayoutConstraint.activate([
            imgSearch.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant:  AppConstants.MARGIN_TOP),
            imgSearch.leadingAnchor.constraint(equalTo: viewBackgroundThird.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgSearch.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgSearch.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgSearch.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        viewBackgroundThird.addSubview(lbTitleThird)
        NSLayoutConstraint.activate([
            lbTitleThird.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant:  AppConstants.MARGIN_TOP),
            lbTitleThird.leadingAnchor.constraint(equalTo: imgSearch.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleThird.trailingAnchor.constraint(equalTo: viewBackgroundThird.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleThird.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        
        self.viewBackgroundSecond.addSubview(viewBackgroundFour)
        NSLayoutConstraint.activate([
            self.viewBackgroundFour.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundFour.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.viewBackgroundFour.topAnchor.constraint(equalTo: self.viewBackgroundThird.bottomAnchor,constant:  AppConstants.MARGIN_TOP),
            
        ])
        
        
        viewBackgroundFour.addSubview(imgText)
        NSLayoutConstraint.activate([
            imgText.topAnchor.constraint(equalTo: viewBackgroundFour.topAnchor, constant:  AppConstants.MARGIN_TOP),
            imgText.leadingAnchor.constraint(equalTo: viewBackgroundFour.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgText.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgText.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgText.centerYAnchor.constraint(equalTo: self.viewBackgroundFour.centerYAnchor)
            
        ])
        viewBackgroundFour.addSubview(lbTitleSecond)
        NSLayoutConstraint.activate([
            lbTitleSecond.topAnchor.constraint(equalTo: viewBackgroundFour.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbTitleSecond.leadingAnchor.constraint(equalTo: imgText.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleSecond.trailingAnchor.constraint(equalTo: viewBackgroundFour.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleSecond.centerYAnchor.constraint(equalTo: self.viewBackgroundFour.centerYAnchor)
            
        ])
        
        self.viewBackgroundSecond.addSubview(viewClipboard)
        NSLayoutConstraint.activate([
            self.viewClipboard.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewClipboard.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.viewClipboard.topAnchor.constraint(equalTo: self.viewBackgroundFour.bottomAnchor,constant:  AppConstants.MARGIN_TOP),
            
        ])
        
        
        viewClipboard.addSubview(imgClipboard)
        NSLayoutConstraint.activate([
            imgClipboard.topAnchor.constraint(equalTo: viewClipboard.topAnchor, constant:  AppConstants.MARGIN_TOP),
            imgClipboard.leadingAnchor.constraint(equalTo: viewClipboard.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgClipboard.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgClipboard.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
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
        viewBackgroundThird.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchTextAction(sender:))))
        viewBackgroundThird.isUserInteractionEnabled  = true
        viewBackgroundFour.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textAction(sender:))))
        viewBackgroundFour.isUserInteractionEnabled  = true
        viewClipboard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clipboardAction(sender:))))
        viewClipboard.isUserInteractionEnabled  = true
       
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.isScrollEnabled = true
      
    }
}

