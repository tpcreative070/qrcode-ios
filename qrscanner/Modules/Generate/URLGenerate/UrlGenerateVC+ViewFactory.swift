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
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        
        backgroundView.addSubview(urlBg)
        NSLayoutConstraint.activate([
            urlBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            urlBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            urlBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            urlBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        urlBg.addSubview(urlLbl)
        NSLayoutConstraint.activate([
            urlLbl.topAnchor.constraint(equalTo: urlBg.topAnchor, constant: 10),
            urlLbl.leadingAnchor.constraint(equalTo: urlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            urlLbl.trailingAnchor.constraint(equalTo: urlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        urlBg.addSubview(urlTxt)
        NSLayoutConstraint.activate([
            urlTxt.topAnchor.constraint(equalTo: urlLbl.bottomAnchor, constant: 5),
            urlTxt.leadingAnchor.constraint(equalTo: urlBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            urlTxt.trailingAnchor.constraint(equalTo: urlBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
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
                self?.urlTxt.errorMessage = errors[GenerateViewModelKey.URL] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.urlTxt.errorMessage = ""
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
                resVC.contentData = ContentModel(data: UrlModel(url: (self?.urlTxt.text)!))
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
            self.urlTxt.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    private func clearDataurlfield() {
        self.urlTxt.resignFirstResponder()
        self.urlTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.URL] = ""
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            urlTxt.text = urlValue.url ?? ""
        }
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Url
        self.viewModel?.url = urlTxt.text
    }
    
}
extension UrlGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ urlField: UITextField) -> Bool {
        urlField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.urlTxt.delegate = self        
    }
}

extension UrlGenerateVC : SingleButtonDialogPresenter {
    
}
