//
//  TextGenerate+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension TextGenerateVC {
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
        viewBackground.addSubview(viewTextBg)
        NSLayoutConstraint.activate([
            viewTextBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewTextBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewTextBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewTextBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewTextBg.addSubview(lbText)
        NSLayoutConstraint.activate([
            lbText.topAnchor.constraint(equalTo: viewTextBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbText.leadingAnchor.constraint(equalTo: viewTextBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbText.trailingAnchor.constraint(equalTo: viewTextBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewTextBg.addSubview(textFieldText)
        NSLayoutConstraint.activate([
            textFieldText.topAnchor.constraint(equalTo: lbText.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldText.leadingAnchor.constraint(equalTo: viewTextBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldText.trailingAnchor.constraint(equalTo: viewTextBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbText.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldText)
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = .white
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Text)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            
            if errors.count > 0 {
                self?.textFieldText.errorMessage = errors[GenerateViewModelKey.TEXT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldText.errorMessage = ""
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
                resVC.contentViewModel = ContentViewModel(data: TextModel(text: (self?.textFieldText.text)!))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.TEXT.rawValue
                if (self?.textViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.textViewModel.createDateTime)!
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.textBinding.bind({ (value) in
            self.textFieldText.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
    }
    
    
    private func clearDataTextfield() {
        self.textFieldText.resignFirstResponder()
        self.textFieldText.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.TEXT.rawValue
        self.generateViewModel?.text = textFieldText.text
        
    }
    func checkIsSeenDetail(){
        if textViewModel.isSeen == AppConstants.ISSEEN {
            textFieldText.text = String(textViewModel.text ?? "")
            
        }
    }
}
extension TextGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldText.delegate = self
        
        
    }
}

extension TextGenerateVC : SingleButtonDialogPresenter {
    
}
