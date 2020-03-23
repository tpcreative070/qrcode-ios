//
//  ContactGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ContactGenerateVC: BaseViewController {
    var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var fullNameContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var AddressContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var PhoneContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var EmailContactBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var fullNameContactLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Phone
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var addressContactLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Address
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var phoneContactLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Phone
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var emailContactLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Email
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fullNameContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var addressContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var emailContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.keyboardType = UIKeyboardType.emailAddress
        
        return view
    }()
    lazy var phoneContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.keyboardType = UIKeyboardType.numberPad
        
        return view
    }()
    var createDateTime : Int = 0
    var contactValue = ContactModel()
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
        
        if textField == fullNameContactTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateFullnameContact()
        }
        if textField == addressContactTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateAddressContact()
        }
        if textField == phoneContactTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validatePhoneContact()
        }
        if textField == emailContactTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateEmailContact()
        }
        
    }
    
}


