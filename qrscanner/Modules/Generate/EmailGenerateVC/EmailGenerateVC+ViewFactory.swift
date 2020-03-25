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
        let gety = view.frame.height * 3.6/7
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
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
        ])
        viewBackground.addSubview(viewEmailBg)
        NSLayoutConstraint.activate([
            viewEmailBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewEmailBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewEmailBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewEmailBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewEmailBg.addSubview(lbEmail)
        NSLayoutConstraint.activate([
            lbEmail.topAnchor.constraint(equalTo: viewEmailBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbEmail.leadingAnchor.constraint(equalTo: viewEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbEmail.trailingAnchor.constraint(equalTo: viewEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewEmailBg.addSubview(textFieldEmail)
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: lbEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldEmail.leadingAnchor.constraint(equalTo: viewEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldEmail.trailingAnchor.constraint(equalTo: viewEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewObjectEmailBg)
        NSLayoutConstraint.activate([
            viewObjectEmailBg.topAnchor.constraint(equalTo: viewEmailBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewObjectEmailBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewObjectEmailBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewObjectEmailBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewObjectEmailBg.addSubview(lbObjectEmail)
        NSLayoutConstraint.activate([
            lbObjectEmail.topAnchor.constraint(equalTo: viewObjectEmailBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbObjectEmail.leadingAnchor.constraint(equalTo: viewObjectEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbObjectEmail.trailingAnchor.constraint(equalTo: viewObjectEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewObjectEmailBg.addSubview(textFieldObjectEmail)
        NSLayoutConstraint.activate([
            textFieldObjectEmail.topAnchor.constraint(equalTo: lbObjectEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldObjectEmail.leadingAnchor.constraint(equalTo: viewObjectEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldObjectEmail.trailingAnchor.constraint(equalTo: viewObjectEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewMessageBg)
        NSLayoutConstraint.activate([
            viewMessageBg.topAnchor.constraint(equalTo: viewObjectEmailBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewMessageBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewMessageBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewMessageBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewMessageBg.addSubview(lbMessageEmail)
        NSLayoutConstraint.activate([
            lbMessageEmail.topAnchor.constraint(equalTo: viewMessageBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbMessageEmail.leadingAnchor.constraint(equalTo: viewMessageBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbMessageEmail.trailingAnchor.constraint(equalTo: viewMessageBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewMessageBg.addSubview(textFieldMessageEmail)
        NSLayoutConstraint.activate([
            textFieldMessageEmail.topAnchor.constraint(equalTo: lbMessageEmail.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldMessageEmail.leadingAnchor.constraint(equalTo: viewMessageBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldMessageEmail.trailingAnchor.constraint(equalTo: viewMessageBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbObjectEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbMessageEmail.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.EmailAddress)
        self.lbObjectEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Object)
        self.lbMessageEmail.text = LanguageHelper.getTranslationByKey(LanguageKey.Message)

        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
    }
    
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Email)
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
        viewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        viewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.contentData = ContentViewModel(data: EmailModel(email: (self?.textFieldEmail.text)!, objectEmail: (self?.textFieldObjectEmail.text)!, messageEmail: (self?.textFieldMessageEmail.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                resVC.viewModel.typeCode = EnumType.EMAIL.rawValue
                if (self?.emailValue.isSeen)! == AppConstants.ISSEEN {
                    resVC.viewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.viewModel.createDateTime = (self?.emailValue.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.emailBinding.bind({ (value) in
            self.textFieldEmail.text = value
        })
        
        viewModel?.objectEmailBinding.bind({ (value) in
            self.textFieldObjectEmail.text = value
        })
        
        viewModel?.messageEmailBinding.bind({ (value) in
            self.textFieldMessageEmail.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
        
    }
    private func clearDataTextfield() {
        self.textFieldEmail.resignFirstResponder()
        self.textFieldObjectEmail.resignFirstResponder()
        self.textFieldMessageEmail.resignFirstResponder()
        
        self.textFieldEmail.text = ""
        self.textFieldObjectEmail.text = ""
        self.textFieldMessageEmail.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
        
    }
    func checkIsSeenDetail(){
        if emailValue.isSeen == AppConstants.ISSEEN {
            self.textFieldEmail.text = emailValue.email ?? ""
            self.textFieldObjectEmail.text = emailValue.objectEmail ?? ""
            self.textFieldMessageEmail.text = emailValue.messageEmail ?? ""
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
