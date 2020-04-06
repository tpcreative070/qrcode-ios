//
//  EventGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class EventGenerateVC: BaseViewController {
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var datetimePickerView : UIDatePicker? = {
        let view  = UIDatePicker()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewTitleBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewLocationBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewDescriptionBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewBeginBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewEndBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTitle : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Title)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLocation : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Location)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbDescription : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Description)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbBeginTime : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.TimeBegin)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbEndTime : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.TimeEnd)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldTitle: ICTextFieldNoneIcon = {
        let titleTxt = ICTextFieldNoneIcon()
        titleTxt.translatesAutoresizingMaskIntoConstraints = false
        titleTxt.alpha = AppConstants.ALPHA_DISBALE
        return titleTxt
    }()
    lazy var textFieldLocation: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var textFieldDescription: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var textFieldBeginTime: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldEndTime: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
       var eventViewModel = EventViewModel()
    var generateViewModel : GenerateViewModel?
    var toolBar = UIToolbar()
    var datePicker = UIDatePicker()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewModel = GenerateViewModel()
        self.initUI()
        self.setupDelegate()
        self.bindViewModel()
        self.addLeftBackButton()
        self.setupDatePicker()
        self.checkIsSeenDetail()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true

        keyboardHelper?.deregisterKeyboardNotification()
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
        generateViewModel?.doGenerateQRValue();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.generateViewModel?.focusTextField = textField
        
        if textField == textFieldTitle {
            generateViewModel?.titleEvent = textField.text ?? ""
        }
        if textField == textFieldLocation {
            generateViewModel?.locationEvent = textField.text ?? ""
        }
        if textField == textFieldDescription {
            generateViewModel?.descriptionEvent = textField.text ?? ""
        }
        if textField == textFieldBeginTime {
            datePicker.datePickerMode = .dateAndTime
       }
       if textField == textFieldEndTime {
           datePicker.datePickerMode = .dateAndTime
       }
    }
    @objc func doneButtonTapped() {
    let dateFormatter = DateFormatter()
    if textFieldBeginTime.isFirstResponder {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        textFieldBeginTime.text = dateFormatter.string(from: datePicker.date)
        generateViewModel?.beginTime = datePicker.date
    }
    if textFieldEndTime.isFirstResponder {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        textFieldEndTime.text = dateFormatter.string(from: datePicker.date)
        generateViewModel?.endTime = datePicker.date
    }
        self.view.endEditing(true)

    }

  
   
}
