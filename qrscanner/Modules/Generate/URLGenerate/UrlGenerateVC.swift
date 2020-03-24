//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class UrlGenerateVC: BaseViewController {
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var viewUrlBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbUrl : UILabel = {
        let view = UILabel()
        view.text = LanguageKey.Url
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldUrl: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
  
    var createDateTime : Int = 0
    var typeCode : String = ""
    var urlValue = UrlViewModel()
    var isSeen : Int = 0
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
        initUI()
        self.bindViewModel()
        self.addLeftBackButton()
        print("isSeen : \(isSeen)")
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
        
        if textField == textFieldUrl {
            viewModel?.url = textField.text ?? ""
            viewModel?.validateUrl()
        }
        
    }
    
}


