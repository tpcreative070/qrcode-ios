//
//  urlGenerate+Factory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension BarcodeVC {
    func initUI() {
        view.backgroundColor = .white
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
            viewBackground.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_BAR)
        ])
        
        viewBackground.addSubview(viewBarcodeBg)
        NSLayoutConstraint.activate([
            viewBarcodeBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewBarcodeBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBarcodeBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBarcodeBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM_BAR)
        ])
        
        viewBarcodeBg.addSubview(lbProductId)
        NSLayoutConstraint.activate([
            lbProductId.topAnchor.constraint(equalTo: viewBarcodeBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbProductId.leadingAnchor.constraint(equalTo: viewBarcodeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbProductId.trailingAnchor.constraint(equalTo: viewBarcodeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBarcodeBg.addSubview(textFieldProduct)
        NSLayoutConstraint.activate([
            textFieldProduct.topAnchor.constraint(equalTo: lbProductId.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldProduct.leadingAnchor.constraint(equalTo: viewBarcodeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldProduct.trailingAnchor.constraint(equalTo: viewBarcodeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBarcodeBg.addSubview(viewDropDown)
               NSLayoutConstraint.activate([
                   viewDropDown.topAnchor.constraint(equalTo: textFieldProduct.bottomAnchor, constant: AppConstants.MARGIN_TOP),
                   viewDropDown.leadingAnchor.constraint(equalTo: viewBarcodeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                   viewDropDown.trailingAnchor.constraint(equalTo: viewBarcodeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
                   viewDropDown.heightAnchor.constraint(equalToConstant: 40)
               ])
        
       viewDropDown.addSubview(lbType)
                   NSLayoutConstraint.activate([
                       lbType.topAnchor.constraint(equalTo: viewDropDown.topAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
                       lbType.leadingAnchor.constraint(equalTo: viewBarcodeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
                       lbType.bottomAnchor.constraint(equalTo: viewBarcodeBg.bottomAnchor, constant:  AppConstants.MARGIN_BOTTOM)
                   ])
    viewDropDown.addSubview(imgDropdown)
    NSLayoutConstraint.activate([
        imgDropdown.topAnchor.constraint(equalTo: viewDropDown.topAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
        imgDropdown.trailingAnchor.constraint(equalTo: viewBarcodeBg.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
        imgDropdown.bottomAnchor.constraint(equalTo: viewBarcodeBg.bottomAnchor, constant:  AppConstants.MARGIN_BOTTOM)
    ])
        
        self.lbProductId.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
         self.lbType.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        addTarget(textFieldProduct)
        self.viewDropDown.addTarget(self, action: #selector(actionDropDown(sender:)), for: .touchUpInside)
    }
    
    func addTarget(_ productField: UITextField) {
        productField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            if errors.count > 0 {
                self?.textFieldProduct.errorMessage = errors[GenerateViewModelKey.PRODUCTID] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldProduct.errorMessage = ""
                }
            }
        })
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        generateViewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: UrlModel(url: (self?.textFieldProduct.text)!))
                resVC.resultViewModel.typeCode = EnumType.URL.rawValue
                resVC.imgCode = (self?.generateViewModel?.result)!
                if (self?.barcodeViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.barcodeViewModel.createDateTime)!
                    
                }
                Navigator.pushViewController(from: self!, to: resVC, isNavigation: true, isTransparent: false)
                //self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataurlfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.productIDBinding.bind({ (value) in
            self.textFieldProduct.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PRODUCTID] = ""
    }
    private func clearDataurlfield() {
        self.textFieldProduct.resignFirstResponder()
        self.textFieldProduct.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PRODUCTID] = ""
    }
    func checkIsSeenDetail(){
        if barcodeViewModel.isSeen == AppConstants.ISSEEN {
            textFieldProduct.text = barcodeViewModel.barcode ?? ""
        }
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.BARCODE.rawValue
         self.generateViewModel?.typeBarcode = barcodeViewModel.typeBarcode!
              self.generateViewModel?.productID = textFieldProduct.text
    }
    func setTextLabel(mString: String) -> String{
           if mString == BarcodeType.EAN_8.rawValue{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8)!
           }
           else if mString == BarcodeType.EAN_13.rawValue{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_13)!
           }
           else{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8)!
           }
       }
}
extension BarcodeVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ productField: UITextField) -> Bool {
        productField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldProduct.delegate = self
    }
}

extension BarcodeVC : SingleButtonDialogPresenter {
    
}
