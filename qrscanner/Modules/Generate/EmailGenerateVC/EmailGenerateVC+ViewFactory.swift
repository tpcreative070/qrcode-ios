//
//  EmailGenerateVC+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension EmailGenerateVC {
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
            viewBackground.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND * 2.55)
        ])
        viewBackground.addSubview(viewEmailBg)
        NSLayoutConstraint.activate([
            viewEmailBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewEmailBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewEmailBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewEmailBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewEmailBg.addSubview(lbEmail)
        NSLayoutConstraint.activate([
            lbEmail.topAnchor.constraint(equalTo: viewEmailBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbEmail.leadingAnchor.constraint(equalTo: viewEmailBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbEmail.trailingAnchor.constraint(equalTo: viewEmailBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewEmailBg.addSubview(textFieldEmail)
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: lbEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldEmail.leadingAnchor.constraint(equalTo: viewEmailBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldEmail.trailingAnchor.constraint(equalTo: viewEmailBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewObjectEmailBg)
        NSLayoutConstraint.activate([
            viewObjectEmailBg.topAnchor.constraint(equalTo: viewEmailBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewObjectEmailBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewObjectEmailBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewObjectEmailBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewObjectEmailBg.addSubview(lbObjectEmail)
        NSLayoutConstraint.activate([
            lbObjectEmail.topAnchor.constraint(equalTo: viewObjectEmailBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbObjectEmail.leadingAnchor.constraint(equalTo: viewObjectEmailBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbObjectEmail.trailingAnchor.constraint(equalTo: viewObjectEmailBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewObjectEmailBg.addSubview(textFieldObjectEmail)
        NSLayoutConstraint.activate([
            textFieldObjectEmail.topAnchor.constraint(equalTo: lbObjectEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldObjectEmail.leadingAnchor.constraint(equalTo: viewObjectEmailBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldObjectEmail.trailingAnchor.constraint(equalTo: viewObjectEmailBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewMessageBg)
        NSLayoutConstraint.activate([
            viewMessageBg.topAnchor.constraint(equalTo: viewObjectEmailBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewMessageBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewMessageBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewMessageBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewMessageBg.addSubview(lbMessageEmail)
        NSLayoutConstraint.activate([
            lbMessageEmail.topAnchor.constraint(equalTo: viewMessageBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbMessageEmail.leadingAnchor.constraint(equalTo: viewMessageBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbMessageEmail.trailingAnchor.constraint(equalTo: viewMessageBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewMessageBg.addSubview(textFieldMessageEmail)
        NSLayoutConstraint.activate([
            textFieldMessageEmail.topAnchor.constraint(equalTo: lbMessageEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldMessageEmail.leadingAnchor.constraint(equalTo: viewMessageBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldMessageEmail.trailingAnchor.constraint(equalTo: viewMessageBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        self.lbEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbObjectEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbMessageEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldMessageEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldObjectEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.EmailAddress)
        self.lbObjectEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Object)
        self.lbMessageEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Message)
        
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldEmail)
        addTarget(textFieldObjectEmail)
        addTarget(textFieldMessageEmail)
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Email)
        let textAttributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        
        
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        let menuButtonRight = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRight.setBackgroundImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchDown)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButtonRight)
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            
            if errors.count > 0 {
                self?.textFieldEmail.errorMessage = errors[GenerateViewModelKey.EMAIL] ?? ""
                self?.textFieldObjectEmail.errorMessage = errors[GenerateViewModelKey.OBJECT_EMAIL] ?? ""
                self?.textFieldMessageEmail.errorMessage = errors[GenerateViewModelKey.MESSAGE_EMAIL] ?? ""
            }
                
            else {
                if errors.count == 0{
                    self?.textFieldEmail.errorMessage = ""
                    self?.textFieldObjectEmail.errorMessage = ""
                    self?.textFieldMessageEmail.errorMessage = ""
                }
            }
            
            
        })
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        generateViewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                guard let email = (self?.textFieldEmail.text), let object = (self?.textFieldObjectEmail.text), let mess = (self?.textFieldMessageEmail.text), let result = self?.generateViewModel?.result else {
                    return
                }
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: EmailModel(email: email, objectEmail: object, messageEmail: mess))
                resVC.imgCode = result
                resVC.resultViewModel.typeCode = EnumType.EMAIL.rawValue
                if let isSeen = (self?.emailViewModel.isSeen), isSeen == AppConstants.ISSEEN {
                    guard let time = (self?.emailViewModel.createDateTime) else {
                        return
                    }
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = time
                    
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.emailBinding.bind({ (value) in
            self.textFieldEmail.text = value
        })
        
        generateViewModel?.objectEmailBinding.bind({ (value) in
            self.textFieldObjectEmail.text = value
        })
        
        generateViewModel?.messageEmailBinding.bind({ (value) in
            self.textFieldMessageEmail.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
        
    }
    private func clearDataTextfield() {
        self.textFieldEmail.resignFirstResponder()
        self.textFieldObjectEmail.resignFirstResponder()
        self.textFieldMessageEmail.resignFirstResponder()
        
        self.textFieldEmail.text = ""
        self.textFieldObjectEmail.text = ""
        self.textFieldMessageEmail.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
        
    }
    func checkIsSeenDetail(){
        if emailViewModel.isSeen == AppConstants.ISSEEN {
            self.textFieldEmail.text = emailViewModel.email ?? ""
            self.textFieldObjectEmail.text = emailViewModel.objectEmail ?? ""
            self.textFieldMessageEmail.text = emailViewModel.messageEmail ?? ""
        }
    }
}
extension EmailGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func setupDelegate() {
        self.textFieldEmail.delegate = self
        self.textFieldObjectEmail.delegate = self
        self.textFieldMessageEmail.delegate = self
        
    }
}

extension EmailGenerateVC : SingleButtonDialogPresenter {
    
}
