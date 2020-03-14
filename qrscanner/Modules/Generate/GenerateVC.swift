//
//  AddGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class GenerateVC: BaseViewController {
    
    /*Url*/
    lazy var urlTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Url"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    /*Email*/
    lazy var imageEmail: UIImage = {
           let view = UIImage()
        
           return view
       }()
    
    
    /*Contact*/
    lazy var fullNameContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Full Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var addressContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Address"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var phoneContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Phone"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var emailContactTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Email"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    /*Telephone*/
    lazy var phoneTelephoneTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Phone Number"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    /*Text*/
    lazy var textTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.placeholder = "Text"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    /*Wifi*/
    lazy var SSIDTxt: ICTextFieldNoneIcon = {
         let view = ICTextFieldNoneIcon()
         view.placeholder = "SSID"
         view.translatesAutoresizingMaskIntoConstraints = false
         view.alpha = AppConstants.ALPHA_DISBALE
        return view
        
    }()
        lazy var passWordTxt: ICTextFieldNoneIcon = {
             let view = ICTextFieldNoneIcon()
             view.placeholder = "Password"
             view.translatesAutoresizingMaskIntoConstraints = false
             view.alpha = AppConstants.ALPHA_DISBALE
             return view
    }()
    lazy var WPAContainerView : UIView = {
        let smsContainerView = UIView()
        smsContainerView.translatesAutoresizingMaskIntoConstraints = false
        return smsContainerView
    }()
    
    lazy var radioWPA : RadioButton = {
        let radioSMS = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radioSMS.innerCircleCircleColor = UIColor.black
        radioSMS.outerCircleColor = UIColor.gray
        radioSMS.addTarget(self, action: #selector(actionRadioWPA(sender:)), for: .touchUpInside)
        return radioSMS
    }()
    
    lazy var WPALabel : Label = {
        let smsLabel = Label()
        smsLabel.text = "WPA"
        smsLabel.translatesAutoresizingMaskIntoConstraints = false
        return smsLabel
    }()
    
    lazy var WEPContainerView : UIView = {
        let emailContainerView = UIView()
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
        return emailContainerView
    }()
    
    lazy var WEPLabel : Label = {
        let emailLabel = Label()
        emailLabel.text = "WEP"
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    lazy var radioWEP : RadioButton = {
        let radioEmail = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radioEmail.innerCircleCircleColor = UIColor.black
        radioEmail.outerCircleColor = UIColor.gray
        radioEmail.addTarget(self, action: #selector(actionRadioWEP(sender:)), for: .touchUpInside)
        return radioEmail
    }()
    lazy var NoneContainerView : UIView = {
        let noneContainerView = UIView()
        noneContainerView.translatesAutoresizingMaskIntoConstraints = false
        return noneContainerView
    }()
    
    lazy var noneLabel : Label = {
        let noneLabel = Label()
        noneLabel.text = "None"
        noneLabel.translatesAutoresizingMaskIntoConstraints = false
        return noneLabel
    }()
    
    lazy var radioNone : RadioButton = {
        let radioEmail = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radioEmail.innerCircleCircleColor = UIColor.black
        radioEmail.outerCircleColor = UIColor.gray
        radioEmail.addTarget(self, action: #selector(actionRadioNone(sender:)), for: .touchUpInside)
        return radioEmail
    }()
    @objc func actionRadioNone (sender: RadioButton) {
        radioNone.isSelected = true
        radioWEP.isSelected = false
        radioWPA.isSelected = false
        
        viewModel?.protect = "None"
    }
    
    @objc func actionRadioWEP (sender: RadioButton) {
        radioWEP.isSelected = true
        radioWPA.isSelected = false
        radioNone.isSelected = false
        viewModel?.protect = "WEP"
    }
    @objc func actionRadioWPA (sender: RadioButton) {
        radioWEP.isSelected = false
        radioWPA.isSelected = true
        radioNone.isSelected = false
        viewModel?.protect = "WPA"
    }
    /*Location*/
    /*Event*/
    lazy var centerContainerView: UIView = {
        let view  = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var typeCode : String = ""
    var viewModel : GenerateViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GenerateViewModel()
        typeCode = typeCode.uppercased()
        initUI()
        bindViewModel()
        
        addLeftBackButton()
        self.setupDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardHelper?.deregisterKeyboardNotification()
    }
    func defineValue(){
        self.viewModel?.typeCode = typeCode
        if typeCode == LanguageKey.Url{
            self.viewModel?.url = urlTxt.text
        }
        else if typeCode == LanguageKey.Text{
            self.viewModel?.text = textTxt.text
        }
        else if typeCode == LanguageKey.Location{
        }
        else if typeCode == LanguageKey.Email{
            
            
        }
        else if typeCode == LanguageKey.Event{
        }
        else if typeCode == LanguageKey.Message{
        //    self.viewModel?.to = toTxt.text
          //  self.viewModel?.message = messageTxt.text
            
        }
        else if typeCode == LanguageKey.Wifi{
        }
        else if typeCode == LanguageKey.Telephone{
            self.viewModel?.phoneTelephone = phoneTelephoneTxt.text
            
        }
        else if typeCode == LanguageKey.Contact{
            self.viewModel?.fullNameContact = fullNameContactTxt.text
            self.viewModel?.addressContact = addressContactTxt.text
            self.viewModel?.phoneContact = phoneContactTxt.text
            self.viewModel?.emailContact = emailContactTxt.text
            
        }
        
        
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
        if typeCode == LanguageKey.Url{
            if textField == urlTxt {
                viewModel?.url = textField.text ?? ""
                viewModel?.validateUrl()
            }               }
        else if typeCode == LanguageKey.Text{
            if textField == urlTxt {
                viewModel?.text = textField.text ?? ""
                viewModel?.validateUrl()
            }
        }
        else if typeCode == LanguageKey.Location{
            
        }
        else if typeCode == LanguageKey.Email{
           
        }
        else if typeCode == LanguageKey.Event{
            
        }
        else if typeCode == LanguageKey.Message{
          
        }
        else if typeCode == LanguageKey.Wifi{
            
        }
        else if typeCode == LanguageKey.Telephone{
            if textField == phoneTelephoneTxt {
                viewModel?.phoneTelephone = textField.text ?? ""
                viewModel?.validateMessage()
            }
        }
        else if typeCode == LanguageKey.Contact{
            if textField == fullNameContactTxt {
                viewModel?.fullNameContact = textField.text ?? ""
                viewModel?.validateMessage()
            }
            if textField == addressContactTxt {
                viewModel?.addressContact = textField.text ?? ""
                viewModel?.validateMessage()
            }
            if textField == phoneContactTxt {
                viewModel?.phoneContact = textField.text ?? ""
                viewModel?.validateMessage()
            }
            if textField == emailContactTxt {
                viewModel?.emailContact = textField.text ?? ""
                viewModel?.validateMessage()
            }
        }
            
            
        else
        {
            
        }
        
    }
    
}
