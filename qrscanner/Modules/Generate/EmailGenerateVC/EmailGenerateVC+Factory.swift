//
//  EmailGenerateVC+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension EmailGenerateVC {
    func initUI() {
      //  view.backgroundColor = .white
        setupNavItems()
        print(view.frame.height)
        let gety = view.frame.height * 3.5/7
        let value_item = view.frame.height/7
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                     backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                     backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                     backgroundView.heightAnchor.constraint(equalToConstant: gety)
                    
                 ])
        
        
        backgroundView.addSubview(emailBg)
               NSLayoutConstraint.activate([
                   emailBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                            emailBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                            emailBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                       emailBg.heightAnchor.constraint(equalToConstant: value_item)
                        ])
        
        emailBg.addSubview(emailLbL)
            NSLayoutConstraint.activate([
                emailLbL.topAnchor.constraint(equalTo: emailBg.topAnchor, constant: 10),
                emailLbL.leadingAnchor.constraint(equalTo: emailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                emailLbL.trailingAnchor.constraint(equalTo: emailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            emailBg.addSubview(emailTxt)
            NSLayoutConstraint.activate([
                emailTxt.topAnchor.constraint(equalTo: emailLbL.bottomAnchor, constant: 5),
                emailTxt.leadingAnchor.constraint(equalTo: emailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                emailTxt.trailingAnchor.constraint(equalTo: emailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
        backgroundView.addSubview(objectEmailBg)
        NSLayoutConstraint.activate([
            objectEmailBg.topAnchor.constraint(equalTo: emailBg.bottomAnchor, constant: 10),
                     objectEmailBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                     objectEmailBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                objectEmailBg.heightAnchor.constraint(equalToConstant: value_item)
                 ])
        objectEmailBg.addSubview(objectEmailLbL)
           NSLayoutConstraint.activate([
               objectEmailLbL.topAnchor.constraint(equalTo: objectEmailBg.topAnchor, constant: 10),
               objectEmailLbL.leadingAnchor.constraint(equalTo: objectEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               objectEmailLbL.trailingAnchor.constraint(equalTo: objectEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])
           objectEmailBg.addSubview(objectEmailTxt)
           NSLayoutConstraint.activate([
               objectEmailTxt.topAnchor.constraint(equalTo: objectEmailLbL.bottomAnchor, constant: 5),
               objectEmailTxt.leadingAnchor.constraint(equalTo: objectEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               objectEmailTxt.trailingAnchor.constraint(equalTo: objectEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])

        
        backgroundView.addSubview(messageEmailBg)
              NSLayoutConstraint.activate([
                  messageEmailBg.topAnchor.constraint(equalTo: objectEmailBg.bottomAnchor, constant: 10),
                           messageEmailBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                           messageEmailBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                      messageEmailBg.heightAnchor.constraint(equalToConstant: value_item)
                       ])
              messageEmailBg.addSubview(messageEmailLbL)
                 NSLayoutConstraint.activate([
                     messageEmailLbL.topAnchor.constraint(equalTo: messageEmailBg.topAnchor, constant: 10),
                     messageEmailLbL.leadingAnchor.constraint(equalTo: messageEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                     messageEmailLbL.trailingAnchor.constraint(equalTo: messageEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                 ])
                 messageEmailBg.addSubview(messageEmailTxt)
                 NSLayoutConstraint.activate([
                     messageEmailTxt.topAnchor.constraint(equalTo: messageEmailLbL.bottomAnchor, constant: 5),
                     messageEmailTxt.leadingAnchor.constraint(equalTo: messageEmailBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                     messageEmailTxt.trailingAnchor.constraint(equalTo: messageEmailBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                 ])
        
//        view.addSubview(backgroundView1)
//              NSLayoutConstraint.activate([
//                  backgroundView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//                           backgroundView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
//                           backgroundView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//                           backgroundView1.bottomAnchor.constraint(equalTo: messageEmailBg.bottomAnchor, constant : 20)
//
//                       ])
//            addTarget(emailTxt)
//            addTarget(objectEmailTxt)
//            addTarget(messageEmailTxt)
        
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Email
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
                    self?.emailTxt.errorMessage = errors[GenerateViewModelKey.EMAIL] ?? ""
                    self?.objectEmailTxt.errorMessage = errors[GenerateViewModelKey.OBJECT_EMAIL] ?? ""
                    self?.messageEmailTxt.errorMessage = errors[GenerateViewModelKey.MESSAGE_EMAIL] ?? ""
                }
                    
                else {
                    if errors.count == 0{
                        self?.emailTxt.errorMessage = ""
                        self?.objectEmailTxt.errorMessage = ""
                        self?.messageEmailTxt.errorMessage = ""
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
                resVC.imgCode = (self?.viewModel?.result)!
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
            viewModel?.emailBinding.bind({ (value) in
                self.emailTxt.text = value
            })
            
            viewModel?.objectEmailBinding.bind({ (value) in
                self.objectEmailTxt.text = value
            })
            
            viewModel?.messageEmailBinding.bind({ (value) in
                self.messageEmailTxt.text = value
            })
            self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""
      
    }
    
    
    private func clearDataTextfield() {
        
        self.emailTxt.resignFirstResponder()
        self.objectEmailTxt.resignFirstResponder()
        self.messageEmailTxt.resignFirstResponder()

        self.emailTxt.text = ""
        self.objectEmailTxt.text = ""
        self.messageEmailTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.OBJECT_EMAIL] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE_EMAIL] = ""

    }
    
}
extension EmailGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.emailTxt.delegate = self
         self.objectEmailTxt.delegate = self
        self.messageEmailTxt.delegate = self

    }
}

extension EmailGenerateVC : SingleButtonDialogPresenter {
    
}
