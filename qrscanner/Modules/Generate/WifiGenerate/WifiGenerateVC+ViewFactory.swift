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
        view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        viewBackground.addSubview(viewSsidBg)
        NSLayoutConstraint.activate([
            viewSsidBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 10),
            viewSsidBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewSsidBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewSsidBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        viewSsidBg.addSubview(lbSsid)
        NSLayoutConstraint.activate([
            lbSsid.topAnchor.constraint(equalTo: viewSsidBg.topAnchor, constant: 10),
            lbSsid.leadingAnchor.constraint(equalTo: viewSsidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbSsid.trailingAnchor.constraint(equalTo: viewSsidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewSsidBg.addSubview(textFieldSsid)
        NSLayoutConstraint.activate([
            textFieldSsid.topAnchor.constraint(equalTo: lbSsid.bottomAnchor, constant: 5),
            textFieldSsid.leadingAnchor.constraint(equalTo: viewSsidBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldSsid.trailingAnchor.constraint(equalTo: viewSsidBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewPassBg)
        NSLayoutConstraint.activate([
            viewPassBg.topAnchor.constraint(equalTo: viewSsidBg.bottomAnchor, constant: 10),
            viewPassBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPassBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewPassBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewPassBg.addSubview(lbPass)
        NSLayoutConstraint.activate([
            lbPass.topAnchor.constraint(equalTo: viewPassBg.topAnchor, constant: 10),
            lbPass.leadingAnchor.constraint(equalTo: viewPassBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbPass.trailingAnchor.constraint(equalTo: viewPassBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewPassBg.addSubview(textFieldPass)
        NSLayoutConstraint.activate([
            textFieldPass.topAnchor.constraint(equalTo: lbPass.bottomAnchor, constant: 5),
            textFieldPass.leadingAnchor.constraint(equalTo: viewPassBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldPass.trailingAnchor.constraint(equalTo: viewPassBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        
        viewBackground.addSubview(viewProtectBg)
        NSLayoutConstraint.activate([
            viewProtectBg.topAnchor.constraint(equalTo: viewPassBg.bottomAnchor, constant: 10),
            viewProtectBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewProtectBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewProtectBg.heightAnchor.constraint(equalToConstant: value_item*1.6)
        ])
        viewWPAContainer.addSubview(radioWPA)
        NSLayoutConstraint.activate([
            radioWPA.leadingAnchor.constraint(equalTo: viewWPAContainer.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            radioWPA.topAnchor.constraint(equalTo: viewWPAContainer.topAnchor),
            radioWPA.bottomAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor),
        ])
        viewWPAContainer.addSubview(lbWPA)
        NSLayoutConstraint.activate([
            lbWPA.leftAnchor.constraint(equalTo: radioWPA.rightAnchor, constant : 5),
            lbWPA.topAnchor.constraint(equalTo: viewWPAContainer.topAnchor),
            lbWPA.bottomAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor),
            lbWPA.rightAnchor.constraint(equalTo: viewWPAContainer.rightAnchor)
        ])
        view.addSubview(viewWPAContainer)
        NSLayoutConstraint.activate([
            viewWPAContainer.topAnchor.constraint(equalTo: viewPassBg.bottomAnchor, constant: 30),
            viewWPAContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60
            ),
            
        ])
        viewWEPContainer.addSubview(radioWEP)
        NSLayoutConstraint.activate([
            radioWEP.leadingAnchor.constraint(equalTo: viewWEPContainer.leadingAnchor),
            radioWEP.topAnchor.constraint(equalTo: viewWEPContainer.topAnchor),
            radioWEP.bottomAnchor.constraint(equalTo: viewWEPContainer.bottomAnchor),
        ])
        viewWEPContainer.addSubview(lbWEP)
        NSLayoutConstraint.activate([
            lbWEP.leftAnchor.constraint(equalTo: radioWEP.rightAnchor, constant : 5),
            lbWEP.topAnchor.constraint(equalTo: viewWEPContainer.topAnchor),
            lbWEP.bottomAnchor.constraint(equalTo: viewWEPContainer.bottomAnchor),
            lbWEP.rightAnchor.constraint(equalTo: viewWEPContainer.rightAnchor)
        ])
        view.addSubview(viewWEPContainer)
        NSLayoutConstraint.activate([
            viewWEPContainer.topAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor, constant: 30),
            viewWEPContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
            
        ])
        viewNoneContainer.addSubview(radioNone)
        NSLayoutConstraint.activate([
            radioNone.leadingAnchor.constraint(equalTo: viewNoneContainer.leadingAnchor),
            radioNone.topAnchor.constraint(equalTo: viewNoneContainer.topAnchor),
            radioNone.bottomAnchor.constraint(equalTo: viewNoneContainer.bottomAnchor)
        ])
        viewNoneContainer.addSubview(lbNone)
        NSLayoutConstraint.activate([
            lbNone.leftAnchor.constraint(equalTo: radioNone.rightAnchor, constant : 5),
            lbNone.topAnchor.constraint(equalTo: viewNoneContainer.topAnchor),
            lbNone.bottomAnchor.constraint(equalTo: viewNoneContainer.bottomAnchor),
            lbNone.rightAnchor.constraint(equalTo: viewNoneContainer.rightAnchor)
        ])
        view.addSubview(viewNoneContainer)
        NSLayoutConstraint.activate([
            viewNoneContainer.topAnchor.constraint(equalTo: viewWEPContainer.bottomAnchor, constant: 30),
            viewNoneContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
            
        ])
        setupNavItems()
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Wifi
        self.viewModel?.ssid = textFieldSsid.text
        self.viewModel?.password = textFieldPass.text
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
                self?.textFieldSsid.errorMessage = errors[GenerateViewModelKey.SSID] ?? ""
                self?.textFieldPass.errorMessage = errors[GenerateViewModelKey.PASSWORD] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldSsid.errorMessage = ""
                    self?.textFieldPass.errorMessage = ""
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
                resVC.contentData = ContentViewModel(data: WifiModel(ssid: (self?.textFieldSsid.text)!, password: (self?.textFieldPass.text)!, protect: (self?.viewModel?.protect)!))
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
            self.textFieldSsid.text = value
        })
        
        viewModel?.passwordBinding.bind({ (value) in
            self.textFieldPass.text = value
        })
        
        self.viewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
        
    }
    
    
    private func clearDataTextfield() {
        self.textFieldSsid.resignFirstResponder()
        self.textFieldPass.resignFirstResponder()
        self.textFieldSsid.text = ""
        self.textFieldPass.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            textFieldSsid.text = wifiValue.ssid ?? ""
            textFieldPass.text = wifiValue.protect ?? ""
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
        self.textFieldSsid.delegate = self
        self.textFieldPass.delegate = self
        
    }
}

extension WifiGenerateVC : SingleButtonDialogPresenter {
    
}
