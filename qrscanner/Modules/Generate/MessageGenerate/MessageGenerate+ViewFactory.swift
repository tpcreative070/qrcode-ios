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
      //  view.backgroundColor = .white
        setupNavItems()
        let gety = view.frame.height * 2.5/7
        let value_item = view.frame.height/7
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                     backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                     backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                     backgroundView.heightAnchor.constraint(equalToConstant: gety)
                    
                 ])
       
        
        backgroundView.addSubview(toBg)
               NSLayoutConstraint.activate([
                   toBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                            toBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                            toBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                       toBg.heightAnchor.constraint(equalToConstant: value_item)
                        ])
        self.toBg.addSubview(stackViewTo)
                      NSLayoutConstraint.activate([
                                self.stackViewTo.leadingAnchor.constraint(equalTo: self.toBg.leadingAnchor,constant: 0),
                                self.stackViewTo.widthAnchor.constraint(equalTo: self.toBg.widthAnchor,multiplier: 5/6),
                                
                                self.stackViewTo.topAnchor.constraint(equalTo: self.toBg.topAnchor,constant: 0),

                            ])
                                      self.stackViewTo.axis = .vertical
                                        self.stackViewTo.alignment = .fill
                                        self.stackViewTo.distribution = UIStackView.Distribution.fillEqually
                                        self.stackViewTo.spacing = 10
                                        self.stackViewTo.addArrangedSubview(toLbL)
                                        self.stackViewTo.addArrangedSubview(toTxt)
        toBg.addSubview(toLbL)
            NSLayoutConstraint.activate([
                toLbL.topAnchor.constraint(equalTo: toBg.topAnchor, constant: 10),
                toLbL.leadingAnchor.constraint(equalTo: toBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                toLbL.trailingAnchor.constraint(equalTo: toBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            toBg.addSubview(toTxt)
            NSLayoutConstraint.activate([
                toTxt.topAnchor.constraint(equalTo: toLbL.bottomAnchor, constant: 5),
                toTxt.leadingAnchor.constraint(equalTo: toBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                toTxt.trailingAnchor.constraint(equalTo: toBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
        backgroundView.addSubview(fromBg)
        NSLayoutConstraint.activate([
            fromBg.topAnchor.constraint(equalTo: toBg.bottomAnchor, constant: 10),
                     fromBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                     fromBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                fromBg.heightAnchor.constraint(equalToConstant: value_item)
                 ])
        fromBg.addSubview(fromLbL)
           NSLayoutConstraint.activate([
               fromLbL.topAnchor.constraint(equalTo: fromBg.topAnchor, constant: 10),
               fromLbL.leadingAnchor.constraint(equalTo: fromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               fromLbL.trailingAnchor.constraint(equalTo: fromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])
           fromBg.addSubview(messageTxt)
           NSLayoutConstraint.activate([
               messageTxt.topAnchor.constraint(equalTo: fromLbL.bottomAnchor, constant: 5),
               messageTxt.leadingAnchor.constraint(equalTo: fromBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
               messageTxt.trailingAnchor.constraint(equalTo: fromBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
           ])

        
      
//            addTarget(toTxt)
//            addTarget(messageTxt)
        
        
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
                    self?.toTxt.errorMessage = errors[GenerateViewModelKey.TO] ?? ""
                    self?.messageTxt.errorMessage = errors[GenerateViewModelKey.MESSAGE] ?? ""
                }
                    
                else {
                    if errors.count == 0{
                        self?.toTxt.errorMessage = ""
                        self?.messageTxt.errorMessage = ""
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
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
            viewModel?.toBinding.bind({ (value) in
                self.toTxt.text = value
            })
            
            viewModel?.messageBinding.bind({ (value) in
                self.messageTxt.text = value
            })
            
            
            self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
            self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""
      
    }
    
    
    private func clearDataTextfield() {
        
        self.toTxt.resignFirstResponder()
        self.messageTxt.resignFirstResponder()

        self.toTxt.text = ""
        self.messageTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TO] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.MESSAGE] = ""

    }
    
}
extension MessageGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.toTxt.delegate = self
         self.messageTxt.delegate = self

    }
}

extension MessageGenerateVC : SingleButtonDialogPresenter {
    
}
