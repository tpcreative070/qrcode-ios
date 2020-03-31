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
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: AppConstants.MARGIN_TOP),
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
            viewVibrate.topAnchor.constraint(equalTo: lbScan.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewVibrate.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewVibrate.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewVibrate.addSubview(imgVibrate)
        NSLayoutConstraint.activate([
            self.imgVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgVibrate.leadingAnchor.constraint(equalTo: self.viewVibrate.leadingAnchor),
            self.imgVibrate.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgVibrate.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgVibrate.centerYAnchor.constraint(equalTo: self.viewVibrate.centerYAnchor)
        ])
        
        self.viewVibrate.addSubview(self.lbVibrate)
        NSLayoutConstraint.activate([
            self.lbVibrate.leadingAnchor.constraint(equalTo: self.imgVibrate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.lbVibrate.centerYAnchor.constraint(equalTo: self.viewVibrate.centerYAnchor),
            self.lbVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewVibrate.addSubview(self.switchVibrate)
        NSLayoutConstraint.activate([
            switchVibrate.topAnchor.constraint(equalTo: viewVibrate.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            switchVibrate.trailingAnchor.constraint(equalTo: viewVibrate.trailingAnchor),
            switchVibrate.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
            switchVibrate.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT)
        ])
        
        self.viewBackground.addSubview(viewBeep)
        NSLayoutConstraint.activate([
            viewBeep.topAnchor.constraint(equalTo: viewVibrate.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewBeep.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewBeep.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant:  AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewBeep.addSubview(imgBeep)
        NSLayoutConstraint.activate([
            self.imgBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgBeep.leadingAnchor.constraint(equalTo: self.viewBeep.leadingAnchor),
            self.imgBeep.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgBeep.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgBeep.centerYAnchor.constraint(equalTo: self.viewBeep.centerYAnchor)
        ])
        
        self.viewBeep.addSubview(self.lbBeep)
        NSLayoutConstraint.activate([
            self.lbBeep.leadingAnchor.constraint(equalTo: self.imgBeep.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.lbBeep.centerYAnchor.constraint(equalTo: self.viewBeep.centerYAnchor),
            self.lbBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewBeep.addSubview(self.switchBeep)
        NSLayoutConstraint.activate([
            switchBeep.topAnchor.constraint(equalTo: viewBeep.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            switchBeep.trailingAnchor.constraint(equalTo: viewBeep.trailingAnchor),
            switchBeep.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
            switchBeep.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT)
        ])
        self.viewBeep.addSubview(self.viewUnderLineScan)
        NSLayoutConstraint.activate([
            self.viewUnderLineScan.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor),
            self.viewUnderLineScan.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor),
            self.viewUnderLineScan.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor),
            self.viewUnderLineScan.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLineScan.backgroundColor = AppColors.GRAY_LIGHT
        self.viewBackground.addSubview(lbAvanceFeatures)
        NSLayoutConstraint.activate([
            lbAvanceFeatures.topAnchor.constraint(equalTo: viewBeep.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            lbAvanceFeatures.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            lbAvanceFeatures.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
        ])
        self.viewBackground.addSubview(viewChangeColor)
        NSLayoutConstraint.activate([
            viewChangeColor.topAnchor.constraint(equalTo: lbAvanceFeatures.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            self.stackViewChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            imgQRCode.topAnchor.constraint(equalTo: viewChangeColor.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            imgQRCode.trailingAnchor.constraint(equalTo: viewChangeColor.trailingAnchor),
            imgQRCode.widthAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_SETTING),
            imgQRCode.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_SETTING)
        ])
        self.viewBackground.addSubview(viewCopy)
        NSLayoutConstraint.activate([
            viewCopy.topAnchor.constraint(equalTo: viewChangeColor.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            self.stackViewCopy.topAnchor.constraint(equalTo: self.viewCopy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
        self.viewBackground.addSubview(viewOpenWeb)
        NSLayoutConstraint.activate([
            viewOpenWeb.topAnchor.constraint(equalTo: viewCopy.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewOpenWeb.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewOpenWeb.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            viewOpenWeb.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            
        ])
        self.viewOpenWeb.addSubview(imgWeb)
        NSLayoutConstraint.activate([
            self.imgWeb.leadingAnchor.constraint(equalTo: self.viewOpenWeb.leadingAnchor),
            self.imgWeb.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgWeb.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgWeb.centerYAnchor.constraint(equalTo: self.viewOpenWeb.centerYAnchor)
        ])
        
        self.viewOpenWeb.addSubview(stackViewOpenWeb)
        NSLayoutConstraint.activate([
            self.stackViewOpenWeb.leadingAnchor.constraint(equalTo: self.imgCopy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewOpenWeb.topAnchor.constraint(equalTo: self.viewOpenWeb.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewOpenWeb.centerYAnchor.constraint(equalTo: self.viewOpenWeb.centerYAnchor),
            self.stackViewOpenWeb.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),
            
        ])
        self.stackViewOpenWeb.axis = .vertical
        self.stackViewOpenWeb.alignment = .fill
        self.stackViewOpenWeb.distribution = UIStackView.Distribution.fillEqually
        self.stackViewOpenWeb.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewOpenWeb.addArrangedSubview(lbOpenWeb)
        self.stackViewOpenWeb.addArrangedSubview(lbOpenWebContent)
        self.viewOpenWeb.addSubview(self.switchOpen)
        NSLayoutConstraint.activate([
            switchOpen.topAnchor.constraint(equalTo: viewOpenWeb.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchOpen.trailingAnchor.constraint(equalTo: viewOpenWeb.trailingAnchor),
            switchOpen.widthAnchor.constraint(equalToConstant: AppConstants.SWITCH_WIDTH_DEFAULT),
            switchOpen.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT),
        ])
        
        self.viewBackground.addSubview(viewLanguage)
        NSLayoutConstraint.activate([
            viewLanguage.topAnchor.constraint(equalTo: viewOpenWeb.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewLanguage.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewLanguage.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            viewLanguage.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            
        ])
        self.viewLanguage.addSubview(imgLanguage)
        NSLayoutConstraint.activate([
            self.imgLanguage.leadingAnchor.constraint(equalTo: self.viewLanguage.leadingAnchor),
            self.imgLanguage.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgLanguage.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgLanguage.centerYAnchor.constraint(equalTo: self.viewLanguage.centerYAnchor)
        ])
        
        self.viewLanguage.addSubview(stackViewLanguage)
        NSLayoutConstraint.activate([
            self.stackViewLanguage.leadingAnchor.constraint(equalTo: self.imgLanguage.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewLanguage.topAnchor.constraint(equalTo: self.viewLanguage.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewLanguage.centerYAnchor.constraint(equalTo: self.viewLanguage.centerYAnchor),
            self.stackViewLanguage.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),
            
        ])
        self.stackViewLanguage.axis = .vertical
        self.stackViewLanguage.alignment = .fill
        self.stackViewLanguage.distribution = UIStackView.Distribution.fillEqually
        self.stackViewLanguage.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewLanguage.addArrangedSubview(lbLanguage)
        self.stackViewLanguage.addArrangedSubview(lbLanguageContent)
        self.viewLanguage.addSubview(self.viewUnderLineAdvance)
        NSLayoutConstraint.activate([
            self.viewUnderLineAdvance.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor),
            self.viewUnderLineAdvance.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor),
            self.viewUnderLineAdvance.bottomAnchor.constraint(equalTo: self.viewLanguage.bottomAnchor),
            self.viewUnderLineAdvance.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLineAdvance.backgroundColor = AppColors.GRAY_LIGHT
          self.viewBackground.addSubview(lbInformation)
         NSLayoutConstraint.activate([
         lbInformation.topAnchor.constraint(equalTo: viewLanguage.bottomAnchor, constant: AppConstants.MARGIN_TOP),
         lbInformation.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
         lbInformation.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
         ])
         self.viewBackground.addSubview(viewAppPermission)
         NSLayoutConstraint.activate([
         viewAppPermission.topAnchor.constraint(equalTo: lbInformation.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewAppPermission.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewAppPermission.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         ])
         self.viewAppPermission.addSubview(imgAppPermission)
         NSLayoutConstraint.activate([
         self.imgAppPermission.topAnchor.constraint(equalTo: self.viewAppPermission.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.imgAppPermission.bottomAnchor.constraint(equalTo: self.viewAppPermission.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         self.imgAppPermission.leadingAnchor.constraint(equalTo: self.viewAppPermission.leadingAnchor),
         self.imgAppPermission.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgAppPermission.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgAppPermission.centerYAnchor.constraint(equalTo: self.viewAppPermission.centerYAnchor)
         ])
         
         self.viewAppPermission.addSubview(self.lbAppPermission)
         NSLayoutConstraint.activate([
         self.lbAppPermission.leadingAnchor.constraint(equalTo: self.imgAppPermission.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.lbAppPermission.topAnchor.constraint(equalTo: self.viewAppPermission.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.lbAppPermission.centerYAnchor.constraint(equalTo: self.viewAppPermission.centerYAnchor),
         self.lbAppPermission.bottomAnchor.constraint(equalTo: self.viewAppPermission.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         ])
         self.viewBackground.addSubview(viewPrivacy)
         NSLayoutConstraint.activate([
         viewPrivacy.topAnchor.constraint(equalTo: viewAppPermission.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewPrivacy.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewPrivacy.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         ])
         self.viewPrivacy.addSubview(imgPrivacy)
         NSLayoutConstraint.activate([
         self.imgPrivacy.topAnchor.constraint(equalTo: self.viewPrivacy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.imgPrivacy.bottomAnchor.constraint(equalTo: self.viewPrivacy.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         self.imgPrivacy.leadingAnchor.constraint(equalTo: self.viewPrivacy.leadingAnchor),
         self.imgPrivacy.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgPrivacy.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgPrivacy.centerYAnchor.constraint(equalTo: self.viewPrivacy.centerYAnchor)
         ])
         
         self.viewPrivacy.addSubview(self.lbPrivacy)
         NSLayoutConstraint.activate([
         self.lbPrivacy.leadingAnchor.constraint(equalTo: self.imgPrivacy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.lbPrivacy.topAnchor.constraint(equalTo: self.viewPrivacy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.lbPrivacy.centerYAnchor.constraint(equalTo: self.viewPrivacy.centerYAnchor),
         self.lbPrivacy.bottomAnchor.constraint(equalTo: self.viewPrivacy.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         ])
         self.viewBackground.addSubview(viewRate)
         NSLayoutConstraint.activate([
         viewRate.topAnchor.constraint(equalTo: viewPrivacy.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewRate.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewRate.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         ])
         self.viewRate.addSubview(imgRate)
         NSLayoutConstraint.activate([
         self.imgRate.topAnchor.constraint(equalTo: self.viewRate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.imgRate.bottomAnchor.constraint(equalTo: self.viewRate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         self.imgRate.leadingAnchor.constraint(equalTo: self.viewRate.leadingAnchor),
         self.imgRate.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgRate.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgRate.centerYAnchor.constraint(equalTo: self.viewRate.centerYAnchor)
         ])
         
         self.viewRate.addSubview(self.lbRating)
         NSLayoutConstraint.activate([
         self.lbRating.leadingAnchor.constraint(equalTo: self.imgRate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.lbRating.topAnchor.constraint(equalTo: self.viewRate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.lbRating.centerYAnchor.constraint(equalTo: self.viewRate.centerYAnchor),
         self.lbRating.bottomAnchor.constraint(equalTo: self.viewRate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         ])
         self.viewBackground.addSubview(viewShare)
         NSLayoutConstraint.activate([
         viewShare.topAnchor.constraint(equalTo: viewRate.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewShare.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewShare.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         ])
         self.viewShare.addSubview(imgShare)
         NSLayoutConstraint.activate([
         self.imgShare.topAnchor.constraint(equalTo: self.viewShare.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.imgShare.bottomAnchor.constraint(equalTo: self.viewShare.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         self.imgShare.leadingAnchor.constraint(equalTo: self.viewShare.leadingAnchor),
         self.imgShare.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgShare.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgShare.centerYAnchor.constraint(equalTo: self.viewShare.centerYAnchor)
         ])
         
         self.viewShare.addSubview(self.lbShare)
         NSLayoutConstraint.activate([
         self.lbShare.leadingAnchor.constraint(equalTo: self.imgShare.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.lbShare.topAnchor.constraint(equalTo: self.viewShare.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.lbShare.centerYAnchor.constraint(equalTo: self.viewShare.centerYAnchor),
         self.lbShare.bottomAnchor.constraint(equalTo: self.viewShare.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         ])
         self.viewBackground.addSubview(viewHelp)
         NSLayoutConstraint.activate([
         viewHelp.topAnchor.constraint(equalTo: viewShare.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewHelp.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewHelp.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         ])
         self.viewHelp.addSubview(imgHelp)
         NSLayoutConstraint.activate([
         self.imgHelp.topAnchor.constraint(equalTo: self.viewHelp.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.imgHelp.bottomAnchor.constraint(equalTo: self.viewHelp.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         self.imgHelp.leadingAnchor.constraint(equalTo: self.viewHelp.leadingAnchor),
         self.imgHelp.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgHelp.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgHelp.centerYAnchor.constraint(equalTo: self.viewHelp.centerYAnchor)
         ])
         
         self.viewHelp.addSubview(self.lbHelp)
         NSLayoutConstraint.activate([
         self.lbHelp.leadingAnchor.constraint(equalTo: self.imgHelp.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.lbHelp.topAnchor.constraint(equalTo: self.viewHelp.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.lbHelp.centerYAnchor.constraint(equalTo: self.viewHelp.centerYAnchor),
         self.lbHelp.bottomAnchor.constraint(equalTo: self.viewHelp.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
         ])
         
         self.viewBackground.addSubview(viewSupport)
         NSLayoutConstraint.activate([
         viewSupport.topAnchor.constraint(equalTo: viewHelp.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewSupport.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewSupport.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         viewSupport.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
         
         ])
         self.viewSupport.addSubview(imgSupport)
         NSLayoutConstraint.activate([
         self.imgSupport.leadingAnchor.constraint(equalTo: self.viewSupport.leadingAnchor),
         self.imgSupport.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgSupport.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgSupport.centerYAnchor.constraint(equalTo: self.viewSupport.centerYAnchor)
         ])
         
         self.viewSupport.addSubview(stackViewSupport)
         NSLayoutConstraint.activate([
         self.stackViewSupport.leadingAnchor.constraint(equalTo: self.imgSupport.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.stackViewSupport.topAnchor.constraint(equalTo: self.viewSupport.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.stackViewSupport.centerYAnchor.constraint(equalTo: self.viewSupport.centerYAnchor),
         self.stackViewSupport.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),
         
         ])
         self.stackViewSupport.axis = .vertical
         self.stackViewSupport.alignment = .fill
         self.stackViewSupport.distribution = UIStackView.Distribution.fillEqually
         self.stackViewSupport.spacing = AppConstants.MARGIN_TOP_SUBITEM
         self.stackViewSupport.addArrangedSubview(lbSupport)
         self.stackViewSupport.addArrangedSubview(lbSupportContent)
         
         self.viewBackground.addSubview(viewVersion)
         NSLayoutConstraint.activate([
         viewVersion.topAnchor.constraint(equalTo: viewSupport.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         viewVersion.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
         viewVersion.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
         viewVersion.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
         
         ])
         self.viewVersion.addSubview(imgVersion)
         NSLayoutConstraint.activate([
         self.imgVersion.leadingAnchor.constraint(equalTo: self.viewVersion.leadingAnchor),
         self.imgVersion.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgVersion.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
         self.imgVersion.centerYAnchor.constraint(equalTo: self.viewVersion.centerYAnchor)
         ])
         
         self.viewVersion.addSubview(stackViewVersion)
         NSLayoutConstraint.activate([
         self.stackViewVersion.leadingAnchor.constraint(equalTo: self.imgVersion.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
         self.stackViewVersion.topAnchor.constraint(equalTo: self.viewVersion.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
         self.stackViewVersion.centerYAnchor.constraint(equalTo: self.viewVersion.centerYAnchor),
         self.stackViewVersion.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5),
         
         ])
         self.stackViewVersion.axis = .vertical
         self.stackViewVersion.alignment = .fill
         self.stackViewVersion.distribution = UIStackView.Distribution.fillEqually
         self.stackViewVersion.spacing = AppConstants.MARGIN_TOP_SUBITEM
         self.stackViewVersion.addArrangedSubview(lbQrCode)
         self.stackViewVersion.addArrangedSubview(lbQrCodeContent)
         
        
        self.lbChangeColorContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbChangeColorContent.textColor = AppColors.GRAY
        
        self.lbCopyContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbCopyContent.textColor = AppColors.GRAY
        
        self.lbSupportContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbSupportContent.textColor = AppColors.GRAY
        
        self.lbLanguageContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbLanguageContent.textColor = AppColors.GRAY
        
        self.lbQrCodeContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbQrCodeContent.textColor = AppColors.GRAY
        
        self.lbOpenWebContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.FLOAT_PLACEHOLDER_FONT_SIZE)
        self.lbOpenWebContent.textColor = AppColors.GRAY
        
        self.lbCopyContent.numberOfLines = 2
        self.lbOpenWebContent.numberOfLines = 2
        self.lbLanguageContent.numberOfLines = 2
        
        self.lbScan.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbScan.textColor = AppColors.PRIMARY_COLOR
        self.lbAvanceFeatures.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbAvanceFeatures.textColor = AppColors.PRIMARY_COLOR
        self.lbInformation.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: AppFonts.LABEL_TITLE_FONT_SIZE)
        self.lbInformation.textColor = AppColors.PRIMARY_COLOR
        setupEndedUpScrollView()
        
          self.switchVibrate.addTarget(self, action: #selector(switchVibrateDidChange(_:)), for: .touchUpInside)
          self.switchOpen.addTarget(self, action: #selector(switchOpenDidChange(_:)), for: .touchUpInside)
          self.switchBeep.addTarget(self, action: #selector(switchBeepDidChange(_:)), for: .touchUpInside)
          self.switchCopy.addTarget(self, action: #selector(switchCopyDidChange(_:)), for: .touchUpInside)
    }
    func setupEndedUpScrollView(){
        viewBackground.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: stackViewVersion.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor)
        ])
        self.view.layoutIfNeeded()
    }
    func switchDefaultConfig(switchView: ICSwitchButton) {
      switchView.onTintColor = AppConstants.SWITCH_ON_TINT_COLOR
      switchView.offTintColor = AppConstants.SWITCH_OFF_TINT_COLOR
      switchView.cornerRadius = AppConstants.SWITCH_CORNER_RADIUS
      switchView.thumbCornerRadius = AppConstants.SWITCH_THUMB_CORNER_RADIUS
      switchView.thumbSize = CGSize(width: AppConstants.SWITCH_THUMB_SIZE_WIDTH, height: AppConstants.SWITCH_THUMB_SIZE_HEIGHT)
      switchView.thumbTintOnColor = AppConstants.SWITCH_THUMB_ON_TINT_COLOR
      switchView.thumbTintOffColor = AppConstants.SWITCH_THUMB_OFF_TINT_COLOR
      switchView.animationDuration = AppConstants.SWITCH_ANIMATION_DURATION
    }
    func bindViewModel(){
        self.switchDefaultConfig(switchView: switchVibrate)
        self.switchDefaultConfig(switchView: switchOpen)
        self.switchDefaultConfig(switchView: switchBeep)
        self.switchDefaultConfig(switchView: switchCopy)
    }
}
