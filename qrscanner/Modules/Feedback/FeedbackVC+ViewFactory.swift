//
//  FeedbackVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 5/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit


extension FeedbackVC {
    func initUI() {
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        scrollView.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: AppConstants.MARGIN_TOP),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
        ])
        viewBackground.addSubview(lbObjectEmail)
        NSLayoutConstraint.activate([
            lbObjectEmail.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbObjectEmail.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            lbObjectEmail.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor)
        ])
        viewBackground.addSubview(lbObjectEmailContent)
        NSLayoutConstraint.activate([
            lbObjectEmailContent.topAnchor.constraint(equalTo: lbObjectEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbObjectEmailContent.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            lbObjectEmailContent.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            lbObjectEmailContent.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        viewBackground.addSubview(lbEmail)
        NSLayoutConstraint.activate([
            lbEmail.topAnchor.constraint(equalTo: lbObjectEmailContent.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            lbEmail.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            lbEmail.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor)
        ])
        view.addSubview(textFieldEmail)
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: lbEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            textFieldEmail.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
        ])
        
        viewBackground.addSubview(lbMessageEmail)
        NSLayoutConstraint.activate([
            lbMessageEmail.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            lbMessageEmail.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            lbMessageEmail.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor)
        ])
        view.addSubview(textViewContent)
        NSLayoutConstraint.activate([
            textViewContent.topAnchor.constraint(equalTo: lbMessageEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            textViewContent.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            textViewContent.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            textViewContent.heightAnchor.constraint(equalToConstant: 200)
        ])
        viewBackground.addSubview(btnSend)
        NSLayoutConstraint.activate([
            btnSend.topAnchor.constraint(equalTo: textViewContent.bottomAnchor, constant: AppConstants.MARGIN_TOP),
            btnSend.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            btnSend.heightAnchor.constraint(equalToConstant: 50),
            btnSend.widthAnchor.constraint(equalToConstant: 200)
        ])
        self.lbEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbObjectEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbObjectEmailContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.lbMessageEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textViewContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.lbEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Email)
        self.lbObjectEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Subject)
        self.lbObjectEmailContent.text = LanguageHelper.getTranslationByKey(LanguageKey.ImproveApp)
        self.lbMessageEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Content)
        self.textViewContent.isScrollEnabled =  true
        
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        
        setupNavItems()
        addTarget(textFieldEmail)
        btnSend.addTarget(self, action: #selector(doSend), for: .touchUpInside)
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.FeedBack)
        let textAttributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        
        
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        
    }
    
}
extension FeedbackVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func setupDelegate() {
        self.textFieldEmail.delegate = self
        
    }
}


