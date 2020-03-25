//
//  WifiGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import UIKit

class WifiGenerateVC: BaseViewController {
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
    var viewSsidBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewPassBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewNetworkBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewProtectBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbSsid : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.SSID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbPass : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Password)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbNetwork : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.NetworkEncryption)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbHidden : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Hidden)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldSsid: ICTextFieldNoneIcon = {
        let textField = ICTextFieldNoneIcon()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = AppConstants.ALPHA_DISBALE
        
        return textField
    }()
    lazy var textFieldPass: ICTextFieldNoneIcon = {
        let textField = ICTextFieldNoneIcon()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = AppConstants.ALPHA_DISBALE
        return textField
    }()
    lazy var textFieldNetwork: ICTextFieldNoneIcon = {
        let textField = ICTextFieldNoneIcon()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = AppConstants.ALPHA_DISBALE
        return textField
    }()
    lazy var textFieldHiden: ICTextFieldNoneIcon = {
        let textField = ICTextFieldNoneIcon()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = AppConstants.ALPHA_DISBALE
        return textField
    }()
    lazy var viewWPAContainer : UIView = {
        let protect = UIView()
        protect.translatesAutoresizingMaskIntoConstraints = false
        return protect
    }()
    
    lazy var radioWPA : RadioButton = {
        let radio = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radio.innerCircleCircleColor = UIColor.black
        radio.outerCircleColor = UIColor.gray
        radio.addTarget(self, action: #selector(actionRadioWPA(sender:)), for: .touchUpInside)
        return radio
    }()
    
    lazy var lbWPA : ICLabel = {
        let label = ICLabel()
        label.text = LanguageHelper.getTranslationByKey(LanguageKey.WPA)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewWEPContainer : UIView = {
        let protect = UIView()
        protect.translatesAutoresizingMaskIntoConstraints = false
        return protect
    }()
    
    lazy var lbWEP : ICLabel = {
        let label = ICLabel()
        label.text = LanguageHelper.getTranslationByKey(LanguageKey.WEP)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var radioWEP : RadioButton = {
        let radio = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radio.innerCircleCircleColor = UIColor.black
        radio.outerCircleColor = UIColor.gray
        radio.addTarget(self, action: #selector(actionRadioWEP(sender:)), for: .touchUpInside)
        return radio
    }()
    lazy var viewNoneContainer : UIView = {
        let noneContainerView = UIView()
        noneContainerView.translatesAutoresizingMaskIntoConstraints = false
        return noneContainerView
    }()
    
    lazy var lbNone : ICLabel = {
        let noneLabel = ICLabel()
        noneLabel.text = LanguageHelper.getTranslationByKey(LanguageKey.None)
        noneLabel.translatesAutoresizingMaskIntoConstraints = false
        return noneLabel
    }()
    
    lazy var radioNone : RadioButton = {
        let radio = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radio.innerCircleCircleColor = UIColor.black
        radio.outerCircleColor = UIColor.gray
        radio.addTarget(self, action: #selector(actionRadioNone(sender:)), for: .touchUpInside)
        return radio
    }()
    
    
    @objc func actionRadioNone (sender: RadioButton) {
        radioNone.isSelected = true
        radioWEP.isSelected = false
        radioWPA.isSelected = false
        viewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.None)
    }
    
    @objc func actionRadioWEP (sender: RadioButton) {
        radioWEP.isSelected = true
        radioWPA.isSelected = false
        radioNone.isSelected = false
        viewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.WEP)
    }
    @objc func actionRadioWPA (sender: RadioButton) {
        radioWEP.isSelected = false
        radioWPA.isSelected = true
        radioNone.isSelected = false
        viewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.WPA)
    }
    

    var wifiValue = WifiViewModel()
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GenerateViewModel()
        radioWPA.isSelected = true
        viewModel?.protect = LanguageHelper.getTranslationByKey(LanguageKey.WPA)
        initUI()
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
        
        if textField == textFieldSsid {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateSSID()
        }
        if textField == textFieldPass {
            viewModel?.text = textField.text ?? ""
            viewModel?.validatePassword()
        }
        
        
    }
    
}


