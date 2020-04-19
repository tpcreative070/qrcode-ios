//
//  WifiGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by MacAppConstants.MARGIN_TOP_ITEM on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension WifiGenerateVC {
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
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND * 3.1)
        ])
        viewBackground.addSubview(viewSsidBg)
        NSLayoutConstraint.activate([
            viewSsidBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewSsidBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewSsidBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
              viewSsidBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewSsidBg.addSubview(lbSsid)
        NSLayoutConstraint.activate([
            lbSsid.topAnchor.constraint(equalTo: viewSsidBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbSsid.leadingAnchor.constraint(equalTo: viewSsidBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbSsid.trailingAnchor.constraint(equalTo: viewSsidBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewSsidBg.addSubview(textFieldSsid)
        NSLayoutConstraint.activate([
            textFieldSsid.topAnchor.constraint(equalTo: lbSsid.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldSsid.leadingAnchor.constraint(equalTo: viewSsidBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldSsid.trailingAnchor.constraint(equalTo: viewSsidBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewPassBg)
        NSLayoutConstraint.activate([
            viewPassBg.topAnchor.constraint(equalTo: viewSsidBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewPassBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPassBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewPassBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewPassBg.addSubview(lbPass)
        NSLayoutConstraint.activate([
            lbPass.topAnchor.constraint(equalTo: viewPassBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbPass.leadingAnchor.constraint(equalTo: viewPassBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbPass.trailingAnchor.constraint(equalTo: viewPassBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewPassBg.addSubview(textFieldPass)
        NSLayoutConstraint.activate([
            textFieldPass.topAnchor.constraint(equalTo: lbPass.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldPass.leadingAnchor.constraint(equalTo: viewPassBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldPass.trailingAnchor.constraint(equalTo: viewPassBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        
        viewBackground.addSubview(viewProtectBg)
        NSLayoutConstraint.activate([
            viewProtectBg.topAnchor.constraint(equalTo: viewPassBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewProtectBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewProtectBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewProtectBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM * 1.75)
        ])
        viewWPAContainer.addSubview(radioWPA)
        NSLayoutConstraint.activate([
            radioWPA.leadingAnchor.constraint(equalTo: viewWPAContainer.leadingAnchor),
            radioWPA.topAnchor.constraint(equalTo: viewWPAContainer.topAnchor),
            radioWPA.bottomAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor),
        ])
        viewWPAContainer.addSubview(lbWPA)
        NSLayoutConstraint.activate([
            lbWPA.leftAnchor.constraint(equalTo: radioWPA.rightAnchor, constant : AppConstants.MARGIN_TOP_SUBITEM),
            lbWPA.topAnchor.constraint(equalTo: viewWPAContainer.topAnchor),
            lbWPA.bottomAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor),
            lbWPA.rightAnchor.constraint(equalTo: viewWPAContainer.rightAnchor)
        ])
        view.addSubview(viewWPAContainer)
        NSLayoutConstraint.activate([
            viewWPAContainer.topAnchor.constraint(equalTo: viewPassBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_CONTAINER),
            viewWPAContainer.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT_CONTAINER
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
            lbWEP.leftAnchor.constraint(equalTo: radioWEP.rightAnchor, constant : AppConstants.MARGIN_TOP_SUBITEM),
            lbWEP.topAnchor.constraint(equalTo: viewWEPContainer.topAnchor),
            lbWEP.bottomAnchor.constraint(equalTo: viewWEPContainer.bottomAnchor),
            lbWEP.rightAnchor.constraint(equalTo: viewWEPContainer.rightAnchor)
        ])
        view.addSubview(viewWEPContainer)
        NSLayoutConstraint.activate([
            viewWEPContainer.topAnchor.constraint(equalTo: viewWPAContainer.bottomAnchor, constant: AppConstants.MARGIN_TOP_CONTAINER),
            viewWEPContainer.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT_CONTAINER)
            
        ])
        viewNoneContainer.addSubview(radioNone)
        NSLayoutConstraint.activate([
            radioNone.leadingAnchor.constraint(equalTo: viewNoneContainer.leadingAnchor),
            radioNone.topAnchor.constraint(equalTo: viewNoneContainer.topAnchor),
            radioNone.bottomAnchor.constraint(equalTo: viewNoneContainer.bottomAnchor),
        ])
        viewNoneContainer.addSubview(lbNone)
        NSLayoutConstraint.activate([
            lbNone.leftAnchor.constraint(equalTo: radioNone.rightAnchor, constant : AppConstants.MARGIN_TOP_SUBITEM),
            lbNone.topAnchor.constraint(equalTo: viewNoneContainer.topAnchor),
            lbNone.bottomAnchor.constraint(equalTo: viewNoneContainer.bottomAnchor),
            lbNone.rightAnchor.constraint(equalTo: viewNoneContainer.rightAnchor)
        ])
        view.addSubview(viewNoneContainer)
        NSLayoutConstraint.activate([
            viewNoneContainer.topAnchor.constraint(equalTo: viewWEPContainer.bottomAnchor, constant: AppConstants.MARGIN_TOP_CONTAINER),
            viewNoneContainer.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT_CONTAINER)
            
        ])
         self.lbSsid.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
         self.lbPass.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
          self.lbNetwork.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
          self.lbHidden.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
          self.lbWPA.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
         self.lbWEP.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
         self.lbNone.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.textFieldSsid.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldPass.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
              self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldSsid)
        addTarget(textFieldPass)
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.WIFI.rawValue
        self.generateViewModel?.ssid = textFieldSsid.text
        self.generateViewModel?.password = textFieldPass.text
        if radioWPA.isSelected {
            self.generateViewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.WPA)
        }
        else if radioWEP.isSelected {
            self.generateViewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.WEP)
        }
        else
        {
            self.generateViewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.None)
        }
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = EnumType.WIFI.rawValue
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
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        generateViewModel?.responseToView = { [weak self] value in
            
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: WifiModel(ssid: (self?.textFieldSsid.text)!, password: (self?.textFieldPass.text)!, protect: (self?.generateViewModel?.protect)!))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.WIFI.rawValue
                if (self?.wifiViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.wifiViewModel.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.ssidBinding.bind({ (value) in
            self.textFieldSsid.text = value
        })
        
        generateViewModel?.passwordBinding.bind({ (value) in
            self.textFieldPass.text = value
        })
        
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
        
    }
    
    
    private func clearDataTextfield() {
        self.textFieldSsid.resignFirstResponder()
        self.textFieldPass.resignFirstResponder()
        self.textFieldSsid.text = ""
        self.textFieldPass.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.SSID] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PASSWORD] = ""
    }
    func checkIsSeenDetail(){
        if wifiViewModel.isSeen == AppConstants.ISSEEN {
            textFieldSsid.text = wifiViewModel.ssid ?? ""
            textFieldPass.text = wifiViewModel.passwordView 
            if wifiViewModel.protect == LanguageHelper.getTranslationByKey(LanguageKey.WPA){
                radioWEP.isSelected = false
                radioNone.isSelected = false
                radioWPA.isSelected = true
            }
            if wifiViewModel.protect == LanguageHelper.getTranslationByKey(LanguageKey.WEP){
                radioWPA.isSelected = false
                radioNone.isSelected = false
                radioWEP.isSelected = true
            }
            if wifiViewModel.protect == LanguageHelper.getTranslationByKey(LanguageKey.None){
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
