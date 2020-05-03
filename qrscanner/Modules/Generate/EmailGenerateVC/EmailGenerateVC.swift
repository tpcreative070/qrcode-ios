//
//  EmailGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class EmailGenerateVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewObjectEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewMessageBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbObjectEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbMessageEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textFieldEmail: ICTextFieldNoneIcon = {
        let emailTxt = ICTextFieldNoneIcon()
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        emailTxt.alpha = AppConstants.ALPHA_DISBALE
        emailTxt.keyboardType = UIKeyboardType.emailAddress
        emailTxt.lineColor = AppColors.COLOR_ACCENT
        emailTxt.selectedLineColor = AppColors.COLOR_ACCENT
        return emailTxt
    }()
    lazy var textFieldObjectEmail: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var textFieldMessageEmail: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
    
    
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var emailViewModel = EmailViewModel()
    var generateViewModel : GenerateViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewModel = GenerateViewModel()
        self.initUI()
        bindViewModel()
        addLeftBackButton()
        self.checkIsSeenDetail()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
    }
    override func viewDidAppear(_ animated: Bool) {
             super.viewDidAppear(animated)
             navigationController?.interactivePopGestureRecognizer?.isEnabled = false
         }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        keyboardHelper?.deregisterKeyboardNotification()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.EMAIL.rawValue
        self.generateViewModel?.email = textFieldEmail.text
        self.generateViewModel?.objectEmail = textFieldObjectEmail.text
        self.generateViewModel?.messageEmail = textFieldMessageEmail.text
    }
    override func dismissKeyboard() {
        doDismiss()
    }
    override func closeButtonPress() {
        dismiss()
    }
    @objc func doGenerate() {
        self.defineValue()
        generateViewModel?.doGenerateQRValue();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.generateViewModel?.focusTextField = textField
        
        if textField == textFieldEmail {
            generateViewModel?.email = textField.text ?? ""
        }
        if textField == textFieldObjectEmail {
            generateViewModel?.objectEmail = textField.text ?? ""
        }
        if textField == textFieldMessageEmail {
            generateViewModel?.messageEmail = textField.text ?? ""
        }
    }
    
}


