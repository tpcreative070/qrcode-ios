//
//  WifiGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import UIKit

class WifiGenerateVC: BaseViewController {
    
    var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var ssidBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var passBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var networkBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var protectBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var ssidLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.SSID
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var passLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Password
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var networkLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.NetworkEncryption
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var hiddenLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Hidden
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var ssidTxt: ICTextFieldNoneIcon = {
        let ssidTxt = ICTextFieldNoneIcon()
        ssidTxt.translatesAutoresizingMaskIntoConstraints = false
        ssidTxt.alpha = AppConstants.ALPHA_DISBALE
        
        return ssidTxt
    }()
    lazy var passTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var networkTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var hidenTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var WPAContainerView : UIView = {
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
    
    lazy var WPALabel : ICLabel = {
        let label = ICLabel()
        label.text = LanguageKey.WPA
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var WEPContainerView : UIView = {
        let protect = UIView()
        protect.translatesAutoresizingMaskIntoConstraints = false
        return protect
    }()
    
    lazy var WEPLabel : ICLabel = {
        let label = ICLabel()
        label.text = LanguageKey.WEP
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
    lazy var NoneContainerView : UIView = {
        let noneContainerView = UIView()
        noneContainerView.translatesAutoresizingMaskIntoConstraints = false
        return noneContainerView
    }()
    
    lazy var noneLabel : ICLabel = {
        let noneLabel = ICLabel()
        noneLabel.text = LanguageKey.None
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
        viewModel?.protect = LanguageKey.None
    }
    
    @objc func actionRadioWEP (sender: RadioButton) {
        radioWEP.isSelected = true
        radioWPA.isSelected = false
        radioNone.isSelected = false
        viewModel?.protect = LanguageKey.WEP
    }
    @objc func actionRadioWPA (sender: RadioButton) {
        radioWEP.isSelected = false
        radioWPA.isSelected = true
        radioNone.isSelected = false
        viewModel?.protect = LanguageKey.WPA
    }
    
    
    var createDateTime : Int = 0
    var typeCode : String = ""
    var wifiValue = WifiModel()
    var isSeen : Int = 0
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GenerateViewModel()
        radioWPA.isSelected = true
        viewModel?.protect = LanguageKey.WPA
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
        
        if textField == ssidTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateSSID()
        }
        if textField == passTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validatePassword()
        }
        
        
    }
    
}


