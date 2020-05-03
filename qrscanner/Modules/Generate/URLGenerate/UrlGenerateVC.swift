//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class UrlGenerateVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
          let scrollView = UIScrollView()
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          return scrollView
      }()
    lazy var endedUpScrollViewContainerView : UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy   var viewUrlBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbUrl : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldUrl: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
  
    var urlViewModel = UrlViewModel()
    var generateViewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewModel = GenerateViewModel()
        initUI()
        self.bindViewModel()
        self.addLeftBackButton()
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
        keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
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
        if textField == textFieldUrl {
            generateViewModel?.url = textField.text ?? ""
        }
        
    }
    
}


