//
//  EmailGenerateVC+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension PhoneGenerateVC {
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
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND)
        ])
        viewBackground.addSubview(viewPhoneBg)
        NSLayoutConstraint.activate([
            viewPhoneBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewPhoneBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPhoneBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewPhoneBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewPhoneBg.addSubview(lbPhone)
        NSLayoutConstraint.activate([
            lbPhone.topAnchor.constraint(equalTo: viewPhoneBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbPhone.leadingAnchor.constraint(equalTo: viewPhoneBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbPhone.trailingAnchor.constraint(equalTo: viewPhoneBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewPhoneBg.addSubview(textFieldPhone)
        NSLayoutConstraint.activate([
            textFieldPhone.topAnchor.constraint(equalTo: lbPhone.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldPhone.leadingAnchor.constraint(equalTo: viewPhoneBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldPhone.trailingAnchor.constraint(equalTo: viewPhoneBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
         self.lbPhone.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldPhone)
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Telephone)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            
            if errors.count > 0 {
                self?.textFieldPhone.errorMessage = errors[GenerateViewModelKey.PHONE_TELEPHONE] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldPhone.errorMessage = ""
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
                resVC.contentViewModel = ContentViewModel(data: ContentModel(data: PhoneModel(phone: (self?.textFieldPhone.text!)!)))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.TELEPHONE.rawValue
                if (self?.phoneViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.phoneViewModel.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.phoneTelephoneBinding.bind({ (value) in
            self.textFieldPhone.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
    }
    private func clearDataTextfield() {
        self.textFieldPhone.resignFirstResponder()
        self.textFieldPhone.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
    }
    func checkIsSeenDetail(){
        if phoneViewModel.isSeen == AppConstants.ISSEEN {
            textFieldPhone.text = phoneViewModel.phone ?? ""
        }
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.TELEPHONE.rawValue
        self.generateViewModel?.phoneTelephone = textFieldPhone.text ?? ""
    }
}
extension PhoneGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func setupDelegate() {
        self.textFieldPhone.delegate = self
    }
}
extension PhoneGenerateVC : SingleButtonDialogPresenter {
    
}