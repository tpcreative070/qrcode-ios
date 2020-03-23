//
//  EmailGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class EmailGenerateVC: BaseViewController {
    
    var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var emailBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var objectEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var messageEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var emailLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.EmailAddress
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var objectEmailLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Object
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var messageEmailLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Message
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTxt: ICTextFieldNoneIcon = {
        let emailTxt = ICTextFieldNoneIcon()
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        emailTxt.alpha = AppConstants.ALPHA_DISBALE
        emailTxt.keyboardType = UIKeyboardType.emailAddress
        
        return emailTxt
    }()
    lazy var objectEmailTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var messageEmailTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    
    
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var viewModelTypeCode = TypeCodeViewModelList()
    var createDateTime : Int = 0
    var emailValue = EmailModel()
    var isSeen : Int = 0
    var typeCode : String = ""
    var viewModel : GenerateViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
        self.initUI()
        bindViewModel()
        addLeftBackButton()
        self.checkIsSeenDetail()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        keyboardHelper?.deregisterKeyboardNotification()
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Email
        self.viewModel?.email = emailTxt.text
        self.viewModel?.objectEmail = objectEmailTxt.text
        self.viewModel?.messageEmail = messageEmailTxt.text
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
        
        if textField == emailTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateEmail()
        }
        if textField == objectEmailTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateObjectEmail()
        }
        if textField == messageEmailTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateMessageEmail()
        }
    }
    
}


