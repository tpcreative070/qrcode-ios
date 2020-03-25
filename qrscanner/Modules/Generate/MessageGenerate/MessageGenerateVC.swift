//
//  MessageGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class MessageGenerateVC: BaseViewController {
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
    var stackViewTo : StackView = {
        let view = StackView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewToBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewFromBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTo : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.To)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbFrom : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Message)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldTo: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .numberPad
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var textFieldMessage: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    var messageValue = MessageViewModel()
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GenerateViewModel()
        self.initUI()
        self.setupDelegate()
        self.bindViewModel()
        self.addLeftBackButton()
        self.checkIsSeenDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        keyboardHelper?.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        keyboardHelper?.deregisterKeyboardNotification()
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
        
        if textField == textFieldTo {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateTo()
        }
        if textField == textFieldMessage {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateMessage()
        }
        
    }
    
}
