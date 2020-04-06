//
//  ContactGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ContactGenerateVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
                   let scrollView = UIScrollView()
                   scrollView.translatesAutoresizingMaskIntoConstraints = false
                   return scrollView
               }()
    var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewFullNameContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewAddressContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewPhoneContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewEmailContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbFullNameContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.FullName)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbAddressContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Address)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbPhoneContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Phone)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbEmailContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Email)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textFieldFullNameContact: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var textFieldAddressContact: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var textFieldEmailContact: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.keyboardType = UIKeyboardType.emailAddress
        
        return view
    }()
    lazy var textFieldPhoneContact: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.keyboardType = UIKeyboardType.numberPad
        
        return view
    }()
    var contactViewModel = ContactViewModel()
    var generateViewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewModel = GenerateViewModel()
        self.initUI()
        self.bindViewModel()
        self.addLeftBackButton()
        self.checkIsSeenDetail()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func dismissKeyboard() {
        doDismiss()
    }
    override func closeButtonPress() {
        dismiss()
    }
    @objc func doGenerate() {
        print("done")
        self.defineValue()
        generateViewModel?.doGenerateQRValue();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.generateViewModel?.focusTextField = textField
        
        if textField == textFieldFullNameContact {
            generateViewModel?.fullNameContact = textField.text ?? ""
        }
        if textField == textFieldAddressContact {
            generateViewModel?.addressContact = textField.text ?? ""
        }
        if textField == textFieldPhoneContact {
            generateViewModel?.phoneContact = textField.text ?? ""
        }
        if textField == textFieldEmailContact {
            generateViewModel?.emailContact = textField.text ?? ""
        }
        
    }
    
}


