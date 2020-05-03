//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TextGenerateVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var viewTextBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbText : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Text)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldText: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var textViewText: TextView = {
           let view = TextView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.alpha = AppConstants.ALPHA_DISBALE
           return view
       }()
    var textViewModel = TextViewModel()
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        keyboardHelper?.deregisterKeyboardNotification()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    override func viewDidAppear(_ animated: Bool) {
             super.viewDidAppear(animated)
             navigationController?.interactivePopGestureRecognizer?.isEnabled = false
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
        
        if textField == textFieldText {
            generateViewModel?.text = textField.text ?? ""
        }
        
    }
    
}


