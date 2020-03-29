//
//  SettingsVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension SettingsVC {
    func initUI(){
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        self.scrollView.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            viewBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
        ])
        self.viewBackground.addSubview(lbScan)
        NSLayoutConstraint.activate([
            lbScan.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            lbScan.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            lbScan.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
        ])
        self.viewBackground.addSubview(viewVibrate)
        NSLayoutConstraint.activate([
            viewVibrate.topAnchor.constraint(equalTo: lbScan.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewVibrate.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            viewVibrate.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            viewVibrate.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            viewVibrate.heightAnchor.constraint(equalToConstant: 50)
        ])
        self.viewVibrate.addSubview(imgVibrate)
        NSLayoutConstraint.activate([
            self.imgVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgVibrate.leadingAnchor.constraint(equalTo: self.viewVibrate.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.imgVibrate.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgVibrate.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgVibrate.centerYAnchor.constraint(equalTo: self.viewVibrate.centerYAnchor)
        ])
        
        self.viewVibrate.addSubview(self.lbVibrate)
        NSLayoutConstraint.activate([
            self.lbVibrate.leadingAnchor.constraint(equalTo: self.imgVibrate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.lbVibrate.centerYAnchor.constraint(equalTo: self.viewVibrate.centerYAnchor),
            self.lbVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewVibrate.addSubview(self.switchVibrate)
        NSLayoutConstraint.activate([
            switchVibrate.topAnchor.constraint(equalTo: viewVibrate.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            switchVibrate.trailingAnchor.constraint(equalTo: viewVibrate.trailingAnchor),
            switchVibrate.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
            switchVibrate.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT)
        ])
        
        self.viewBackground.addSubview(viewBeep)
        NSLayoutConstraint.activate([
            viewBeep.topAnchor.constraint(equalTo: viewVibrate.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewBeep.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            viewBeep.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            viewBeep.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            viewBeep.heightAnchor.constraint(equalToConstant: 50)
        ])
        self.viewBeep.addSubview(imgBeep)
        NSLayoutConstraint.activate([
            self.imgBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgBeep.leadingAnchor.constraint(equalTo: self.viewBeep.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.imgBeep.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgBeep.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgBeep.centerYAnchor.constraint(equalTo: self.viewBeep.centerYAnchor)
        ])
        
        self.viewBeep.addSubview(self.lbBeep)
        NSLayoutConstraint.activate([
            self.lbBeep.leadingAnchor.constraint(equalTo: self.imgBeep.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.lbBeep.centerYAnchor.constraint(equalTo: self.viewBeep.centerYAnchor),
            self.lbBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewBeep.addSubview(self.switchBeep)
        NSLayoutConstraint.activate([
            switchBeep.topAnchor.constraint(equalTo: viewBeep.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            switchBeep.trailingAnchor.constraint(equalTo: viewBeep.trailingAnchor),
            switchBeep.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
            switchBeep.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT)
        ])
        self.viewBeep.addSubview(self.viewUnderLineScan)
              NSLayoutConstraint.activate([
                  self.viewUnderLineScan.leadingAnchor.constraint(equalTo: self.viewBeep.leadingAnchor),
                  self.viewUnderLineScan.trailingAnchor.constraint(equalTo: self.viewBeep.trailingAnchor),
                  self.viewUnderLineScan.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor),
                  self.viewUnderLineScan.heightAnchor.constraint(equalToConstant: 1)
              ])
              self.viewUnderLineScan.backgroundColor = AppColors.GRAY_LIGHT
              self.viewUnderLineScan.backgroundColor = .gray
        self.viewBackground.addSubview(lbAvanceFeatures)
              NSLayoutConstraint.activate([
                lbAvanceFeatures.topAnchor.constraint(equalTo: viewBeep.bottomAnchor, constant: AppConstants.MARGIN_TOP),
                  lbAvanceFeatures.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
                  lbAvanceFeatures.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
              ])
        self.viewBackground.addSubview(viewChangeColor)
               NSLayoutConstraint.activate([
                   viewChangeColor.topAnchor.constraint(equalTo: lbAvanceFeatures.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
                   viewChangeColor.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
                   viewChangeColor.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
                   viewChangeColor.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
                   viewChangeColor.heightAnchor.constraint(equalToConstant: 50)
               ])
               self.viewChangeColor.addSubview(imgChangeColor)
               NSLayoutConstraint.activate([
                   self.imgChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
                   self.imgChangeColor.bottomAnchor.constraint(equalTo: self.viewChangeColor.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
                   self.imgChangeColor.leadingAnchor.constraint(equalTo: self.viewChangeColor.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.imgChangeColor.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                   self.imgChangeColor.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                   self.imgChangeColor.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor)
               ])
               
               self.viewChangeColor.addSubview(self.lbChangeColor)
               NSLayoutConstraint.activate([
                   self.lbChangeColor.leadingAnchor.constraint(equalTo: self.imgChangeColor.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.lbChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
                   self.lbChangeColor.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor),
                   self.lbChangeColor.bottomAnchor.constraint(equalTo: self.viewChangeColor.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
               ])
        self.viewChangeColor.addSubview(self.lbChangeColorContent)
                    NSLayoutConstraint.activate([
                        self.lbChangeColorContent.leadingAnchor.constraint(equalTo: self.imgChangeColor.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
                        self.lbChangeColorContent.topAnchor.constraint(equalTo: self.lbChangeColor.bottomAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
                       // self.lbChangeColorContent.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor),
                        self.lbChangeColorContent.bottomAnchor.constraint(equalTo: self.viewChangeColor.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
                    ])
      self.viewChangeColor.addSubview(self.imgQRCode)
            NSLayoutConstraint.activate([
                imgQRCode.topAnchor.constraint(equalTo: viewChangeColor.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
                imgQRCode.trailingAnchor.constraint(equalTo: viewChangeColor.trailingAnchor),
                imgQRCode.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
                imgQRCode.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT)
            ])
        
        
        self.lbScan.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
        self.lbScan.textColor = AppColors.PRIMARY_COLOR
        self.lbAvanceFeatures.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
        self.lbAvanceFeatures.textColor = AppColors.PRIMARY_COLOR
        self.lbInformation.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
        self.lbInformation.textColor = AppColors.PRIMARY_COLOR
    }
    
}
