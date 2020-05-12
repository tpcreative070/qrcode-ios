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
            viewBackground.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND)])
        
        viewBackground.addSubview(viewUrlBg)
        NSLayoutConstraint.activate([
            viewUrlBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewUrlBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewUrlBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewUrlBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewUrlBg.addSubview(lbUrl)
        NSLayoutConstraint.activate([
            lbUrl.topAnchor.constraint(equalTo: viewUrlBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbUrl.leadingAnchor.constraint(equalTo: viewUrlBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbUrl.trailingAnchor.constraint(equalTo: viewUrlBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewUrlBg.addSubview(textFieldUrl)
        NSLayoutConstraint.activate([
            textFieldUrl.topAnchor.constraint(equalTo: lbUrl.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldUrl.leadingAnchor.constraint(equalTo: viewUrlBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldUrl.trailingAnchor.constraint(equalTo: viewUrlBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.lbUrl.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldUrl.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldUrl)
    }
    
    func addTarget(_ urlField: UITextField) {
        urlField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        let urlAttributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = urlAttributes
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
                guard let urlModel = (self?.textFieldUrl.text), let result = (self?.generateViewModel?.result) else {
                    return
                }
                resVC.contentViewModel = ContentViewModel(data: UrlModel(url: urlModel))
                resVC.resultViewModel.typeCode = EnumType.URL.rawValue
                resVC.imgCode = result
                if let isSeen = (self?.urlViewModel.isSeen), isSeen == AppConstants.ISSEEN {
                    guard let time = self?.urlViewModel.createDateTime else {
                        return
                    }
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = time
                    
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
