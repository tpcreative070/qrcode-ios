//
//  ContactGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ContactGenerateVC{
    func initUI(){
        
        
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
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND * 3.35)
        ])
        viewBackground.addSubview(viewFullNameContactBg)
        NSLayoutConstraint.activate([
            viewFullNameContactBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFullNameContactBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFullNameContactBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewFullNameContactBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewFullNameContactBg.addSubview(lbFullNameContact)
        NSLayoutConstraint.activate([
            lbFullNameContact.topAnchor.constraint(equalTo: viewFullNameContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFullNameContact.leadingAnchor.constraint(equalTo: viewFullNameContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFullNameContact.trailingAnchor.constraint(equalTo: viewFullNameContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewFullNameContactBg.addSubview(textFieldFullNameContact)
        NSLayoutConstraint.activate([
            textFieldFullNameContact.topAnchor.constraint(equalTo: lbFullNameContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldFullNameContact.leadingAnchor.constraint(equalTo: viewFullNameContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldFullNameContact.trailingAnchor.constraint(equalTo: viewFullNameContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewAddressContactBg)
        NSLayoutConstraint.activate([
            viewAddressContactBg.topAnchor.constraint(equalTo: viewFullNameContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewAddressContactBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewAddressContactBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewAddressContactBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewAddressContactBg.addSubview(lbAddressContact)
        NSLayoutConstraint.activate([
            lbAddressContact.topAnchor.constraint(equalTo: viewAddressContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbAddressContact.leadingAnchor.constraint(equalTo: viewAddressContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbAddressContact.trailingAnchor.constraint(equalTo: viewAddressContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewAddressContactBg.addSubview(textFieldAddressContact)
        NSLayoutConstraint.activate([
            textFieldAddressContact.topAnchor.constraint(equalTo: lbAddressContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldAddressContact.leadingAnchor.constraint(equalTo: viewAddressContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldAddressContact.trailingAnchor.constraint(equalTo: viewAddressContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewPhoneContactBg)
        NSLayoutConstraint.activate([
            viewPhoneContactBg.topAnchor.constraint(equalTo: viewAddressContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewPhoneContactBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPhoneContactBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewPhoneContactBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewPhoneContactBg.addSubview(lbPhoneContact)
        NSLayoutConstraint.activate([
            lbPhoneContact.topAnchor.constraint(equalTo: viewPhoneContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbPhoneContact.leadingAnchor.constraint(equalTo: viewPhoneContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbPhoneContact.trailingAnchor.constraint(equalTo: viewPhoneContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewPhoneContactBg.addSubview(textFieldPhoneContact)
        NSLayoutConstraint.activate([
            textFieldPhoneContact.topAnchor.constraint(equalTo: lbPhoneContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldPhoneContact.leadingAnchor.constraint(equalTo: viewPhoneContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldPhoneContact.trailingAnchor.constraint(equalTo: viewPhoneContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewEmailContactBg)
        NSLayoutConstraint.activate([
            viewEmailContactBg.topAnchor.constraint(equalTo: viewPhoneContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewEmailContactBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewEmailContactBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewEmailContactBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewEmailContactBg.addSubview(lbEmailContact)
        NSLayoutConstraint.activate([
            lbEmailContact.topAnchor.constraint(equalTo: viewEmailContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbEmailContact.leadingAnchor.constraint(equalTo: viewEmailContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbEmailContact.trailingAnchor.constraint(equalTo: viewEmailContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewEmailContactBg.addSubview(textFieldEmailContact)
        NSLayoutConstraint.activate([
            textFieldEmailContact.topAnchor.constraint(equalTo: lbEmailContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldEmailContact.leadingAnchor.constraint(equalTo: viewEmailContactBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldEmailContact.trailingAnchor.constraint(equalTo: viewEmailContactBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbFullNameContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbAddressContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbPhoneContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbEmailContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldFullNameContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldEmailContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldPhoneContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldAddressContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldEmailContact)
        addTarget(textFieldPhoneContact)
        addTarget(textFieldAddressContact)
        addTarget(textFieldFullNameContact)
        
    }
    
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Contact)
        let textAttributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
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
                self?.textFieldFullNameContact.errorMessage = errors[GenerateViewModelKey.FULLNAME_CONTACT] ?? ""
                self?.textFieldAddressContact.errorMessage = errors[GenerateViewModelKey.ADDRESS_CONTACT] ?? ""
                self?.textFieldPhoneContact.errorMessage = errors[GenerateViewModelKey.PHONE_CONTACT] ?? ""
                self?.textFieldEmailContact.errorMessage = errors[GenerateViewModelKey.EMAIL_CONTACT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldFullNameContact.errorMessage = ""
                    self?.textFieldAddressContact.errorMessage = ""
                    self?.textFieldPhoneContact.errorMessage = ""
                    self?.textFieldEmailContact.errorMessage = ""
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
                guard let fullName = (self?.textFieldFullNameContact.text), let address = (self?.textFieldAddressContact.text), let phone = (self?.textFieldPhoneContact.text), let email = (self?.textFieldEmailContact.text), let result = self?.generateViewModel?.result else {
                    return
                }
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: ContactModel(fullNameContact: fullName, addressContact: address, phoneContact: phone, emailContact: email))
                resVC.imgCode = result
                resVC.resultViewModel.typeCode = EnumType.CONTACT.rawValue
                if let isSeen = (self?.contactViewModel.isSeen), isSeen == AppConstants.ISSEEN {
                    guard let time = (self?.contactViewModel.createDateTime) else {
                        return
                    }
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = time
                    
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.phoneContactBinding.bind({ (value) in
            self.textFieldPhoneContact.text = value
        })
        
        generateViewModel?.fullNameContactBinding.bind({ (value) in
            self.textFieldFullNameContact.text = value
        })
        
        generateViewModel?.addressContactBinding.bind({ (value) in
            self.textFieldAddressContact.text = value
        })
        generateViewModel?.emailContactBinding.bind({ (value) in
            self.textFieldEmailContact.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = ""
    }
    
    
    private func clearDataTextfield() {
        
        self.textFieldFullNameContact.resignFirstResponder()
        self.textFieldEmailContact.resignFirstResponder()
        self.textFieldAddressContact.resignFirstResponder()
        self.textFieldPhoneContact.resignFirstResponder()
        self.textFieldPhoneContact.text = ""
        self.textFieldFullNameContact.text = ""
        self.textFieldEmailContact.text = ""
        self.textFieldAddressContact.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = ""
        
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.CONTACT.rawValue
        self.generateViewModel?.fullNameContact = textFieldFullNameContact.text
        self.generateViewModel?.emailContact = textFieldEmailContact.text
        self.generateViewModel?.addressContact = textFieldAddressContact.text
        self.generateViewModel?.phoneContact = textFieldPhoneContact.text
        
        
    }
    func checkIsSeenDetail(){
        if contactViewModel.isSeen == AppConstants.ISSEEN {
            textFieldFullNameContact.text = contactViewModel.fullNameContact ?? ""
            textFieldEmailContact.text = contactViewModel.emailContact ?? ""
            textFieldPhoneContact.text = contactViewModel.phoneContact ?? ""
            textFieldAddressContact.text = contactViewModel.addressContact ?? ""
        }
    }
    
}
extension ContactGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldAddressContact.delegate = self
        
        self.textFieldPhoneContact.delegate = self
        self.textFieldEmailContact.delegate = self
        self.textFieldFullNameContact.delegate = self
        
    }
}

extension ContactGenerateVC : SingleButtonDialogPresenter {
    
}
