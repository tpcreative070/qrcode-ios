//
//  EmailGenerateVC+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension PhoneGenerateVC {
    func initUI() {
      //  view.backgroundColor = .white
        setupNavItems()
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
        
        
        backgroundView.addSubview(phoneBg)
               NSLayoutConstraint.activate([
                   phoneBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                            phoneBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                            phoneBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                       phoneBg.heightAnchor.constraint(equalToConstant: value_item)
                        ])
        
        phoneBg.addSubview(phoneLbl)
            NSLayoutConstraint.activate([
                phoneLbl.topAnchor.constraint(equalTo: phoneBg.topAnchor, constant: 10),
                phoneLbl.leadingAnchor.constraint(equalTo: phoneBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                phoneLbl.trailingAnchor.constraint(equalTo: phoneBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            phoneBg.addSubview(phoneTxt)
            NSLayoutConstraint.activate([
                phoneTxt.topAnchor.constraint(equalTo: phoneLbl.bottomAnchor, constant: 5),
                phoneTxt.leadingAnchor.constraint(equalTo: phoneBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                phoneTxt.trailingAnchor.constraint(equalTo: phoneBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
      
          //  addTarget(phoneTxt)
          
        
        
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Telephone
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
                    self?.phoneTxt.errorMessage = errors[GenerateViewModelKey.PHONE_TELEPHONE] ?? ""
                    
                }
                    
                else {
                    if errors.count == 0{
                        self?.phoneTxt.errorMessage = ""
                      
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
            viewModel?.phoneTelephoneBinding.bind({ (value) in
                self.phoneTxt.text = value
            })
            
          
            self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""
      
    }
    
    
    private func clearDataTextfield() {
        
        self.phoneTxt.resignFirstResponder()
      
        self.phoneTxt.text = ""
        
        self.viewModel?.errorMessages.value[GenerateViewModelKey.PHONE_TELEPHONE] = ""

    }
    
}
extension PhoneGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.phoneTxt.delegate = self
        

    }
}

extension PhoneGenerateVC : SingleButtonDialogPresenter {
    
}
