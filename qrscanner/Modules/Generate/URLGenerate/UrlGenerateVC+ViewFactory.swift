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
        //  view.backgroundColor = .white
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
        if isSeen == AppConstants.ISSEEN {
            self.view.addSubview(searchView)
            NSLayoutConstraint.activate([
                self.searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                searchView.heightAnchor.constraint(equalToConstant: 50),
                
                self.searchView.topAnchor.constraint(equalTo: self.backgroundView.bottomAnchor,constant: 20),
                
            ])
            
            searchView.addSubview(searchImg)
            NSLayoutConstraint.activate([
                searchImg.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
                searchImg.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                
            ])
            searchView.addSubview(searchLbl)
            NSLayoutConstraint.activate([
                searchLbl.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
                searchLbl.leadingAnchor.constraint(equalTo: searchImg.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                searchLbl.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            self.view.addSubview(urlView)
            NSLayoutConstraint.activate([
                self.urlView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                urlView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                urlView.heightAnchor.constraint(equalToConstant: 50),
                
                self.urlView.topAnchor.constraint(equalTo: self.searchView.bottomAnchor,constant: 20),
                
            ])
            
            urlView.addSubview(urlImg)
            NSLayoutConstraint.activate([
                urlImg.topAnchor.constraint(equalTo: urlView.topAnchor, constant: 10),
                urlImg.leadingAnchor.constraint(equalTo: urlView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                
            ])
            urlView.addSubview(urlLabel)
            NSLayoutConstraint.activate([
                urlLabel.topAnchor.constraint(equalTo: urlView.topAnchor, constant: 10),
                urlLabel.leadingAnchor.constraint(equalTo: urlImg.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                urlLabel.trailingAnchor.constraint(equalTo: urlView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
            ])
            self.view.addSubview(clipboardView)
                         NSLayoutConstraint.activate([
                             self.clipboardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                             clipboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                             clipboardView.heightAnchor.constraint(equalToConstant: 50),
                             
                             self.clipboardView.topAnchor.constraint(equalTo: self.urlView.bottomAnchor,constant: 10),
                             
                         ])
                         
                         clipboardView.addSubview(clipboardImage)
                         NSLayoutConstraint.activate([
                             clipboardImage.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 10),
                             clipboardImage.leadingAnchor.constraint(equalTo: clipboardView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                             
                         ])
                         clipboardView.addSubview(clipboardLabel)
                         NSLayoutConstraint.activate([
                             clipboardLabel.topAnchor.constraint(equalTo: clipboardView.topAnchor, constant: 10),
                             clipboardLabel.leadingAnchor.constraint(equalTo: clipboardImage.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
                             clipboardLabel.trailingAnchor.constraint(equalTo: clipboardView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
                         ])
            urlView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (self.urlAction (_:))))
            searchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (self.searchAction (_:))))
            clipboardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (self.clipboardAction (_:))))

        }
        
             
    }
    @objc func urlAction(_ sender:UITapGestureRecognizer){
       guard let url = URL(string: urlSeen) else { return }
        UIApplication.shared.open(url)
    }
    @objc func searchAction(_ sender:UITapGestureRecognizer){
         guard let url = URL(string: urlSeen) else { return }
         UIApplication.shared.open(url)
     }
    @objc func clipboardAction(_ sender:UITapGestureRecognizer){
        showAlertController()
     }
    func showAlertController()
    {
        
        //simple alert dialog
        let alertController = UIAlertController(title: "Copy items", message: "Select which items you want to copy", preferredStyle: UIAlertController.Style.alert);
        // Add Action
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController,animated: true){
            print("present")
        }
       
//           
//        alertController.view.addSubview(stackViewTo)
//               NSLayoutConstraint.activate([
//                self.stackViewTo.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor,constant: -20),
//
//                         self.stackViewTo.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor,constant: 20),
//                         self.stackViewTo.topAnchor.constraint(equalTo: alertController.view.safeAreaLayoutGuide.topAnchor, constant: 70),
//                          self.stackViewTo.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: 30),
//
//                     ])
//                               self.stackViewTo.axis = .horizontal
//                                 self.stackViewTo.spacing = 10
//                                 self.stackViewTo.addArrangedSubview(urlLbl)
//                                 self.stackViewTo.addArrangedSubview(radioChoose)
//        urlLbl.text = urlSeen
//        alertController.view.addSubview(radioChoose)
//              NSLayoutConstraint.activate([
//                                        radioChoose.topAnchor.constraint(equalTo: alertController.view.safeAreaLayoutGuide.topAnchor, constant: 30),
//                                        radioChoose.centerYAnchor.constraint(equalTo: alertController.view.centerYAnchor),
//
//                                        radioChoose.leadingAnchor.constraint(equalTo: urlLbl.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
//                                        radioChoose.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -10),
//
//                                          ])
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (_) in
//       let pasteboard = UIPasteboard.general
//            pasteboard.string = self.urlSeen
//        }))
//
//        // 4. Present the alert.
//        self.present(alertController, animated: true, completion: nil)
    }
    func setupAlertView(){
        
    }
    @objc func checkBoxAction(_ sender: UIButton)
    {
        if sender.isSelected
        {
            sender.isSelected = false
            let btnImage    = UIImage(named: "ic_scan")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        }else {
            sender.isSelected = true
            let btnImage    = UIImage(named: "ic_check")!
            sender.setBackgroundImage(btnImage, for: UIControl.State())
        }
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
        
        navigationController?.navigationBar.backgroundColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        //      self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        let menuButtonRight = UIButton(type: .system)
        if isSeen == AppConstants.ISSEEN {
            
            menuButtonRight.setImage(#imageLiteral(resourceName: "ic_support"), for: .normal)
            
        }
        else
        {
            
            menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
            menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        }
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
                resVC.imgCode = (self?.viewModel?.result)!
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
