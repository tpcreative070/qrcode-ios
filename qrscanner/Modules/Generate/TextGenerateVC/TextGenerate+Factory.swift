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
            
            
            backgroundView.addSubview(textBg)
                   NSLayoutConstraint.activate([
                       textBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                                textBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
                                textBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
                           textBg.heightAnchor.constraint(equalToConstant: value_item)
                            ])
            
            textBg.addSubview(textLbl)
                NSLayoutConstraint.activate([
                    textLbl.topAnchor.constraint(equalTo: textBg.topAnchor, constant: 10),
                    textLbl.leadingAnchor.constraint(equalTo: textBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                    textLbl.trailingAnchor.constraint(equalTo: textBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                ])
                textBg.addSubview(textTxt)
                NSLayoutConstraint.activate([
                    textTxt.topAnchor.constraint(equalTo: textLbl.bottomAnchor, constant: 5),
                    textTxt.leadingAnchor.constraint(equalTo: textBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                    textTxt.trailingAnchor.constraint(equalTo: textBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                ])
          
             //   addTarget(textTxt)
              
            
            
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
            
            navigationController?.navigationBar.backgroundColor = AppColors.PRIMARY_COLOR
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
                        self?.textTxt.errorMessage = errors[GenerateViewModelKey.TEXT] ?? ""
                        
                    }
                        
                    else {
                        if errors.count == 0{
                            self?.textTxt.errorMessage = ""
                          
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
                viewModel?.textBinding.bind({ (value) in
                    self.textTxt.text = value
                })
                
              
                self.viewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""
          
        }
        
        
        private func clearDataTextfield() {
            
            self.textTxt.resignFirstResponder()
          
            self.textTxt.text = ""
            
            self.viewModel?.errorMessages.value[GenerateViewModelKey.TEXT] = ""

        }
        
    }
    extension TextGenerateVC: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func setupDelegate() {
            self.textTxt.delegate = self
            

        }
    }

    extension TextGenerateVC : SingleButtonDialogPresenter {
        
    }
