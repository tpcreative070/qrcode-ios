//
//  ContactGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ContactGenerateVC: BaseViewController {
    var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewFullNameContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewAddressContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewPhoneContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewEmailContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbFullNameContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Phone
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbAddressContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Address
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbPhoneContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Phone
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbEmailContact : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Email
        
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
    var createDateTime : Int = 0
    var contactValue = ContactViewModel()
    var isSeen : Int = 0
    var typeCode : String = ""
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
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
        viewModel?.doGenerateValue();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.viewModel?.focusTextField = textField
        
        if textField == textFieldFullNameContact {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateFullnameContact()
        }
        if textField == textFieldAddressContact {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateAddressContact()
        }
        if textField == textFieldPhoneContact {
            viewModel?.text = textField.text ?? ""
            viewModel?.validatePhoneContact()
        }
        if textField == textFieldEmailContact {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateEmailContact()
        }
        
    }
    
}


