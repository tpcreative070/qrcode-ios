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
        let gety = view.frame.height * 1.4/7
        let value_item = view.frame.height/7
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
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
        ])
        viewBackground.addSubview(viewPhoneBg)
        NSLayoutConstraint.activate([
            viewPhoneBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewPhoneBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewPhoneBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewPhoneBg.heightAnchor.constraint(equalToConstant: value_item)
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
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        viewModel?.errorMessages.bind({ [weak self] errors in
            
            if errors.count > 0 {
                self?.textFieldPhone.errorMessage = errors[GenerateViewModelKey.PHONE_TELEPHONE] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldPhone.errorMessage = ""
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
                resVC.contentData = ContentViewModel(data: ContentModel(data: PhoneModel(phone: (self?.textFieldPhone.text!)!)))
                resVC.imgCode = (self?.viewModel?.result)!
                resVC.viewModel.typeCode = EnumType.TELEPHONE.rawValue
                if (self?.phoneValue.isSeen)! == AppConstants.ISSEEN {
                    resVC.viewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.viewModel.createDateTime = (self?.phoneValue.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.phoneTelephoneBinding.bind({ (value) in
            self.textFieldPhone.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
    }
    private func clearDataTextfield() {
        self.textFieldPhone.resignFirstResponder()
        self.textFieldPhone.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
    }
    func checkIsSeenDetail(){
        if phoneValue.isSeen == AppConstants.ISSEEN {
            textFieldPhone.text = phoneValue.phone ?? ""
        }
    }
    func defineValue(){
        self.viewModel?.typeCode = EnumType.TELEPHONE.rawValue
        self.viewModel?.phoneTelephone = textFieldPhone.text ?? ""
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
