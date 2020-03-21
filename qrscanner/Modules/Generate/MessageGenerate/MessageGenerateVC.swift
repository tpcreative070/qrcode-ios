//
//  MessageGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class MessageGenerateVC: BaseViewController {
    var backgroundView: UIView = {
                let view = UIView()
             view.layer.borderColor = UIColor.lightGray.cgColor
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
    var toBg: UIView = {
         let view = UIView()
         view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
           view.layer.borderWidth = 1
           view.layer.cornerRadius = 10
              view.translatesAutoresizingMaskIntoConstraints = false
              return view
       }()
    var fromBg: UIView = {
           let view = UIView()
           view.backgroundColor = AppColors.GRAY_LIGHT_90
          view.layer.borderColor = UIColor.white.cgColor
             view.layer.borderWidth = 1
             view.layer.cornerRadius = 10
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
         }()
    lazy var toLbL : UILabel = {
           let view = UILabel()
           view.text = "To"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       lazy var fromLbL : UILabel = {
           let view = UILabel()
           view.text = "Message"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    lazy var toTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .numberPad
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var messageTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    
     var typeCode : String = ""
          var viewModel : GenerateViewModel?
       override func viewDidLoad() {
           super.viewDidLoad()
           typeCode = typeCode.uppercased()
           viewModel = GenerateViewModel()
           self.initUI()
           self.setupDelegate()
           setupStatusBar()
           self.bindViewModel()
                  
           self.addLeftBackButton()
           
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
     func defineValue(){
       self.viewModel?.typeCode = LanguageKey.Message
             self.viewModel?.message = messageTxt.text
             self.viewModel?.to = toTxt.text
      
         
         
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
         
             if textField == toTxt {
                 viewModel?.text = textField.text ?? ""
                 viewModel?.validateTo()
             }
             if textField == messageTxt {
                 viewModel?.text = textField.text ?? ""
                 viewModel?.validateMessage()
        }
       
       }
         
     }
