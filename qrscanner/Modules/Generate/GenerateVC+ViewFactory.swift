//
//  AddGenerateVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension GenerateVC {
    func initUI() {
        view.backgroundColor = .white
        setupNavItems()
        if typeCode == LanguageKey.Url{
            view.addSubview(urlTxt)
            NSLayoutConstraint.activate([
                urlTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                urlTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                urlTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(urlTxt)
        }
        else if typeCode == LanguageKey.Text{
            view.addSubview(textTxt)
            NSLayoutConstraint.activate([
                textTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                textTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                textTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(textTxt)
        }
        else if typeCode == LanguageKey.Location{
        }
        else if typeCode == LanguageKey.Email{
            view.addSubview(emailTxt)
            NSLayoutConstraint.activate([
                emailTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                emailTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                emailTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(objectEmailTxt)
            NSLayoutConstraint.activate([
                objectEmailTxt.topAnchor.constraint(equalTo: emailTxt.bottomAnchor, constant: 50),
                objectEmailTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                objectEmailTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(messageEmailTxt)
            NSLayoutConstraint.activate([
                messageEmailTxt.topAnchor.constraint(equalTo: objectEmailTxt.bottomAnchor, constant: 50),
                messageEmailTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                messageEmailTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(emailTxt)
            addTarget(objectEmailTxt)
            addTarget(messageEmailTxt)
        }
        else if typeCode == LanguageKey.Event{
        }
        else if typeCode == LanguageKey.Message{
            view.addSubview(toTxt)
            NSLayoutConstraint.activate([
                toTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                toTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                toTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(messageTxt)
            NSLayoutConstraint.activate([
                messageTxt.topAnchor.constraint(equalTo: toTxt.bottomAnchor, constant: 30),
                messageTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                messageTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(toTxt)
            addTarget(messageTxt)
        }
        else if typeCode == LanguageKey.Wifi{
            view.addSubview(SSIDTxt)
            NSLayoutConstraint.activate([
                SSIDTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                SSIDTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                SSIDTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(passWordTxt)
            NSLayoutConstraint.activate([
                passWordTxt.topAnchor.constraint(equalTo: SSIDTxt.bottomAnchor, constant: 30),
                passWordTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                passWordTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            WPAContainerView.addSubview(radioWPA)
            NSLayoutConstraint.activate([
                radioWPA.leadingAnchor.constraint(equalTo: WPAContainerView.leadingAnchor),
                radioWPA.topAnchor.constraint(equalTo: WPAContainerView.topAnchor),
                radioWPA.bottomAnchor.constraint(equalTo: WPAContainerView.bottomAnchor),
            ])
            WPAContainerView.addSubview(WPALabel)
            NSLayoutConstraint.activate([
                WPALabel.leftAnchor.constraint(equalTo: radioWPA.rightAnchor, constant : 5),
                WPALabel.topAnchor.constraint(equalTo: WPAContainerView.topAnchor),
                WPALabel.bottomAnchor.constraint(equalTo: WPAContainerView.bottomAnchor),
                WPALabel.rightAnchor.constraint(equalTo: WPAContainerView.rightAnchor)
            ])
            view.addSubview(WPAContainerView)
            NSLayoutConstraint.activate([
                WPAContainerView.topAnchor.constraint(equalTo: passWordTxt.bottomAnchor, constant: 30),
                WPAContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                
            ])
            WEPContainerView.addSubview(radioWEP)
            NSLayoutConstraint.activate([
                radioWEP.leadingAnchor.constraint(equalTo: WEPContainerView.leadingAnchor),
                radioWEP.topAnchor.constraint(equalTo: WEPContainerView.topAnchor),
                radioWEP.bottomAnchor.constraint(equalTo: WEPContainerView.bottomAnchor),
            ])
            WEPContainerView.addSubview(WEPLabel)
            NSLayoutConstraint.activate([
                WEPLabel.leftAnchor.constraint(equalTo: radioWEP.rightAnchor, constant : 5),
                WEPLabel.topAnchor.constraint(equalTo: WEPContainerView.topAnchor),
                WEPLabel.bottomAnchor.constraint(equalTo: WEPContainerView.bottomAnchor),
                WEPLabel.rightAnchor.constraint(equalTo: WEPContainerView.rightAnchor)
            ])
            view.addSubview(WEPContainerView)
            NSLayoutConstraint.activate([
                WEPContainerView.topAnchor.constraint(equalTo: passWordTxt.bottomAnchor, constant: 30),
                WEPContainerView.leadingAnchor.constraint(equalTo: WPAContainerView.leadingAnchor, constant: 100)
                
            ])
            NoneContainerView.addSubview(radioNone)
            NSLayoutConstraint.activate([
                radioNone.leadingAnchor.constraint(equalTo: NoneContainerView.leadingAnchor),
                radioNone.topAnchor.constraint(equalTo: NoneContainerView.topAnchor),
                radioNone.bottomAnchor.constraint(equalTo: NoneContainerView.bottomAnchor)
            ])
            NoneContainerView.addSubview(noneLabel)
            NSLayoutConstraint.activate([
                noneLabel.leftAnchor.constraint(equalTo: radioNone.rightAnchor, constant : 5),
                noneLabel.topAnchor.constraint(equalTo: NoneContainerView.topAnchor),
                noneLabel.bottomAnchor.constraint(equalTo: NoneContainerView.bottomAnchor),
                noneLabel.rightAnchor.constraint(equalTo: NoneContainerView.rightAnchor)
            ])
            view.addSubview(NoneContainerView)
            NSLayoutConstraint.activate([
                NoneContainerView.topAnchor.constraint(equalTo: passWordTxt.bottomAnchor, constant: 30),
                NoneContainerView.leadingAnchor.constraint(equalTo: WEPContainerView.leadingAnchor, constant: 100)
                
            ])
            
        }
        else if typeCode == LanguageKey.Telephone{
            view.addSubview(phoneTelephoneTxt)
            NSLayoutConstraint.activate([
                phoneTelephoneTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                phoneTelephoneTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                phoneTelephoneTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(phoneTelephoneTxt)
        }
        else if typeCode == LanguageKey.Contact{
            view.addSubview(fullNameContactTxt)
            NSLayoutConstraint.activate([
                fullNameContactTxt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                fullNameContactTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                fullNameContactTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(addressContactTxt)
            NSLayoutConstraint.activate([
                addressContactTxt.topAnchor.constraint(equalTo: fullNameContactTxt.bottomAnchor, constant: 50),
                addressContactTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                addressContactTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(phoneContactTxt)
            NSLayoutConstraint.activate([
                phoneContactTxt.topAnchor.constraint(equalTo: addressContactTxt.bottomAnchor, constant: 50),
                phoneContactTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                phoneContactTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            view.addSubview(emailContactTxt)
            NSLayoutConstraint.activate([
                emailContactTxt.topAnchor.constraint(equalTo: phoneContactTxt.bottomAnchor, constant: 50),
                emailContactTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                emailContactTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            addTarget(fullNameContactTxt)
            addTarget(addressContactTxt)
            addTarget(phoneContactTxt)
            addTarget(emailContactTxt)
            
        }
        else
        {
        }
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = typeCode
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        viewModel?.errorMessages.bind({ [weak self] errors in
            if (self?.typeCode == LanguageKey.Url){
                print(errors.count)
                if errors.count > 0
                {
                    self?.urlTxt.errorMessage = errors[GenerateViewModelKey.URL] ?? ""
                }
                else {
                    if errors.count == 0{
                        self?.urlTxt.errorMessage = ""
                    }
                }
                
            }
            else if self?.typeCode == LanguageKey.Text{
                if errors.count > 0 {
                    self?.textTxt.errorMessage = errors[GenerateViewModelKey.TEXT] ?? ""}
                else {
                    if errors.count == 0{
                        self?.textTxt.errorMessage = ""
                    }
                }
                
            }
            else if self?.typeCode == LanguageKey.Location{
                
            }
            else if self?.typeCode == LanguageKey.Email{
                if errors.count > 0 {
                    self?.emailTxt.errorMessage = errors[GenerateViewModelKey.EMAIL] ?? ""
                    self?.objectEmailTxt.errorMessage = errors[GenerateViewModelKey.OBJECT_EMAIL] ?? ""
                    self?.messageEmailTxt.errorMessage = errors[GenerateViewModelKey.MESSAGE_EMAIL] ?? ""
                }
                    
                else {
                    if errors.count == 0{
                        self?.emailTxt.errorMessage = ""
                        self?.objectEmailTxt.errorMessage = ""
                        self?.messageEmailTxt.errorMessage = ""
                    }
                }
                
            }
            else if self?.typeCode == LanguageKey.Event{
            }
            else if self?.typeCode == LanguageKey.Message{
                if errors.count > 0 {
                    self?.toTxt.errorMessage = errors[GenerateViewModelKey.TO] ?? ""
                    self?.messageTxt.errorMessage = errors[GenerateViewModelKey.MESSAGE] ?? ""
                    
                }
                    
                else {
                    if errors.count == 0{
                        self?.toTxt.errorMessage = ""
                        self?.messageTxt.errorMessage = ""
                    }
                }
                
            }
            else if self?.typeCode == LanguageKey.Wifi{
            }
            else if self?.typeCode == LanguageKey.Telephone{
                if errors.count > 0 {
                    self?.phoneTelephoneTxt.errorMessage = errors[GenerateViewModelKey.PHONE_TELEPHONE] ?? ""
                    
                    
                }
                    
                else {
                    if errors.count == 0{
                        self?.phoneTelephoneTxt.errorMessage = ""
                    }
                }
                
                
            }
            else if self?.typeCode == LanguageKey.Contact{
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
                
            }
            else {
                
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
                resVC.imgCode = (self?.viewModel?.result)!
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        if (self.typeCode == LanguageKey.Url){
            viewModel?.urlBinding.bind({ (value) in
                self.urlTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
        }
        else if self.typeCode == LanguageKey.Text{
            viewModel?.textBinding.bind({ (value) in
                self.textTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
        }
        else if self.typeCode == LanguageKey.Location{
        }
        else if self.typeCode == LanguageKey.Email{
            viewModel?.emailBinding.bind({ (value) in
                self.emailTxt.text = value
            })
            
            viewModel?.objectEmailBinding.bind({ (value) in
                self.objectEmailTxt.text = value
            })
            
            viewModel?.messageEmailBinding.bind({ (value) in
                self.messageEmailTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
        }
        else if self.typeCode == LanguageKey.Event{
        }
        else if self.typeCode == LanguageKey.Message{
            viewModel?.toBinding.bind({ (value) in
                self.toTxt.text = value
            })
            
            viewModel?.messageBinding.bind({ (value) in
                self.messageTxt.text = value
            })
            
            self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
            
            
        }
        else if self.typeCode == LanguageKey.Wifi{
            
        }
        else if self.typeCode == LanguageKey.Telephone{
            viewModel?.phoneTelephoneBinding.bind({ (value) in
                self.fullNameContactTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
            
        }
        else {
            viewModel?.fullNameContactBinding.bind({ (value) in
                self.fullNameContactTxt.text = value
            })
            viewModel?.addressContactBinding.bind({ (value) in
                self.addressContactTxt.text = value
            })
            viewModel?.phoneContactBinding.bind({ (value) in
                self.phoneContactTxt.text = value
            })
            viewModel?.emailContactBinding.bind({ (value) in
                self.emailContactTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.FULLNAME_CONTACT] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.ADDRESS_CONTACT] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_CONTACT] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL_CONTACT] = ""
            
        }
        
        
    }
    
    
    private func clearDataTextfield() {
        
        self.toTxt.resignFirstResponder()
        self.messageTxt.resignFirstResponder()
        self.toTxt.text = ""
        self.messageTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
    }
    
}
extension GenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.urlTxt.delegate = self
        // self.textTxt.delegate = self
        
    }
}

extension GenerateVC : SingleButtonDialogPresenter {
    
}
