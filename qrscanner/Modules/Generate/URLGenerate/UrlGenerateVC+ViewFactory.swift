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
        let gety = view.frame.height * 1.3/7
        let value_item = view.frame.height/7
        view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        
        viewBackground.addSubview(viewUrlBg)
        NSLayoutConstraint.activate([
            viewUrlBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 10),
            viewUrlBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewUrlBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewUrlBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        viewUrlBg.addSubview(lbUrl)
        NSLayoutConstraint.activate([
            lbUrl.topAnchor.constraint(equalTo: viewUrlBg.topAnchor, constant: 10),
            lbUrl.leadingAnchor.constraint(equalTo: viewUrlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbUrl.trailingAnchor.constraint(equalTo: viewUrlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewUrlBg.addSubview(textFieldUrl)
        NSLayoutConstraint.activate([
            textFieldUrl.topAnchor.constraint(equalTo: lbUrl.bottomAnchor, constant: 5),
            textFieldUrl.leadingAnchor.constraint(equalTo: viewUrlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldUrl.trailingAnchor.constraint(equalTo: viewUrlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        setupNavItems()
        
    }
    
    func addTarget(_ urlField: UITextField) {
        urlField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        navigationItem.title = LanguageKey.Url
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
                resVC.typeCode = LanguageKey.Url
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentViewModel(data: UrlModel(url: (self?.textFieldUrl.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
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
        if isSeen == AppConstants.ISSEEN {
            textFieldUrl.text = urlValue.url ?? ""
        }
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Url
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
