//
//  MessageGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension MessageGenerateVC {
    func initUI() {
        setupNavItems()
        let gety = view.frame.height * 2.5/7
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
        viewBackground.addSubview(viewToBg)
        NSLayoutConstraint.activate([
            viewToBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewToBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewToBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewToBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        self.viewToBg.addSubview(stackViewTo)
        NSLayoutConstraint.activate([
            self.stackViewTo.leadingAnchor.constraint(equalTo: self.viewToBg.leadingAnchor),
            self.stackViewTo.widthAnchor.constraint(equalTo: self.viewToBg.widthAnchor,multiplier: 5/6),
            
            self.stackViewTo.topAnchor.constraint(equalTo: self.viewToBg.topAnchor),
            
        ])
        self.stackViewTo.axis = .vertical
        self.stackViewTo.alignment = .fill
        self.stackViewTo.distribution = UIStackView.Distribution.fillEqually
        self.stackViewTo.spacing = AppConstants.MARGIN_TOP_ITEM
        self.stackViewTo.addArrangedSubview(lbTo)
        self.stackViewTo.addArrangedSubview(textFieldTo)
        viewToBg.addSubview(lbTo)
        NSLayoutConstraint.activate([
            lbTo.topAnchor.constraint(equalTo: viewToBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbTo.leadingAnchor.constraint(equalTo: viewToBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTo.trailingAnchor.constraint(equalTo: viewToBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewToBg.addSubview(textFieldTo)
        NSLayoutConstraint.activate([
            textFieldTo.topAnchor.constraint(equalTo: lbTo.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldTo.leadingAnchor.constraint(equalTo: viewToBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldTo.trailingAnchor.constraint(equalTo: viewToBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewFromBg)
        NSLayoutConstraint.activate([
            viewFromBg.topAnchor.constraint(equalTo: viewToBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewFromBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFromBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewFromBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewFromBg.addSubview(lbFrom)
        NSLayoutConstraint.activate([
            lbFrom.topAnchor.constraint(equalTo: viewFromBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFrom.leadingAnchor.constraint(equalTo: viewFromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFrom.trailingAnchor.constraint(equalTo: viewFromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewFromBg.addSubview(textFieldMessage)
        NSLayoutConstraint.activate([
            textFieldMessage.topAnchor.constraint(equalTo: lbFrom.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldMessage.leadingAnchor.constraint(equalTo: viewFromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldMessage.trailingAnchor.constraint(equalTo: viewFromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbTo.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbFrom.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Message)
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
                self?.textFieldTo.errorMessage = errors[GenerateViewModelKey.TO] ?? ""
                self?.textFieldMessage.errorMessage = errors[GenerateViewModelKey.MESSAGE] ?? ""
            }
                
            else {
                if errors.count == 0{
                    self?.textFieldTo.errorMessage = ""
                    self?.textFieldMessage.errorMessage = ""
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
                resVC.contentData = ContentViewModel(data: MessageModel(to: (self?.textFieldTo.text)!, message: (self?.textFieldMessage.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                resVC.viewModel.typeCode = EnumType.MESSAGE.rawValue
                if (self?.messageValue.isSeen)! == AppConstants.ISSEEN {
                    resVC.viewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.viewModel.createDateTime = (self?.messageValue.createDateTime)!
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.toBinding.bind({ (value) in
            self.textFieldTo.text = value
        })
        
        viewModel?.messageBinding.bind({ (value) in
            self.textFieldMessage.text = value
        })
        
        
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
        
    }
    
    
    private func clearDataTextfield() {
        
        self.textFieldTo.resignFirstResponder()
        self.textFieldMessage.resignFirstResponder()
        
        self.textFieldTo.text = ""
        self.textFieldMessage.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
        
    }
    func defineValue(){
        self.viewModel?.typeCode = EnumType.MESSAGE.rawValue
        self.viewModel?.message = textFieldMessage.text
        self.viewModel?.to = textFieldTo.text
        
    }
    func checkIsSeenDetail(){
        if messageValue.isSeen == AppConstants.ISSEEN {
            textFieldTo.text = messageValue.toMessage ?? ""
            textFieldMessage.text = messageValue.message ?? ""
            
        }
    }
    
}
extension MessageGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldTo.delegate = self
        self.textFieldMessage.delegate = self
        
    }
}

extension MessageGenerateVC : SingleButtonDialogPresenter {
    
}
