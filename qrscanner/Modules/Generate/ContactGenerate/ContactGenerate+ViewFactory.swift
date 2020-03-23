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
        let gety = view.frame.height * 4.5/7
        let value_item = view.frame.height/7
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: gety)
        ])
        backgroundView.addSubview(fullNameContactBg)
        NSLayoutConstraint.activate([
            fullNameContactBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            fullNameContactBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            fullNameContactBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            fullNameContactBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        fullNameContactBg.addSubview(fullNameContactLbL)
        NSLayoutConstraint.activate([
            fullNameContactLbL.topAnchor.constraint(equalTo: fullNameContactBg.topAnchor, constant: 10),
            fullNameContactLbL.leadingAnchor.constraint(equalTo: fullNameContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            fullNameContactLbL.trailingAnchor.constraint(equalTo: fullNameContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        fullNameContactBg.addSubview(fullNameContactTxt)
        NSLayoutConstraint.activate([
            fullNameContactTxt.topAnchor.constraint(equalTo: fullNameContactLbL.bottomAnchor, constant: 5),
            fullNameContactTxt.leadingAnchor.constraint(equalTo: fullNameContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            fullNameContactTxt.trailingAnchor.constraint(equalTo: fullNameContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        backgroundView.addSubview(AddressContactBg)
        NSLayoutConstraint.activate([
            AddressContactBg.topAnchor.constraint(equalTo: fullNameContactBg.bottomAnchor, constant: 10),
            AddressContactBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            AddressContactBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            AddressContactBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        AddressContactBg.addSubview(addressContactLbL)
        NSLayoutConstraint.activate([
            addressContactLbL.topAnchor.constraint(equalTo: AddressContactBg.topAnchor, constant: 10),
            addressContactLbL.leadingAnchor.constraint(equalTo: AddressContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            addressContactLbL.trailingAnchor.constraint(equalTo: AddressContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        AddressContactBg.addSubview(addressContactTxt)
        NSLayoutConstraint.activate([
            addressContactTxt.topAnchor.constraint(equalTo: addressContactLbL.bottomAnchor, constant: 5),
            addressContactTxt.leadingAnchor.constraint(equalTo: AddressContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            addressContactTxt.trailingAnchor.constraint(equalTo: AddressContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        backgroundView.addSubview(PhoneContactBg)
        NSLayoutConstraint.activate([
            PhoneContactBg.topAnchor.constraint(equalTo: AddressContactBg.bottomAnchor, constant: 10),
            PhoneContactBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            PhoneContactBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            PhoneContactBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        PhoneContactBg.addSubview(phoneContactLbL)
        NSLayoutConstraint.activate([
            phoneContactLbL.topAnchor.constraint(equalTo: PhoneContactBg.topAnchor, constant: 10),
            phoneContactLbL.leadingAnchor.constraint(equalTo: PhoneContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            phoneContactLbL.trailingAnchor.constraint(equalTo: PhoneContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        PhoneContactBg.addSubview(phoneContactTxt)
        NSLayoutConstraint.activate([
            phoneContactTxt.topAnchor.constraint(equalTo: phoneContactLbL.bottomAnchor, constant: 5),
            phoneContactTxt.leadingAnchor.constraint(equalTo: PhoneContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            phoneContactTxt.trailingAnchor.constraint(equalTo: PhoneContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(EmailContactBg)
        NSLayoutConstraint.activate([
            EmailContactBg.topAnchor.constraint(equalTo: PhoneContactBg.bottomAnchor, constant: 10),
            EmailContactBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            EmailContactBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            EmailContactBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        EmailContactBg.addSubview(emailContactLbL)
        NSLayoutConstraint.activate([
            emailContactLbL.topAnchor.constraint(equalTo: EmailContactBg.topAnchor, constant: 10),
            emailContactLbL.leadingAnchor.constraint(equalTo: EmailContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            emailContactLbL.trailingAnchor.constraint(equalTo: EmailContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        EmailContactBg.addSubview(emailContactTxt)
        NSLayoutConstraint.activate([
            emailContactTxt.topAnchor.constraint(equalTo: emailContactLbL.bottomAnchor, constant: 5),
            emailContactTxt.leadingAnchor.constraint(equalTo: EmailContactBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            emailContactTxt.trailingAnchor.constraint(equalTo: EmailContactBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        setupNavItems()
    }
    
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = LanguageKey.Contact
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        
        self.navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        viewModel?.errorMessages.bind({ [weak self] errors in
            
            if errors.count > 0 {
                self?.fullNameContactTxt.errorMessage = errors[GenerateViewModelKey.FULLNAME_CONTACT] ?? ""
                self?.addressContactTxt.errorMessage = errors[GenerateViewModelKey.ADDRESS_CONTACT] ?? ""
                self?.phoneContactTxt.errorMessage = errors[GenerateViewModelKey.PHONE_CONTACT] ?? ""
                self?.emailContactTxt.errorMessage = errors[GenerateViewModelKey.EMAIL_CONTACT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.fullNameContactTxt.errorMessage = ""
                    self?.addressContactTxt.errorMessage = ""
                    self?.phoneContactTxt.errorMessage = ""
                    self?.emailContactTxt.errorMessage = ""
                }
            }
        })
        viewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        viewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.typeCode = LanguageKey.Contact
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentModel(data: ContactModel(fullNameContact: (self?.fullNameContactTxt.text)!, addressContact: (self?.addressContactTxt.text)!, phoneContact: (self?.phoneContactTxt.text)!, emailContact: (self?.emailContactTxt.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.phoneContactBinding.bind({ (value) in
            self.phoneContactTxt.text = value
        })
        
        viewModel?.fullNameContactBinding.bind({ (value) in
            self.fullNameContactTxt.text = value
        })
        
        viewModel?.addressContactBinding.bind({ (value) in
            self.addressContactTxt.text = value
        })
        viewModel?.emailContactBinding.bind({ (value) in
            self.emailContactTxt.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = ""
    }
    
    
    private func clearDataTextfield() {
        
        self.fullNameContactTxt.resignFirstResponder()
        self.emailContactTxt.resignFirstResponder()
        self.addressContactTxt.resignFirstResponder()
        self.phoneContactTxt.resignFirstResponder()
        self.phoneContactTxt.text = ""
        self.fullNameContactTxt.text = ""
        self.emailContactTxt.text = ""
        self.addressContactTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = ""
        
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Contact
        self.viewModel?.fullNameContact = fullNameContactTxt.text
        self.viewModel?.emailContact = emailContactTxt.text
        self.viewModel?.addressContact = addressContactTxt.text
        self.viewModel?.phoneContact = phoneContactTxt.text
        
        
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            fullNameContactTxt.text = contactValue.fullNameContact ?? ""
            emailContactTxt.text = contactValue.emailContact ?? ""
            phoneContactTxt.text = contactValue.phoneContact ?? ""
            addressContactTxt.text = contactValue.addressContact ?? ""
        }
    }
    
}
extension ContactGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.addressContactTxt.delegate = self
        
        self.phoneContactTxt.delegate = self
        self.emailContactTxt.delegate = self
        self.fullNameContactTxt.delegate = self
        
    }
}

extension ContactGenerateVC : SingleButtonDialogPresenter {
    
}
