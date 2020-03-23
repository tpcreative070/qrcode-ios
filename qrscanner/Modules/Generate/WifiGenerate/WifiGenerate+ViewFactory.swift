//
//  WifiGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension WifiGenerateVC {
    func initUI() {
        let gety = view.frame.height * 4.2/7
        let value_item = view.frame.height/7
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        backgroundView.addSubview(ssidBg)
        NSLayoutConstraint.activate([
            ssidBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            ssidBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            ssidBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            ssidBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        ssidBg.addSubview(ssidLbL)
        NSLayoutConstraint.activate([
            ssidLbL.topAnchor.constraint(equalTo: ssidBg.topAnchor, constant: 10),
            ssidLbL.leadingAnchor.constraint(equalTo: ssidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            ssidLbL.trailingAnchor.constraint(equalTo: ssidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        ssidBg.addSubview(ssidTxt)
        NSLayoutConstraint.activate([
            ssidTxt.topAnchor.constraint(equalTo: ssidLbL.bottomAnchor, constant: 5),
            ssidTxt.leadingAnchor.constraint(equalTo: ssidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            ssidTxt.trailingAnchor.constraint(equalTo: ssidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(passBg)
        NSLayoutConstraint.activate([
            passBg.topAnchor.constraint(equalTo: ssidBg.bottomAnchor, constant: 10),
            passBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            passBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            passBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        passBg.addSubview(passLbL)
        NSLayoutConstraint.activate([
            passLbL.topAnchor.constraint(equalTo: passBg.topAnchor, constant: 10),
            passLbL.leadingAnchor.constraint(equalTo: passBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            passLbL.trailingAnchor.constraint(equalTo: passBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        passBg.addSubview(passTxt)
        NSLayoutConstraint.activate([
            passTxt.topAnchor.constraint(equalTo: passLbL.bottomAnchor, constant: 5),
            passTxt.leadingAnchor.constraint(equalTo: passBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            passTxt.trailingAnchor.constraint(equalTo: passBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        
        backgroundView.addSubview(protectBg)
        NSLayoutConstraint.activate([
            protectBg.topAnchor.constraint(equalTo: passBg.bottomAnchor, constant: 10),
            protectBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            protectBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            protectBg.heightAnchor.constraint(equalToConstant: value_item*1.6)
        ])
        WPAContainerView.addSubview(radioWPA)
        NSLayoutConstraint.activate([
            radioWPA.leadingAnchor.constraint(equalTo: WPAContainerView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
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
            WPAContainerView.topAnchor.constraint(equalTo: passBg.bottomAnchor, constant: 30),
            WPAContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60
            ),
            
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
            WEPContainerView.topAnchor.constraint(equalTo: WPAContainerView.bottomAnchor, constant: 30),
            WEPContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
            
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
            NoneContainerView.topAnchor.constraint(equalTo: WEPContainerView.bottomAnchor, constant: 30),
            NoneContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
            
        ])
        setupNavItems()
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Wifi
        self.viewModel?.ssid = ssidTxt.text
        self.viewModel?.password = passTxt.text
        if radioWPA.isSelected {
            self.viewModel?.protect = LanguageKey.WPA
        }
        else if radioWEP.isSelected {
            self.viewModel?.protect = LanguageKey.WEP
        }
        else
        {
            self.viewModel?.protect = LanguageKey.None
        }
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Wifi
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
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
            if errors.count > 0 {
                self?.ssidTxt.errorMessage = errors[GenerateViewModelKey.SSID] ?? ""
                self?.passTxt.errorMessage = errors[GenerateViewModelKey.PASSWORD] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.ssidTxt.errorMessage = ""
                    self?.passTxt.errorMessage = ""
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
                resVC.typeCode = LanguageKey.Wifi
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentModel(data: WifiModel(ssid: (self?.ssidTxt.text)!, password: (self?.passTxt.text)!, protect: (self?.viewModel?.protect)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.ssidBinding.bind({ (value) in
            self.ssidTxt.text = value
        })
        
        viewModel?.passwordBinding.bind({ (value) in
            self.passTxt.text = value
        })
        
        self.viewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
        
    }
    
    
    private func clearDataTextfield() {
        self.ssidTxt.resignFirstResponder()
        self.passTxt.resignFirstResponder()
        self.ssidTxt.text = ""
        self.passTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            ssidTxt.text = wifiValue.ssid ?? ""
            passTxt.text = wifiValue.password ?? ""
            if wifiValue.protect == LanguageKey.WPA{
                radioWEP.isSelected = false
                radioNone.isSelected = false
                radioWPA.isSelected = true
            }
            if wifiValue.protect == LanguageKey.WEP{
                radioWPA.isSelected = false
                radioNone.isSelected = false
                radioWEP.isSelected = true
            }
            if wifiValue.protect == LanguageKey.None{
                radioWEP.isSelected = false
                radioWPA.isSelected = false
                radioNone.isSelected = true
            }
        }
    }
}
extension WifiGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.ssidTxt.delegate = self
        self.passTxt.delegate = self
        
    }
}

extension WifiGenerateVC : SingleButtonDialogPresenter {
    
}
