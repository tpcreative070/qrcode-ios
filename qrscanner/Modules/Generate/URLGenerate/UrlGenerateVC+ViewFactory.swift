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
        print(view.frame.height)
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
        
        viewBackground.addSubview(viewUrlBg)
        NSLayoutConstraint.activate([
            viewUrlBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewUrlBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewUrlBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewUrlBg.heightAnchor.constraint(equalToConstant: value_item)
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
        
    }
    
    func addTarget(_ urlField: UITextField) {
        urlField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        let urlAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = urlAttributes
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        //      self.extendedLayoutIncludesOpaqueBars = true
        
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
                self?.textFieldUrl.errorMessage = errors[GenerateViewModelKey.URL] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldUrl.errorMessage = ""
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
                resVC.contentData = ContentViewModel(data: UrlModel(url: (self?.textFieldUrl.text)!))
                resVC.viewModel.typeCode = EnumType.URL.rawValue
                resVC.imgCode = (self?.viewModel?.result)!
                if (self?.urlValue.isSeen)! == AppConstants.ISSEEN {
                    resVC.viewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.viewModel.createDateTime = (self?.urlValue.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataurlfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.urlBinding.bind({ (value) in
            self.textFieldUrl.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    private func clearDataurlfield() {
        self.textFieldUrl.resignFirstResponder()
        self.textFieldUrl.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    func checkIsSeenDetail(){
        if urlValue.isSeen == AppConstants.ISSEEN {
            textFieldUrl.text = urlValue.url ?? ""
        }
    }
    func defineValue(){
        self.viewModel?.typeCode = EnumType.URL.rawValue
        self.viewModel?.url = textFieldUrl.text
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
