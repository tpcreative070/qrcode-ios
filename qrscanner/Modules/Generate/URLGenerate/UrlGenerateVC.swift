//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class UrlGenerateVC: BaseViewController {
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var urlBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var urlLbl : UILabel = {
        let view = UILabel()
        view.text = "Url"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var urlTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var urlView: UIView = {
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
    lazy var searchImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_search")
        return view
    }()
    lazy var searchLbl : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Search"
        return view
    }()
    lazy var urlImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_language")
        return view
    }()
    
    lazy var urlLabel : UILabel = {
        let view = UILabel()
        view.text = "Url"
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
    var stackViewTo : StackView = {
        let view = StackView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var radioChoose : RadioButton = {
        let radio = RadioButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        radio.innerCircleCircleColor = UIColor.black
        radio.outerCircleColor = UIColor.gray
        radio.addTarget(self, action: #selector(actionRadio(sender:)), for: .touchUpInside)
        return radio
    }()
    @objc func actionRadio (sender: RadioButton) {
        radioChoose.isSelected = true
    }
    var typeCode : String = ""
    var urlSeen = UrlModel()
    var isSeen : Int = 0
    var viewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
        //   self.setupDelegate()
        //  setupStatusBar()
        initUI()
        setupNavItems()
        
        self.bindViewModel()
        self.addLeftBackButton()
        print("isSeen : \(isSeen)")
        checkIsSeenDetail()
        
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            urlTxt.text = urlSeen.url
            urlTxt.isUserInteractionEnabled = false
            
            
        }
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
        self.viewModel?.typeCode = LanguageKey.Url
        self.viewModel?.url = urlTxt.text
        
        
        
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
        
        if textField == urlTxt {
            viewModel?.url = textField.text ?? ""
            viewModel?.validateUrl()
        }
        
    }
    
}


