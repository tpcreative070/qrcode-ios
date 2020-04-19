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
                   viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND * 1.77)
               ])
        viewBackground.addSubview(viewToBg)
        NSLayoutConstraint.activate([
            viewToBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewToBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewToBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewToBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        self.viewToBg.addSubview(stackViewTo)
        NSLayoutConstraint.activate([
            self.stackViewTo.leadingAnchor.constraint(equalTo: self.viewToBg.readableContentGuide.leadingAnchor),
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
            lbTo.leadingAnchor.constraint(equalTo: viewToBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTo.trailingAnchor.constraint(equalTo: viewToBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewToBg.addSubview(textFieldTo)
        NSLayoutConstraint.activate([
            textFieldTo.topAnchor.constraint(equalTo: lbTo.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldTo.leadingAnchor.constraint(equalTo: viewToBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldTo.trailingAnchor.constraint(equalTo: viewToBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewFromBg)
        NSLayoutConstraint.activate([
            viewFromBg.topAnchor.constraint(equalTo: viewToBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewFromBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFromBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewFromBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewFromBg.addSubview(lbFrom)
        NSLayoutConstraint.activate([
            lbFrom.topAnchor.constraint(equalTo: viewFromBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbFrom.leadingAnchor.constraint(equalTo: viewFromBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFrom.trailingAnchor.constraint(equalTo: viewFromBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewFromBg.addSubview(textFieldMessage)
        NSLayoutConstraint.activate([
            textFieldMessage.topAnchor.constraint(equalTo: lbFrom.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldMessage.leadingAnchor.constraint(equalTo: viewFromBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldMessage.trailingAnchor.constraint(equalTo: viewFromBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbTo.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbFrom.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldTo.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldMessage.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        addTarget(textFieldTo)
        addTarget(textFieldMessage)

    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Message)
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
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        generateViewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: MessageModel(to: (self?.textFieldTo.text)!, message: (self?.textFieldMessage.text)!))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.MESSAGE.rawValue
                if (self?.messageViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.messageViewModel.createDateTime)!
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.toBinding.bind({ (value) in
            self.textFieldTo.text = value
        })
        
        generateViewModel?.messageBinding.bind({ (value) in
            self.textFieldMessage.text = value
        })
        
        
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
        
    }
    
    
    private func clearDataTextfield() {
        
        self.textFieldTo.resignFirstResponder()
        self.textFieldMessage.resignFirstResponder()
        
        self.textFieldTo.text = ""
        self.textFieldMessage.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
        
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.MESSAGE.rawValue
        self.generateViewModel?.message = textFieldMessage.text
        self.generateViewModel?.to = textFieldTo.text
        
    }
    func checkIsSeenDetail(){
        if messageViewModel.isSeen == AppConstants.ISSEEN {
            textFieldTo.text = messageViewModel.to ?? ""
            textFieldMessage.text = messageViewModel.message ?? ""
            
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
