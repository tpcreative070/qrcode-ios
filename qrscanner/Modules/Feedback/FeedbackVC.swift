//
//  EmailGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/11/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import MessageUI
class FeedbackVC: BaseViewController, MFMailComposeViewControllerDelegate {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewObjectEmailBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewMessageBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbObjectEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    lazy var lbObjectEmailContent : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
      
        return view
    }()
    lazy var lbMessageEmail : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    lazy var textFieldEmail: ICTextFieldNoneIcon = {
        let emailTxt = ICTextFieldNoneIcon()
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        emailTxt.alpha = AppConstants.ALPHA_DISBALE
        emailTxt.keyboardType = UIKeyboardType.emailAddress
       
        return emailTxt
    }()
    
      lazy var textViewContent: TextView = {
         let view = TextView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor =  AppColors.GRAY.cgColor
          view.layer.cornerRadius = 5
         return view
     }()
    let btnSend: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Send),for: .normal)
        btn.setTitleColor(AppColors.BLACK_COLOR, for: .normal)
        btn.layer.borderColor = AppColors.WHITE_COLOR.cgColor
        btn.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.initUI()
     //   addLeftBackButton()
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
        self.navigationController?.isNavigationBarHidden = true
        keyboardHelper?.deregisterKeyboardNotification()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
  
    override func dismissKeyboard() {
        doDismiss()
    }
    override func closeButtonPress() {
        dismiss()
    }
    @objc func doSend(){
        let mailComposer = configureMailController()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposer,animated: true, completion: nil)
        }else{
            showMailError()
        }
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
//        self.generateViewModel?.focusTextField = textField
//
//        if textField == textFieldEmail {
//            generateViewModel?.email = textField.text ?? ""
//        }
//        if textField == textFieldObjectEmail {
//            generateViewModel?.objectEmail = textField.text ?? ""
//        }
//        if textField == textFieldMessageEmail {
//            generateViewModel?.messageEmail = textField.text ?? ""
//        }
    }
    func configureMailController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["tpcreate."])
        mailComposerVC.setSubject(LanguageHelper.getTranslationByKey(LanguageKey.ImproveApp)!)
        mailComposerVC.setMessageBody("", isHTML: false)
        return mailComposerVC
    }
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message: "Can not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}


