//
//  urlGenerate+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UrlGenerateVC {
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
        
        viewBackground.addSubview(viewUrlBg)
        NSLayoutConstraint.activate([
            viewUrlBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewUrlBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewUrlBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewUrlBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewUrlBg.addSubview(lbUrl)
        NSLayoutConstraint.activate([
            lbUrl.topAnchor.constraint(equalTo: viewUrlBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbUrl.leadingAnchor.constraint(equalTo: viewUrlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbUrl.trailingAnchor.constraint(equalTo: viewUrlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewUrlBg.addSubview(textFieldUrl)
        NSLayoutConstraint.activate([
            textFieldUrl.topAnchor.constraint(equalTo: lbUrl.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldUrl.leadingAnchor.constraint(equalTo: viewUrlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldUrl.trailingAnchor.constraint(equalTo: viewUrlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
         self.lbUrl.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldUrl)
    }
    
    func addTarget(_ urlField: UITextField) {
        urlField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        let urlAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = urlAttributes
            self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
            navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
            self.navigationController?.navigationBar.tintColor = .white
            let menuButtonRight = UIButton(type: .system)
            menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
            menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchDown)
            navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
        
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            if errors.count > 0 {
                self?.textFieldUrl.errorMessage = errors[GenerateViewModelKey.URL] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldUrl.errorMessage = ""
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
                resVC.contentViewModel = ContentViewModel(data: UrlModel(url: (self?.textFieldUrl.text)!))
                resVC.resultViewModel.typeCode = EnumType.URL.rawValue
                resVC.imgCode = (self?.generateViewModel?.result)!
                if (self?.urlViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.urlViewModel.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataurlfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.urlBinding.bind({ (value) in
            self.textFieldUrl.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    private func clearDataurlfield() {
        self.textFieldUrl.resignFirstResponder()
        self.textFieldUrl.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    func checkIsSeenDetail(){
        if urlViewModel.isSeen == AppConstants.ISSEEN {
            textFieldUrl.text = urlViewModel.url ?? ""
        }
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.URL.rawValue
        self.generateViewModel?.url = textFieldUrl.text
    }
    
}
extension UrlGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ urlField: UITextField) -> Bool {
        urlField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldUrl.delegate = self        
    }
}

extension UrlGenerateVC : SingleButtonDialogPresenter {
    
}
