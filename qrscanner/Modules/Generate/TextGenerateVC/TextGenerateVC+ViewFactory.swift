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
        let gety = view.frame.height * 1.3/7
        let value_item = view.frame.height/7
        view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
        ])
        viewBackground.addSubview(viewTextBg)
        NSLayoutConstraint.activate([
            viewTextBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 10),
            viewTextBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewTextBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewTextBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        viewTextBg.addSubview(lbText)
        NSLayoutConstraint.activate([
            lbText.topAnchor.constraint(equalTo: viewTextBg.topAnchor, constant: 10),
            lbText.leadingAnchor.constraint(equalTo: viewTextBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbText.trailingAnchor.constraint(equalTo: viewTextBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewTextBg.addSubview(textFieldText)
        NSLayoutConstraint.activate([
            textFieldText.topAnchor.constraint(equalTo: lbText.bottomAnchor, constant: 5),
            textFieldText.leadingAnchor.constraint(equalTo: viewTextBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldText.trailingAnchor.constraint(equalTo: viewTextBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        setupNavItems()
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        navigationItem.title = LanguageKey.Text
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
                self?.textFieldText.errorMessage = errors[GenerateViewModelKey.TEXT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldText.errorMessage = ""
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
                resVC.typeCode = LanguageKey.Text
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentViewModel(data: TextModel(text: (self?.textFieldText.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.textBinding.bind({ (value) in
            self.textFieldText.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
    }
    
    
    private func clearDataTextfield() {
        self.textFieldText.resignFirstResponder()
        self.textFieldText.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Text
        self.viewModel?.text = textFieldText.text
        
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            textFieldText.text = String(textValue.text ?? "")
            
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
