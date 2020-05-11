//
//  RateVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import MessageUI

extension RateVC {
    func initUI(){
        view.backgroundColor = .clear
        view.tintColor = .clear
        self.view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        viewBackground.addSubview(wrapperView)
        NSLayoutConstraint.activate([
            wrapperView.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            wrapperView.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            //                  wrapperView.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT_SCAN),
            //                  wrapperView.rightAnchor.constraint(equalTo: viewBackground.rightAnchor * 2/3, constant: DeviceHelper.Shared.MARGIN_RIGHT_SCAN),
            wrapperView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2.7), wrapperView.widthAnchor.constraint(equalToConstant: view.frame.width * 2/3)
            
        ])
        wrapperView.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        wrapperView.addSubview(imgApp)
        NSLayoutConstraint.activate([
            imgApp.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            imgApp.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: AppConstants.MARGIN_TOP),
            imgApp.heightAnchor.constraint(equalToConstant: 50), imgApp.widthAnchor.constraint(equalToConstant: 50)
            
        ])
        imgApp.image = UIImage(named: AppImages.IC_LAUNCH)
        wrapperView.addSubview(lbContent)
        NSLayoutConstraint.activate([
            lbContent.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            lbContent.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT),
            lbContent.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT),
            lbContent.topAnchor.constraint(equalTo: imgApp.bottomAnchor, constant: AppConstants.MARGIN_TOP)
            
        ])
        lbContent.text = LanguageHelper.getTranslationByKey(LanguageKey.TapRating)
        lbContent.textAlignment = .center
        lbContent.numberOfLines = 0
        self.wrapperView.addSubview(self.viewUnderLine1)
        NSLayoutConstraint.activate([
            self.viewUnderLine1.topAnchor.constraint(equalTo: self.lbContent.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            self.viewUnderLine1.leadingAnchor.constraint(equalTo: self.wrapperView.leadingAnchor),
            self.viewUnderLine1.trailingAnchor.constraint(equalTo: self.wrapperView.trailingAnchor),
            self.viewUnderLine1.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLine1.backgroundColor = AppColors.GRAY_LIGHT_90
        wrapperView.addSubview(cosmosView)
        NSLayoutConstraint.activate([
            cosmosView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            cosmosView.topAnchor.constraint(equalTo: viewUnderLine1.bottomAnchor, constant: 15)
        ])
        self.wrapperView.addSubview(self.viewUnderLine2)
        NSLayoutConstraint.activate([
            self.viewUnderLine2.topAnchor.constraint(equalTo: self.cosmosView.bottomAnchor, constant: 15),
            self.viewUnderLine2.leadingAnchor.constraint(equalTo: self.wrapperView.leadingAnchor),
            self.viewUnderLine2.trailingAnchor.constraint(equalTo: self.wrapperView.trailingAnchor),
            self.viewUnderLine2.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLine2.backgroundColor = AppColors.GRAY_LIGHT_90
        wrapperView.addSubview(viewFooter)
        NSLayoutConstraint.activate([
            viewFooter.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
            viewFooter.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            viewFooter.rightAnchor.constraint(equalTo: wrapperView.rightAnchor),
            viewFooter.topAnchor.constraint(equalTo: viewUnderLine2.bottomAnchor)
            
        ])
        viewFooter.addSubview(lbNotNow)
        NSLayoutConstraint.activate([
            lbNotNow.centerXAnchor.constraint(equalTo: viewFooter.centerXAnchor),
            lbNotNow.leftAnchor.constraint(equalTo: viewFooter.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT),
            lbNotNow.rightAnchor.constraint(equalTo: viewFooter.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT),
            lbNotNow.topAnchor.constraint(equalTo: viewFooter.topAnchor, constant: AppConstants.MARGIN_TOP)
            
        ])
        lbNotNow.textAlignment = .center
        self.viewFooter.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doCancel(sender:))))
        viewFooter.isUserInteractionEnabled  = true
        self.cosmosView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doRating(sender:))))
        cosmosView.isUserInteractionEnabled  = true
        cosmosView.rating = 0
    }
    func configureMailController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([LanguageKey.Email_Help])
        mailComposerVC.setSubject(LanguageHelper.getTranslationByKey(LanguageKey.ImproveApp)!)
        mailComposerVC.setMessageBody("", isHTML: false)
        return mailComposerVC
    }
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message: LanguageHelper.getTranslationByKey(LanguageKey.CanNotSendMail), preferredStyle: .alert)
        let dismiss = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Ok), style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func setupFooter(){
        lbNotNow.isHidden = true

        self.viewFooter.layoutIfNeeded()
        self.viewFooter.addSubview(viewFooterCancel)
             NSLayoutConstraint.activate([
                 viewFooterCancel.leftAnchor.constraint(equalTo: viewFooter.leftAnchor),
                 viewFooterCancel.topAnchor.constraint(equalTo: viewFooter.topAnchor),
                 viewFooterCancel.bottomAnchor.constraint(equalTo: viewFooter.bottomAnchor),
                 viewFooterCancel.widthAnchor.constraint(equalToConstant: viewFooter.frame.width / 2),
             ])
        
        self.viewFooterCancel.addSubview(lbCancel)
        NSLayoutConstraint.activate([
            lbCancel.topAnchor.constraint(equalTo: viewFooterCancel.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbCancel.bottomAnchor.constraint(equalTo: viewFooterCancel.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM_ITEM),
            lbCancel.centerXAnchor.constraint(equalTo: viewFooterCancel.centerXAnchor)
            
        ])
        self.viewFooter.addSubview(viewFooterSubmit)
                    NSLayoutConstraint.activate([
                        viewFooterSubmit.trailingAnchor.constraint(equalTo: viewFooter.trailingAnchor),
                        viewFooterSubmit.topAnchor.constraint(equalTo: viewFooter.topAnchor),
                        viewFooterSubmit.bottomAnchor.constraint(equalTo: viewFooter.bottomAnchor),
                        viewFooterSubmit.widthAnchor.constraint(equalToConstant: viewFooter.frame.width / 2),

                        
                    ])
        self.viewFooterSubmit.addSubview(lbSubmit)
        NSLayoutConstraint.activate([
            lbSubmit.topAnchor.constraint(equalTo: viewFooterSubmit.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbSubmit.bottomAnchor.constraint(equalTo: viewFooterSubmit.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM_ITEM),
             lbSubmit.centerXAnchor.constraint(equalTo: viewFooterSubmit.centerXAnchor),
            
        ])
        self.viewFooter.addSubview(viewLine)
        NSLayoutConstraint.activate([
            
            viewLine.centerXAnchor.constraint(equalTo: viewFooter.centerXAnchor),
            
            viewLine.widthAnchor.constraint(equalToConstant: 1),
            self.viewLine.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BUTTON_DEFAULT)
            ])
        self.viewFooterSubmit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doSubmit(sender:))))
              viewFooterSubmit.isUserInteractionEnabled  = true
    }
}
