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
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND * 3.3)
        ])
        viewBackground.addSubview(viewFullNameContactBg)
        NSLayoutConstraint.activate([
            viewFullNameContactBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFullNameContactBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFullNameContactBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewFullNameContactBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewFullNameContactBg.addSubview(lbFullNameContact)
        NSLayoutConstraint.activate([
            lbFullNameContact.topAnchor.constraint(equalTo: viewFullNameContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFullNameContact.leadingAnchor.constraint(equalTo: viewFullNameContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFullNameContact.trailingAnchor.constraint(equalTo: viewFullNameContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewFullNameContactBg.addSubview(textFieldFullNameContact)
        NSLayoutConstraint.activate([
            textFieldFullNameContact.topAnchor.constraint(equalTo: lbFullNameContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldFullNameContact.leadingAnchor.constraint(equalTo: viewFullNameContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldFullNameContact.trailingAnchor.constraint(equalTo: viewFullNameContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewAddressContactBg)
        NSLayoutConstraint.activate([
            viewAddressContactBg.topAnchor.constraint(equalTo: viewFullNameContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewAddressContactBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewAddressContactBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewAddressContactBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewAddressContactBg.addSubview(lbAddressContact)
        NSLayoutConstraint.activate([
            lbAddressContact.topAnchor.constraint(equalTo: viewAddressContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbAddressContact.leadingAnchor.constraint(equalTo: viewAddressContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbAddressContact.trailingAnchor.constraint(equalTo: viewAddressContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewAddressContactBg.addSubview(textFieldAddressContact)
        NSLayoutConstraint.activate([
            textFieldAddressContact.topAnchor.constraint(equalTo: lbAddressContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldAddressContact.leadingAnchor.constraint(equalTo: viewAddressContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldAddressContact.trailingAnchor.constraint(equalTo: viewAddressContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewPhoneContactBg)
        NSLayoutConstraint.activate([
            viewPhoneContactBg.topAnchor.constraint(equalTo: viewAddressContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewPhoneContactBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPhoneContactBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewPhoneContactBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewPhoneContactBg.addSubview(lbPhoneContact)
        NSLayoutConstraint.activate([
            lbPhoneContact.topAnchor.constraint(equalTo: viewPhoneContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbPhoneContact.leadingAnchor.constraint(equalTo: viewPhoneContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbPhoneContact.trailingAnchor.constraint(equalTo: viewPhoneContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewPhoneContactBg.addSubview(textFieldPhoneContact)
        NSLayoutConstraint.activate([
            textFieldPhoneContact.topAnchor.constraint(equalTo: lbPhoneContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldPhoneContact.leadingAnchor.constraint(equalTo: viewPhoneContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldPhoneContact.trailingAnchor.constraint(equalTo: viewPhoneContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewEmailContactBg)
        NSLayoutConstraint.activate([
            viewEmailContactBg.topAnchor.constraint(equalTo: viewPhoneContactBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewEmailContactBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewEmailContactBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewEmailContactBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewEmailContactBg.addSubview(lbEmailContact)
        NSLayoutConstraint.activate([
            lbEmailContact.topAnchor.constraint(equalTo: viewEmailContactBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbEmailContact.leadingAnchor.constraint(equalTo: viewEmailContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbEmailContact.trailingAnchor.constraint(equalTo: viewEmailContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewEmailContactBg.addSubview(textFieldEmailContact)
        NSLayoutConstraint.activate([
            textFieldEmailContact.topAnchor.constraint(equalTo: lbEmailContact.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldEmailContact.leadingAnchor.constraint(equalTo: viewEmailContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldEmailContact.trailingAnchor.constraint(equalTo: viewEmailContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbFullNameContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbAddressContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbPhoneContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbEmailContact.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
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
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Contact)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchDown)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
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
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: ContactModel(fullNameContact: (self?.textFieldFullNameContact.text)!, addressContact: (self?.textFieldAddressContact.text)!, phoneContact: (self?.textFieldPhoneContact.text)!, emailContact: (self?.textFieldEmailContact.text)!))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.CONTACT.rawValue
                if (self?.contactViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.contactViewModel.createDateTime)!
                    
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
