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
            //   self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView1.bottomAnchor,constant: -0)
            
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
            textFieldValueFirst.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT)
        ])
        
        self.viewBackgroundSecond.addSubview(viewBackgroundThird)
        NSLayoutConstraint.activate([
            self.viewBackgroundThird.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundThird.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:  AppConstants.MARGIN_RIGHT),
            self.viewBackgroundThird.topAnchor.constraint(equalTo: self.textFieldValueFirst.bottomAnchor,constant: 20),
            
        ])
        
        
        viewBackgroundThird.addSubview(imgSearch)
        NSLayoutConstraint.activate([
            imgSearch.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: 10),
            imgSearch.leadingAnchor.constraint(equalTo: viewBackgroundThird.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgSearch.widthAnchor.constraint(equalToConstant: 30),
            self.imgSearch.heightAnchor.constraint(equalToConstant: 30),
            self.imgSearch.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        viewBackgroundThird.addSubview(lbTitleThird)
        NSLayoutConstraint.activate([
            lbTitleThird.topAnchor.constraint(equalTo: viewBackgroundThird.topAnchor, constant: 10),
            lbTitleThird.leadingAnchor.constraint(equalTo: imgSearch.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleThird.trailingAnchor.constraint(equalTo: viewBackgroundThird.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleThird.centerYAnchor.constraint(equalTo: self.viewBackgroundThird.centerYAnchor)
            
        ])
        
        self.viewBackgroundSecond.addSubview(viewBackgroundFour)
        NSLayoutConstraint.activate([
            self.viewBackgroundFour.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewBackgroundFour.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.viewBackgroundFour.topAnchor.constraint(equalTo: self.viewBackgroundThird.bottomAnchor,constant: 20),
            
        ])
        
        
        viewBackgroundFour.addSubview(imgText)
        NSLayoutConstraint.activate([
            imgText.topAnchor.constraint(equalTo: viewBackgroundFour.topAnchor, constant: 10),
            imgText.leadingAnchor.constraint(equalTo: viewBackgroundFour.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgText.widthAnchor.constraint(equalToConstant: 30),
            self.imgText.heightAnchor.constraint(equalToConstant: 30),
            self.imgText.centerYAnchor.constraint(equalTo: self.viewBackgroundFour.centerYAnchor)
            
        ])
        viewBackgroundFour.addSubview(lbTitleSecond)
        NSLayoutConstraint.activate([
            lbTitleSecond.topAnchor.constraint(equalTo: viewBackgroundFour.topAnchor, constant: 10),
            lbTitleSecond.leadingAnchor.constraint(equalTo: imgText.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitleSecond.trailingAnchor.constraint(equalTo: viewBackgroundFour.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbTitleSecond.centerYAnchor.constraint(equalTo: self.viewBackgroundFour.centerYAnchor)
            
        ])
        
        self.viewBackgroundSecond.addSubview(viewClipboard)
        NSLayoutConstraint.activate([
            self.viewClipboard.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            viewClipboard.trailingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewClipboard.heightAnchor.constraint(equalToConstant: 50),
            
            self.viewClipboard.topAnchor.constraint(equalTo: self.viewBackgroundFour.bottomAnchor,constant: 10),
        ])
        
        self.viewClipboard.addSubview(imgClipboard)
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
        viewBackgroundThird.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchTextAction(sender:))))
        viewBackgroundThird.isUserInteractionEnabled  = true
        viewBackgroundFour.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textAction(sender:))))
        viewBackgroundFour.isUserInteractionEnabled  = true
        viewClipboard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clipboardAction(sender:))))
        viewClipboard.isUserInteractionEnabled  = true
    }
}

