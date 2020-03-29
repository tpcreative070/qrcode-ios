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
            viewBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_HELP),
            viewBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
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
            viewVibrate.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewVibrate.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewVibrate.addSubview(imgVibrate)
        NSLayoutConstraint.activate([
            self.imgVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgVibrate.leadingAnchor.constraint(equalTo: self.viewVibrate.leadingAnchor),
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
            viewBeep.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewBeep.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant:  AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewBeep.addSubview(imgBeep)
        NSLayoutConstraint.activate([
            self.imgBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgBeep.leadingAnchor.constraint(equalTo: self.viewBeep.leadingAnchor),
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
            viewChangeColor.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewChangeColor.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            viewChangeColor.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            
        ])
        self.viewChangeColor.addSubview(imgChangeColor)
        NSLayoutConstraint.activate([
            self.imgChangeColor.leadingAnchor.constraint(equalTo: self.viewChangeColor.leadingAnchor),
            self.imgChangeColor.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgChangeColor.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgChangeColor.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor)
        ])
        
        self.viewChangeColor.addSubview(stackViewChangeColor)
        NSLayoutConstraint.activate([
            self.stackViewChangeColor.leadingAnchor.constraint(equalTo: self.imgChangeColor.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.stackViewChangeColor.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor),
            self.stackViewChangeColor.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),

        ])
        self.stackViewChangeColor.axis = .vertical
        self.stackViewChangeColor.alignment = .fill
        self.stackViewChangeColor.distribution = UIStackView.Distribution.fillEqually
        self.stackViewChangeColor.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewChangeColor.addArrangedSubview(lbChangeColor)
        self.stackViewChangeColor.addArrangedSubview(lbChangeColorContent)
        self.viewChangeColor.addSubview(self.imgQRCode)
        NSLayoutConstraint.activate([
            imgQRCode.topAnchor.constraint(equalTo: viewChangeColor.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            imgQRCode.trailingAnchor.constraint(equalTo: viewChangeColor.trailingAnchor),
            imgQRCode.widthAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_SETTING),
            imgQRCode.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_SETTING)
        ])
        self.viewBackground.addSubview(viewCopy)
               NSLayoutConstraint.activate([
                   viewCopy.topAnchor.constraint(equalTo: viewChangeColor.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
                   viewCopy.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
                   viewCopy.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
                   viewCopy.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
                   
               ])
               self.viewCopy.addSubview(imgCopy)
               NSLayoutConstraint.activate([
                   self.imgCopy.leadingAnchor.constraint(equalTo: self.viewCopy.leadingAnchor),
                   self.imgCopy.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                   self.imgCopy.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                   self.imgCopy.centerYAnchor.constraint(equalTo: self.viewCopy.centerYAnchor)
               ])
               
               self.viewCopy.addSubview(stackViewCopy)
               NSLayoutConstraint.activate([
                   self.stackViewCopy.leadingAnchor.constraint(equalTo: self.imgCopy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.stackViewCopy.topAnchor.constraint(equalTo: self.viewCopy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
                   self.stackViewCopy.centerYAnchor.constraint(equalTo: self.viewCopy.centerYAnchor),
                   self.stackViewCopy.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),

               ])
               self.stackViewCopy.axis = .vertical
               self.stackViewCopy.alignment = .fill
               self.stackViewCopy.distribution = UIStackView.Distribution.fillEqually
               self.stackViewCopy.spacing = AppConstants.MARGIN_TOP_SUBITEM
               self.stackViewCopy.addArrangedSubview(lbCopy)
               self.stackViewCopy.addArrangedSubview(lbCopyContent)
              self.viewCopy.addSubview(self.switchCopy)
               NSLayoutConstraint.activate([
                   switchCopy.topAnchor.constraint(equalTo: viewCopy.topAnchor, constant: AppConstants.MARGIN_TOP),
                   switchCopy.trailingAnchor.constraint(equalTo: viewCopy.trailingAnchor),
                   switchCopy.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
                   switchCopy.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT),
               ])
               
        self.lbChangeColorContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbChangeColorContent.textColor = AppColors.GRAY
        
        self.lbCopyContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbCopyContent.textColor = AppColors.GRAY
        self.lbCopyContent.numberOfLines = 2
        self.lbScan.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbScan.textColor = AppColors.PRIMARY_COLOR
        self.lbAvanceFeatures.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbAvanceFeatures.textColor = AppColors.PRIMARY_COLOR
        self.lbInformation.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbInformation.textColor = AppColors.PRIMARY_COLOR
    }
    
}
