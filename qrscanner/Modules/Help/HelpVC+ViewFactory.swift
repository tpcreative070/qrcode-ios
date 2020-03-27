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
        view.backgroundColor = .white
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
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppConstants.MARGIN_RIGHT_HELP),
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
            imgFirstText.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_HELP)
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
                                imgSecondText.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_HELP)

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
                   imgThirdText.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_IMAGE_HELP)

                 ])
        
lbFirstTitle.text = "Scan BarCode And QRCode Via Camera"
       lbFirstText.text = "Barcode Scanner users the camera on your phone to read barcode and look up product information such as prices and reviews etc..."
       
       imgFirstText.image = UIImage(named: "bg1")
       lbSecondText.text = "It also reads 2D barcode such as QR Codes and Data Matrix. These can contain links to web numbers and email addresses, and more."
       lbSecondTitle.text = "Scan BarCode And QRCode From Gallery"
       lbThirdText.text = "Where the files was stored (Check item -> choose share icon)."
       imgSecondText.image = UIImage(named: "bg2")
       lbFourText.text = "Choose QR Scanner app (selec app -> waiting for great result)."
       imgThirdText.image = UIImage(named: "bg3")
       self.lbFirstTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
       self.lbFirstTitle.textColor = AppColors.COLOR_ACCENT
       self.lbFirstTitle.numberOfLines = 2
       
       self.lbFirstText.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
       self.lbFirstText.numberOfLines = 3
       
       self.lbSecondText.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
       self.lbSecondText.numberOfLines = 3
       
       self.lbSecondTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE_HELP)
       self.lbSecondTitle.textColor = AppColors.COLOR_ACCENT
       self.lbSecondTitle.numberOfLines = 2
       
       self.lbThirdText.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
       self.lbThirdText.numberOfLines = 2
       
       self.lbFourText.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
       self.lbFourText.numberOfLines = 2

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

        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
    }
}
