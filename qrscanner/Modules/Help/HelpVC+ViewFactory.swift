//
//  EventGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by MacAppConstants.MARGIN_TOP_ITEM on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension HelpVC {
    func initUI() {
        view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        scrollView.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewBackground.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
            viewBackground.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT_HELP),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        viewBackground.addSubview(lbFirstTitle)
        NSLayoutConstraint.activate([
            lbFirstTitle.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFirstTitle.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            lbFirstTitle.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
        ])
        
        
        viewBackground.addSubview(lbFirstText)
        NSLayoutConstraint.activate([
            lbFirstText.topAnchor.constraint(equalTo: lbFirstTitle.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFirstText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            lbFirstText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor)
            
        ])
        
        
        viewBackground.addSubview(imgFirstText)
        NSLayoutConstraint.activate([
            imgFirstText.topAnchor.constraint(equalTo: lbFirstText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            imgFirstText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            imgFirstText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            imgFirstText.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_IMAGE_HELP)
        ])
        viewBackground.addSubview(lbSecondText)
        NSLayoutConstraint.activate([
            lbSecondText.topAnchor.constraint(equalTo: imgFirstText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbSecondText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            lbSecondText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            
        ])
        viewBackground.addSubview(lbSecondTitle)
        NSLayoutConstraint.activate([
            lbSecondTitle.topAnchor.constraint(equalTo: lbSecondText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbSecondTitle.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            lbSecondTitle.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
        ])
        viewBackground.addSubview(lbThirdText)
        NSLayoutConstraint.activate([
            lbThirdText.topAnchor.constraint(equalTo: lbSecondTitle.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbThirdText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            lbThirdText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
        ])
        viewBackground.addSubview(imgSecondText)
        NSLayoutConstraint.activate([
            imgSecondText.topAnchor.constraint(equalTo: lbThirdText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            imgSecondText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            imgSecondText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            imgSecondText.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_IMAGE_HELP)
            
        ])
        viewBackground.addSubview(lbFourText)
        NSLayoutConstraint.activate([
            lbFourText.topAnchor.constraint(equalTo: imgSecondText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFourText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFourText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
        ])
        viewBackground.addSubview(imgThirdText)
        NSLayoutConstraint.activate([
            imgThirdText.topAnchor.constraint(equalTo: lbFourText.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            imgThirdText.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            imgThirdText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            imgThirdText.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_IMAGE_HELP),
            imgThirdText.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: DeviceHelper.Shared.MARGIN_BOTTOM_SCAN)
        ])
        
        lbFirstTitle.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help1)
        lbFirstText.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help_Content1)
        
        imgFirstText.image = UIImage(named: AppImages.BG1)
        lbSecondText.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help_Content2)
        lbSecondTitle.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help2)
        lbThirdText.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help_Content3)
        imgSecondText.image = UIImage(named: AppImages.BG2)
        lbFourText.text = LanguageHelper.getTranslationByKey(LanguageKey.Title_Help_Content4)
        imgThirdText.image = UIImage(named: AppImages.BG3)
        self.lbFirstTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP)
        self.lbFirstTitle.textColor = AppColors.COLOR_ACCENT
        self.lbFirstTitle.numberOfLines = 0
        self.lbFirstText.numberOfLines = 0
        self.lbSecondText.numberOfLines = 0
        
        self.lbSecondTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_TITLE_FONT_SIZE_HELP)
        self.lbSecondTitle.textColor = AppColors.COLOR_ACCENT
        self.lbSecondTitle.numberOfLines = 0
        self.lbThirdText.numberOfLines = 0
        self.lbFourText.numberOfLines = 0
        
        setupEndedUpScrollView()
        setupNavItems()
        
    }
    func setupEndedUpScrollView(){
        viewBackground.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: imgThirdText.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor)
        ])
        self.view.layoutIfNeeded()
    }
    func setupNavItems() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
    }
}
