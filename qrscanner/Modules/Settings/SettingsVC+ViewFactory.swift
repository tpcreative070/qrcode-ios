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
            viewBackground.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_HELP),
            viewBackground.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
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
            self.imgVibrate.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgVibrate.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            
        ])
        
        self.viewVibrate.addSubview(self.lbVibrate)
        NSLayoutConstraint.activate([
            self.lbVibrate.leadingAnchor.constraint(equalTo: self.imgVibrate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbVibrate.topAnchor.constraint(equalTo: self.viewVibrate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.lbVibrate.bottomAnchor.constraint(equalTo: self.viewVibrate.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewVibrate.addSubview(self.switchVibrate)
        NSLayoutConstraint.activate([
            switchVibrate.topAnchor.constraint(equalTo: viewVibrate.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            switchVibrate.trailingAnchor.constraint(equalTo: viewVibrate.trailingAnchor),
            switchVibrate.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchVibrate.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT)
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
            self.imgBeep.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgBeep.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewBeep.addSubview(self.lbBeep)
        NSLayoutConstraint.activate([
            self.lbBeep.leadingAnchor.constraint(equalTo: self.imgBeep.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbBeep.topAnchor.constraint(equalTo: self.viewBeep.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.lbBeep.bottomAnchor.constraint(equalTo: self.viewBeep.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewBeep.addSubview(self.switchBeep)
        NSLayoutConstraint.activate([
            switchBeep.topAnchor.constraint(equalTo: viewBeep.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            switchBeep.trailingAnchor.constraint(equalTo: viewBeep.trailingAnchor),
            switchBeep.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchBeep.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT)
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
            lbAvanceFeatures.topAnchor.constraint(equalTo: viewUnderLineScan.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            lbAvanceFeatures.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            lbAvanceFeatures.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
        ])
        self.viewBackground.addSubview(viewMultiScan)
        NSLayoutConstraint.activate([
            viewMultiScan.topAnchor.constraint(equalTo: lbAvanceFeatures.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewMultiScan.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewMultiScan.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant:  AppConstants.MARGIN_LEFT_SETTING),
        ])
        
        self.viewMultiScan.addSubview(imgMultiScan)
        NSLayoutConstraint.activate([
            self.imgMultiScan.topAnchor.constraint(equalTo: self.viewMultiScan.topAnchor, constant: AppConstants.MARGIN_TOP),
            self.imgMultiScan.leadingAnchor.constraint(equalTo: self.viewMultiScan.leadingAnchor),
            self.imgMultiScan.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgMultiScan.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        self.viewMultiScan.addSubview(stackViewMultiScan)
        NSLayoutConstraint.activate([
            self.stackViewMultiScan.leadingAnchor.constraint(equalTo: self.imgMultiScan.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewMultiScan.topAnchor.constraint(equalTo: self.viewMultiScan.topAnchor),
            self.stackViewMultiScan.centerYAnchor.constraint(equalTo: self.viewMultiScan.centerYAnchor),
            self.stackViewMultiScan.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewMultiScan.axis = .vertical
        self.stackViewMultiScan.alignment = .fill
        self.stackViewMultiScan.distribution = UIStackView.Distribution.fillEqually
        // self.stackViewMultiScan.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewMultiScan.addArrangedSubview(lbScanMulti)
        self.stackViewMultiScan.addArrangedSubview(lbMultiScanContent)
        
        self.viewMultiScan.addSubview(self.switchMultiScan)
        NSLayoutConstraint.activate([
            switchMultiScan.topAnchor.constraint(equalTo: viewMultiScan.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchMultiScan.trailingAnchor.constraint(equalTo: viewMultiScan.trailingAnchor),
            switchMultiScan.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchMultiScan.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT),
        ])
        self.viewBackground.addSubview(viewMultiLoad)
        NSLayoutConstraint.activate([
            viewMultiLoad.topAnchor.constraint(equalTo: viewMultiScan.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewMultiLoad.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewMultiLoad.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewMultiLoad.addSubview(imgMultiLoad)
        NSLayoutConstraint.activate([
            self.imgMultiLoad.topAnchor.constraint(equalTo: self.viewMultiLoad.topAnchor,constant: AppConstants.MARGIN_TOP),
            self.imgMultiLoad.leadingAnchor.constraint(equalTo: self.viewMultiLoad.leadingAnchor),
            self.imgMultiLoad.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgMultiLoad.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        self.viewMultiLoad.addSubview(stackViewMultiLoad)
        NSLayoutConstraint.activate([
            self.stackViewMultiLoad.leadingAnchor.constraint(equalTo: self.imgMultiLoad.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewMultiLoad.topAnchor.constraint(equalTo: self.viewMultiLoad.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewMultiLoad.centerYAnchor.constraint(equalTo: self.viewMultiLoad.centerYAnchor),
            self.stackViewMultiLoad.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewMultiLoad.axis = .vertical
        self.stackViewMultiLoad.alignment = .fill
        self.stackViewMultiLoad.distribution = UIStackView.Distribution.fillEqually
        // self.stackViewMultiLoad.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewMultiLoad.addArrangedSubview(lbLoadMulti)
        self.stackViewMultiLoad.addArrangedSubview(lbMultiLoadContent)
        self.viewMultiLoad.addSubview(self.switchMultiLoad)
        NSLayoutConstraint.activate([
            switchMultiLoad.topAnchor.constraint(equalTo: viewMultiLoad.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchMultiLoad.trailingAnchor.constraint(equalTo: viewMultiLoad.trailingAnchor),
            switchMultiLoad.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchMultiLoad.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT),
        ])
        self.viewBackground.addSubview(viewChangeColor)
        NSLayoutConstraint.activate([
            viewChangeColor.topAnchor.constraint(equalTo: viewMultiLoad.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewChangeColor.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewChangeColor.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewChangeColor.addSubview(imgChangeColor)
        NSLayoutConstraint.activate([
            self.imgChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgChangeColor.leadingAnchor.constraint(equalTo: self.viewChangeColor.leadingAnchor),
            self.imgChangeColor.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgChangeColor.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewChangeColor.addSubview(stackViewChangeColor)
        NSLayoutConstraint.activate([
            self.stackViewChangeColor.leadingAnchor.constraint(equalTo: self.imgChangeColor.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewChangeColor.topAnchor.constraint(equalTo: self.viewChangeColor.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewChangeColor.centerYAnchor.constraint(equalTo: self.viewChangeColor.centerYAnchor),
            self.stackViewChangeColor.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewChangeColor.axis = .vertical
        self.stackViewChangeColor.alignment = .fill
        self.stackViewChangeColor.distribution = UIStackView.Distribution.fillEqually
        self.stackViewChangeColor.addArrangedSubview(lbChangeColor)
        self.stackViewChangeColor.addArrangedSubview(lbChangeColorContent)
        self.viewChangeColor.addSubview(self.imgQRCode)
        NSLayoutConstraint.activate([
            imgQRCode.topAnchor.constraint(equalTo: viewChangeColor.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            imgQRCode.trailingAnchor.constraint(equalTo: viewChangeColor.trailingAnchor),
            imgQRCode.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_IMAGE_SETTING ),
            imgQRCode.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_IMAGE_SETTING)
        ])
        self.viewBackground.addSubview(viewCopy)
        NSLayoutConstraint.activate([
            viewCopy.topAnchor.constraint(equalTo: viewChangeColor.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewCopy.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewCopy.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewCopy.addSubview(imgCopy)
        NSLayoutConstraint.activate([
            self.imgCopy.topAnchor.constraint(equalTo: self.viewCopy.topAnchor,constant: AppConstants.MARGIN_TOP),
            self.imgCopy.leadingAnchor.constraint(equalTo: self.viewChangeColor.leadingAnchor),
            self.imgCopy.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgCopy.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewCopy.addSubview(stackViewCopy)
        NSLayoutConstraint.activate([
            self.stackViewCopy.leadingAnchor.constraint(equalTo: self.imgCopy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewCopy.topAnchor.constraint(equalTo: self.viewCopy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewCopy.centerYAnchor.constraint(equalTo: self.viewCopy.centerYAnchor),
            self.stackViewCopy.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewCopy.axis = .vertical
        self.stackViewCopy.alignment = .fill
        self.stackViewCopy.distribution = UIStackView.Distribution.fillEqually
        self.stackViewCopy.addArrangedSubview(lbCopy)
        self.stackViewCopy.addArrangedSubview(lbCopyContent)
        self.viewCopy.addSubview(self.switchCopy)
        NSLayoutConstraint.activate([
            switchCopy.topAnchor.constraint(equalTo: viewCopy.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchCopy.trailingAnchor.constraint(equalTo: viewCopy.trailingAnchor),
            switchCopy.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchCopy.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT),
        ])
        self.viewBackground.addSubview(viewOpenWeb)
        NSLayoutConstraint.activate([
            viewOpenWeb.topAnchor.constraint(equalTo: viewCopy.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewOpenWeb.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewOpenWeb.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewOpenWeb.addSubview(imgWeb)
        NSLayoutConstraint.activate([
            self.imgWeb.topAnchor.constraint(equalTo: self.viewOpenWeb.topAnchor,constant: AppConstants.MARGIN_TOP),
            self.imgWeb.leadingAnchor.constraint(equalTo: self.viewOpenWeb.leadingAnchor),
            self.imgWeb.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgWeb.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewOpenWeb.addSubview(stackViewOpenWeb)
        NSLayoutConstraint.activate([
            self.stackViewOpenWeb.leadingAnchor.constraint(equalTo: self.imgCopy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewOpenWeb.topAnchor.constraint(equalTo: self.viewOpenWeb.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewOpenWeb.centerYAnchor.constraint(equalTo: self.viewOpenWeb.centerYAnchor),
            self.stackViewOpenWeb.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewOpenWeb.axis = .vertical
        self.stackViewOpenWeb.alignment = .fill
        self.stackViewOpenWeb.distribution = UIStackView.Distribution.fillEqually
        self.stackViewOpenWeb.addArrangedSubview(lbOpenWeb)
        self.stackViewOpenWeb.addArrangedSubview(lbOpenWebContent)
        self.viewOpenWeb.addSubview(self.switchOpen)
        NSLayoutConstraint.activate([
            switchOpen.topAnchor.constraint(equalTo: viewOpenWeb.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchOpen.trailingAnchor.constraint(equalTo: viewOpenWeb.trailingAnchor),
            switchOpen.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchOpen.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT),
        ])
        
        self.viewBackground.addSubview(viewDulplicate)
        NSLayoutConstraint.activate([
            viewDulplicate.topAnchor.constraint(equalTo: viewOpenWeb.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewDulplicate.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewDulplicate.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewDulplicate.addSubview(imgDuplicate)
        NSLayoutConstraint.activate([
            self.imgDuplicate.topAnchor.constraint(equalTo: self.viewDulplicate.topAnchor,constant: AppConstants.MARGIN_TOP),
            self.imgDuplicate.leadingAnchor.constraint(equalTo: self.viewDulplicate.leadingAnchor),
            self.imgDuplicate.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgDuplicate.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewDulplicate.addSubview(stackViewDuplicate)
        NSLayoutConstraint.activate([
            self.stackViewDuplicate.leadingAnchor.constraint(equalTo: self.imgDuplicate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewDuplicate.topAnchor.constraint(equalTo: self.viewDulplicate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewDuplicate.centerYAnchor.constraint(equalTo: self.viewDulplicate.centerYAnchor),
            self.stackViewDuplicate.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewDuplicate.axis = .vertical
        self.stackViewDuplicate.alignment = .fill
        self.stackViewDuplicate.distribution = UIStackView.Distribution.fillEqually
        self.stackViewDuplicate.addArrangedSubview(lbDuplicate)
        self.stackViewDuplicate.addArrangedSubview(lbDuplicateContent)
        self.viewDulplicate.addSubview(self.switchDuplicate)
        NSLayoutConstraint.activate([
            switchDuplicate.topAnchor.constraint(equalTo: viewDulplicate.topAnchor, constant: AppConstants.MARGIN_TOP),
            switchDuplicate.trailingAnchor.constraint(equalTo: viewDulplicate.trailingAnchor),
            switchDuplicate.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_WIDTH_DEFAULT),
            switchDuplicate.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.SWITCH_HEIGHT_DEFAULT),
        ])
        
        
        self.viewBackground.addSubview(viewLanguage)
        NSLayoutConstraint.activate([
            viewLanguage.topAnchor.constraint(equalTo: viewDulplicate.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewLanguage.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewLanguage.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewLanguage.addSubview(imgLanguage)
        NSLayoutConstraint.activate([
            self.imgLanguage.topAnchor.constraint(equalTo: self.viewLanguage.topAnchor,constant: AppConstants.MARGIN_TOP),
            self.imgLanguage.leadingAnchor.constraint(equalTo: self.viewLanguage.leadingAnchor),
            self.imgLanguage.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgLanguage.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewLanguage.addSubview(stackViewLanguage)
        NSLayoutConstraint.activate([
            self.stackViewLanguage.leadingAnchor.constraint(equalTo: self.imgLanguage.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewLanguage.topAnchor.constraint(equalTo: self.viewLanguage.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewLanguage.centerYAnchor.constraint(equalTo: self.viewLanguage.centerYAnchor),
            self.stackViewLanguage.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.7),
            
        ])
        self.stackViewLanguage.axis = .vertical
        self.stackViewLanguage.alignment = .fill
        self.stackViewLanguage.distribution = UIStackView.Distribution.fillEqually
        self.stackViewLanguage.addArrangedSubview(lbLanguage)
        self.stackViewLanguage.addArrangedSubview(lbLanguageContent)
        self.viewLanguage.addSubview(self.lbCurrentLanguage)
        NSLayoutConstraint.activate([
            lbCurrentLanguage.topAnchor.constraint(equalTo: viewLanguage.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbCurrentLanguage.trailingAnchor.constraint(equalTo: viewLanguage.trailingAnchor),
            lbCurrentLanguage.bottomAnchor.constraint(equalTo: viewLanguage.bottomAnchor)
            //     lbCurrentLanguage.heightAnchor.constraint(equalToConstant: AppConstants.SWITCH_HEIGHT_DEFAULT),
        ])
        self.viewLanguage.addSubview(self.viewUnderLineAdvance)
        NSLayoutConstraint.activate([
            self.viewUnderLineAdvance.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor),
            self.viewUnderLineAdvance.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor),
            self.viewUnderLineAdvance.bottomAnchor.constraint(equalTo: self.viewLanguage.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            self.viewUnderLineAdvance.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLineAdvance.backgroundColor = AppColors.GRAY_LIGHT
        self.viewBackground.addSubview(lbInformation)
        NSLayoutConstraint.activate([
            lbInformation.topAnchor.constraint(equalTo: viewUnderLineAdvance.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            self.imgAppPermission.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgAppPermission.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewAppPermission.addSubview(self.lbAppPermission)
        NSLayoutConstraint.activate([
            self.lbAppPermission.leadingAnchor.constraint(equalTo: self.imgAppPermission.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbAppPermission.topAnchor.constraint(equalTo: self.viewAppPermission.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            self.imgPrivacy.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgPrivacy.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewPrivacy.addSubview(self.lbPrivacy)
        NSLayoutConstraint.activate([
            self.lbPrivacy.leadingAnchor.constraint(equalTo: self.imgPrivacy.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.lbPrivacy.topAnchor.constraint(equalTo: self.viewPrivacy.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
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
            self.imgRate.leadingAnchor.constraint(equalTo: self.viewRate.leadingAnchor),
            self.imgRate.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgRate.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        self.viewRate.addSubview(stackViewRate)
               NSLayoutConstraint.activate([
                   self.stackViewRate.leadingAnchor.constraint(equalTo: self.imgRate.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.stackViewRate.topAnchor.constraint(equalTo: self.viewRate.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
                   self.stackViewRate.centerYAnchor.constraint(equalTo: self.viewRate.centerYAnchor),
                   self.stackViewRate.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.8),
                   
               ])
               self.stackViewRate.axis = .vertical
               self.stackViewRate.alignment = .fill
                self.stackViewRate.spacing = 5
               self.stackViewRate.distribution = UIStackView.Distribution.fillEqually
               self.stackViewRate.addArrangedSubview(lbRating)
               self.stackViewRate.addArrangedSubview(lbRateContent)
        
        self.viewBackground.addSubview(viewShare)
        NSLayoutConstraint.activate([
            viewShare.topAnchor.constraint(equalTo: viewRate.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewShare.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewShare.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewShare.addSubview(imgShare)
        NSLayoutConstraint.activate([
            self.imgShare.topAnchor.constraint(equalTo: self.viewShare.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgShare.leadingAnchor.constraint(equalTo: self.viewShare.leadingAnchor),
            self.imgShare.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgShare.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        self.viewShare.addSubview(stackViewShare)
        NSLayoutConstraint.activate([
            self.stackViewShare.leadingAnchor.constraint(equalTo: self.imgShare.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewShare.topAnchor.constraint(equalTo: self.viewShare.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewShare.centerYAnchor.constraint(equalTo: self.viewShare.centerYAnchor),
            self.stackViewShare.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.8),
            
        ])
        self.stackViewShare.axis = .vertical
        self.stackViewShare.alignment = .fill
        self.stackViewShare.spacing = 5
        self.stackViewShare.distribution = UIStackView.Distribution.fillEqually
        self.stackViewShare.addArrangedSubview(lbShare)
        self.stackViewShare.addArrangedSubview(lbShareContent)
        
        self.viewBackground.addSubview(viewHelp)
        NSLayoutConstraint.activate([
            viewHelp.topAnchor.constraint(equalTo: viewShare.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewHelp.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewHelp.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewHelp.addSubview(imgHelp)
        NSLayoutConstraint.activate([
            self.imgHelp.topAnchor.constraint(equalTo: self.viewHelp.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgHelp.leadingAnchor.constraint(equalTo: self.viewHelp.leadingAnchor),
            self.imgHelp.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgHelp.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        self.viewHelp.addSubview(stackViewHelp)
               NSLayoutConstraint.activate([
                   self.stackViewHelp.leadingAnchor.constraint(equalTo: self.imgHelp.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
                   self.stackViewHelp.topAnchor.constraint(equalTo: self.viewHelp.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
                   self.stackViewHelp.centerYAnchor.constraint(equalTo: self.viewHelp.centerYAnchor),
                   self.stackViewHelp.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.8),
                   
               ])
               self.stackViewHelp.axis = .vertical
                self.stackViewHelp.alignment = .fill
                self.stackViewHelp.spacing = 5
               self.stackViewHelp.distribution = UIStackView.Distribution.fillEqually
               self.stackViewHelp.addArrangedSubview(lbHelp)
               self.stackViewHelp.addArrangedSubview(lbHelpContent)
      
        
        self.viewBackground.addSubview(viewSupport)
        NSLayoutConstraint.activate([
            viewSupport.topAnchor.constraint(equalTo: viewHelp.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewSupport.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewSupport.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
            
        ])
        self.viewSupport.addSubview(imgSupport)
        NSLayoutConstraint.activate([
            self.imgSupport.topAnchor.constraint(equalTo: self.viewSupport.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgSupport.leadingAnchor.constraint(equalTo: self.viewSupport.leadingAnchor),
            self.imgSupport.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgSupport.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewSupport.addSubview(stackViewSupport)
        NSLayoutConstraint.activate([
            self.stackViewSupport.leadingAnchor.constraint(equalTo: self.imgSupport.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewSupport.topAnchor.constraint(equalTo: self.viewSupport.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewSupport.centerYAnchor.constraint(equalTo: self.viewSupport.centerYAnchor),
            self.stackViewSupport.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.8),
            
        ])
        self.stackViewSupport.axis = .vertical
        self.stackViewSupport.alignment = .fill
        self.stackViewSupport.spacing = 5
        self.stackViewSupport.distribution = UIStackView.Distribution.fillEqually
        self.stackViewSupport.addArrangedSubview(lbSupport)
        self.stackViewSupport.addArrangedSubview(lbSupportContent)
        
        self.viewBackground.addSubview(viewVersion)
        NSLayoutConstraint.activate([
            viewVersion.topAnchor.constraint(equalTo: viewSupport.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            viewVersion.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT_SETTING),
            viewVersion.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: AppConstants.MARGIN_LEFT_SETTING),
        ])
        self.viewVersion.addSubview(imgVersion)
        NSLayoutConstraint.activate([
            self.imgVersion.topAnchor.constraint(equalTo: self.viewVersion.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.imgVersion.leadingAnchor.constraint(equalTo: self.viewVersion.leadingAnchor),
            self.imgVersion.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgVersion.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
        ])
        
        self.viewVersion.addSubview(stackViewVersion)
        NSLayoutConstraint.activate([
            self.stackViewVersion.leadingAnchor.constraint(equalTo: self.imgVersion.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackViewVersion.topAnchor.constraint(equalTo: self.viewVersion.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM_SETTING),
            self.stackViewVersion.centerYAnchor.constraint(equalTo: self.viewVersion.centerYAnchor),
            self.stackViewVersion.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.8),
            
        ])
        self.stackViewVersion.axis = .vertical
        self.stackViewVersion.alignment = .fill
        self.stackViewVersion.spacing = 5
        self.stackViewVersion.distribution = UIStackView.Distribution.fillEqually
        self.stackViewVersion.spacing = AppConstants.MARGIN_TOP_SUBITEM
        self.stackViewVersion.addArrangedSubview(lbQrCode)
        self.stackViewVersion.addArrangedSubview(lbQrCodeContent)
        
        
        self.lbChangeColorContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbChangeColorContent.textColor = AppColors.GRAY
        
        self.lbDuplicateContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbDuplicateContent.textColor = AppColors.GRAY
        
        self.lbCopyContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbCopyContent.textColor = AppColors.GRAY
        
        self.lbSupportContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbSupportContent.textColor = AppColors.GRAY
        
        self.lbHelpContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
               self.lbHelpContent.textColor = AppColors.GRAY
        
        self.lbShareContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbShareContent.textColor = AppColors.GRAY
        
        self.lbRateContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbRateContent.textColor = AppColors.GRAY
        
        self.lbLanguageContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbLanguageContent.textColor = AppColors.GRAY
        
        self.lbQrCodeContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbQrCodeContent.textColor = AppColors.GRAY
        
        self.lbOpenWebContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbOpenWebContent.textColor = AppColors.GRAY
        
        self.lbMultiScanContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbMultiScanContent.textColor = AppColors.GRAY
        self.lbMultiLoadContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.CONTENT_FONT_SIZE)
        self.lbMultiLoadContent.textColor = AppColors.GRAY
        self.lbCopyContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        self.lbOpenWebContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        self.lbLanguageContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        self.lbMultiLoadContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        self.lbMultiScanContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        self.lbDuplicateContent.numberOfLines = AppConstants.NUMBER_OF_LINE
        
        self.lbVibrate.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbDuplicate.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.lbBeep.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbScanMulti.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbLoadMulti.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbChangeColor.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbCopy.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbOpenWeb.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbLanguage.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbAppPermission.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbPrivacy.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbRating.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbShare.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbHelp.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbSupport.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbQrCode.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbCurrentLanguage.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.lbScan.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE)
        self.lbScan.textColor = AppColors.PRIMARY_COLOR
        self.lbAvanceFeatures.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE)
        self.lbAvanceFeatures.textColor = AppColors.PRIMARY_COLOR
        self.lbInformation.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoSemiBold, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE)
        self.lbInformation.textColor = AppColors.PRIMARY_COLOR
        setupEndedUpScrollView()
        
        self.switchVibrate.addTarget(self, action: #selector(switchVibrateDidChange(_:)), for: .touchUpInside)
        self.switchOpen.addTarget(self, action: #selector(switchOpenDidChange(_:)), for: .touchUpInside)
        self.switchBeep.addTarget(self, action: #selector(switchBeepDidChange(_:)), for: .touchUpInside)
        self.switchCopy.addTarget(self, action: #selector(switchCopyDidChange(_:)), for: .touchUpInside)
        self.switchMultiScan.addTarget(self, action: #selector(switchMultiScanDidChange(_:)), for: .touchUpInside)
        self.switchDuplicate.addTarget(self, action: #selector(switchDuplicateDidChange(_:)), for: .touchUpInside)
        
        self.switchMultiLoad.addTarget(self, action: #selector(switchMultiLoadDidChange(_:)), for: .touchUpInside)
        
        self.viewLanguage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doChangeLanguage(sender:))))
        viewLanguage.isUserInteractionEnabled  = true
        self.viewChangeColor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doChangeColor(sender:))))
        viewChangeColor.isUserInteractionEnabled  = true
        self.viewAppPermission.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPermission(sender:))))
        viewAppPermission.isUserInteractionEnabled  = true
        self.viewPrivacy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPrivacy(sender:))))
        viewPrivacy.isUserInteractionEnabled  = true
        self.viewShare.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showShare(sender:))))
        viewShare.isUserInteractionEnabled  = true
        self.viewHelp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showHelp(sender:))))
        viewHelp.isUserInteractionEnabled  = true
        self.viewSupport.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSupport(sender:))))
        viewHelp.isUserInteractionEnabled  = true
        self.viewRate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showRating(sender:))))
        viewRate.isUserInteractionEnabled  = true
        changeColorQRCode(imgQRCode: imgQRCode)
        getCurrenLang()
        let version = Helper.getVersion()
        lbQrCodeContent.text = "\(LanguageHelper.getTranslationByKey(LanguageKey.QRVersion)!) \(String(describing: version!))"
    }
    func setupEndedUpScrollView(){
        viewBackground.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: stackViewVersion.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor)
        ])
        // self.view.layoutIfNeeded()
    }
    func checkIsOnSwitch(){
        if UserDefaults.standard.bool(forKey:KeyUserDefault.MultiScan){
            switchMultiScan.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.MultiLoad){
            switchMultiLoad.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.Vibrate){
            switchVibrate.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.Copy){
            switchCopy.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.Beep){
            switchBeep.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.OpenWeb){
            switchOpen.isOn = true
        }
        if UserDefaults.standard.bool(forKey:KeyUserDefault.Duplicate){
            switchDuplicate.isOn = true
        }
        
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
        self.switchDefaultConfig(switchView: switchMultiScan)
        self.switchDefaultConfig(switchView: switchMultiLoad)
        self.switchDefaultConfig(switchView: switchVibrate)
        self.switchDefaultConfig(switchView: switchOpen)
        self.switchDefaultConfig(switchView: switchBeep)
        self.switchDefaultConfig(switchView: switchCopy)
        self.switchDefaultConfig(switchView: switchDuplicate)
        
    }
    func getCurrenLang(){
        var currentLang : String = ""
        if let mData = CommonService.getMultipleLanguages(){
            currentLang = mData
        }
        if currentLang == LanguageCode.Vietnamese{
            lbCurrentLanguage.text = LanguageHelper.getTranslationByKey(LanguageKey.Vietnamese)
        }
        if currentLang == LanguageCode.English{
            lbCurrentLanguage.text = LanguageHelper.getTranslationByKey(LanguageKey.English)
        }
        if currentLang == LanguageCode.Spanish{
            lbCurrentLanguage.text = LanguageHelper.getTranslationByKey(LanguageKey.Spanish)
        }
        if currentLang == LanguageCode.Portuguese{
            lbCurrentLanguage.text = LanguageHelper.getTranslationByKey(LanguageKey.Portuguese)
        }
    }
    
}
