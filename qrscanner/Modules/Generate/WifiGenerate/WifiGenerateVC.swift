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
    lazy var ssidLbL : UILabel = {
        let view = UILabel()
        view.text = "SSID"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var passLbL : UILabel = {
        let view = UILabel()
        view.text = "Password"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var networkLbL : UILabel = {
           let view = UILabel()
           view.text = "Network Encryption"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
   lazy var hiddenLbL : UILabel = {
             let view = UILabel()
             view.text = "Hidden"
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
        smsLabel.text = "WPA/WPA2"
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
    
    var wifiView: UIView = {
                     let view = UIView()
                 view.backgroundColor = AppColors.GRAY_LIGHT_90
                    view.layer.borderColor = UIColor.white.cgColor
                       view.layer.borderWidth = 1
                       view.layer.cornerRadius = 10
                          view.translatesAutoresizingMaskIntoConstraints = false
                          return view
                   }()
       var clipboardView: UIView = {
           let view = UIView()
       view.backgroundColor = AppColors.GRAY_LIGHT_90
          view.layer.borderColor = UIColor.white.cgColor
             view.layer.borderWidth = 1
             view.layer.cornerRadius = 10
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
         }()
    lazy var wifiImg : UIImageView = {
          let view = UIImageView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.tintColor = AppColors.COLOR_ACCENT
          view.image = UIImage(named: "ic_wifi")
          return view
      }()
    
      lazy var wifiLabel : UILabel = {
                  let view = UILabel()
                  view.text = "Wifi"
                  view.translatesAutoresizingMaskIntoConstraints = false
                  return view
              }()
    lazy var clipboardImage : UIImageView = {
           let view = UIImageView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.tintColor = AppColors.COLOR_ACCENT
           view.image = UIImage(named: "ic_copy")
           return view
       }()
       lazy var clipboardLabel : UILabel = {
             let view = UILabel()
             view.translatesAutoresizingMaskIntoConstraints = false
             view.text = "Clipboard"
             return view
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
    
    
    
       var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GenerateViewModel()
        //checkIsSeenDetail()
     //   self.setupDelegate()
         initUI()
        setupStatusBar()
        self.bindViewModel()
               radioWPA.isSelected = true
        viewModel?.protect = "WPA"
        self.addLeftBackButton()
        
        
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
  func defineValue(){
    self.viewModel?.typeCode = LanguageKey.Wifi
          self.viewModel?.ssid = ssidTxt.text
          self.viewModel?.password = passTxt.text
      
      
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


