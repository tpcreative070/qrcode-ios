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
        view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        viewBackground.addSubview(viewToBg)
        NSLayoutConstraint.activate([
            viewToBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 10),
            viewToBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewToBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewToBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        self.viewToBg.addSubview(stackViewTo)
        NSLayoutConstraint.activate([
            self.stackViewTo.leadingAnchor.constraint(equalTo: self.viewToBg.leadingAnchor,constant: 0),
            self.stackViewTo.widthAnchor.constraint(equalTo: self.viewToBg.widthAnchor,multiplier: 5/6),
            
            self.stackViewTo.topAnchor.constraint(equalTo: self.viewToBg.topAnchor,constant: 0),
            
        ])
        self.stackViewTo.axis = .vertical
        self.stackViewTo.alignment = .fill
        self.stackViewTo.distribution = UIStackView.Distribution.fillEqually
        self.stackViewTo.spacing = 10
        self.stackViewTo.addArrangedSubview(lbTo)
        self.stackViewTo.addArrangedSubview(textFieldTo)
        viewToBg.addSubview(lbTo)
        NSLayoutConstraint.activate([
            lbTo.topAnchor.constraint(equalTo: viewToBg.topAnchor, constant: 10),
            lbTo.leadingAnchor.constraint(equalTo: viewToBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTo.trailingAnchor.constraint(equalTo: viewToBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewToBg.addSubview(textFieldTo)
        NSLayoutConstraint.activate([
            textFieldTo.topAnchor.constraint(equalTo: lbTo.bottomAnchor, constant: 5),
            textFieldTo.leadingAnchor.constraint(equalTo: viewToBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldTo.trailingAnchor.constraint(equalTo: viewToBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewFromBg)
        NSLayoutConstraint.activate([
            viewFromBg.topAnchor.constraint(equalTo: viewToBg.bottomAnchor, constant: 10),
            viewFromBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFromBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: -20),
            viewFromBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewFromBg.addSubview(lbFrom)
        NSLayoutConstraint.activate([
            lbFrom.topAnchor.constraint(equalTo: viewFromBg.topAnchor, constant: 10),
            lbFrom.leadingAnchor.constraint(equalTo: viewFromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbFrom.trailingAnchor.constraint(equalTo: viewFromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewFromBg.addSubview(textFieldMessage)
        NSLayoutConstraint.activate([
            textFieldMessage.topAnchor.constraint(equalTo: lbFrom.bottomAnchor, constant: 5),
            textFieldMessage.leadingAnchor.constraint(equalTo: viewFromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldMessage.trailingAnchor.constraint(equalTo: viewFromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Message
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
                resVC.typeCode = LanguageKey.Message
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentViewModel(data: MessageModel(to: (self?.textFieldTo.text)!, message: (self?.textFieldMessage.text)!))
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
        self.viewModel?.typeCode = LanguageKey.Message
        self.viewModel?.message = textFieldMessage.text
        self.viewModel?.to = textFieldTo.text

    }
  func checkIsSeenDetail(){
       if isSeen == AppConstants.ISSEEN {
           textFieldTo.text = messageValue.to ?? ""
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
