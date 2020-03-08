//
//  UrlVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/7/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class UrlVC: BaseViewController {
    lazy var urlTxt: ICTextFieldNoneIcon = {
           let view = ICTextFieldNoneIcon()
           view.placeholder = "Url"
           view.translatesAutoresizingMaskIntoConstraints = false
           view.alpha = AppConstants.ALPHA_DISBALE
           return view
       }()
    var viewModel = GenerateViewModel()
    override func viewDidLoad() {
          super.viewDidLoad()
          initUI()
          addLeftBackButton()
        //  self.setupDelegate()
      }
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          keyboardHelper?.registerKeyboardNotification()
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          keyboardHelper?.deregisterKeyboardNotification()
      }
    
      
       override func closeButtonPress() {
             dismiss()
         }
      @objc func doGenerate() {
          print("done")
        //  viewModel.messageGenerate();
      }
      @objc func inputFieldEditingDidEnd(textField: UITextField){
             self.viewModel.focusTextField = textField
             if textField == urlTxt {
                 viewModel.to = textField.text ?? ""
                 viewModel.validateUrl()
             }
             
         }
      

}
