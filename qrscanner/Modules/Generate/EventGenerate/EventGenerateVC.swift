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
    var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var titleBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var locationBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var descriptionBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var beginTimeBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var endTimeBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Title
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var locationLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Location
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var descriptionLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Description
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var beginTimeLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.TimeBegin
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var endTimeLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.TimeEnd
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleTxt: ICTextFieldNoneIcon = {
        let titleTxt = ICTextFieldNoneIcon()
        titleTxt.translatesAutoresizingMaskIntoConstraints = false
        titleTxt.alpha = AppConstants.ALPHA_DISBALE
        return titleTxt
    }()
    lazy var locationTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var descriptionTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var beginTimeTxt: ICTextFieldNoneIcon = {
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
    lazy var endTimeTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    var createDateTime : Int = 0
       var eventValue = EventModel()
       var isSeen : Int = 0
       var typeCode : String = ""
    var viewModel : GenerateViewModel?
    var toolBar = UIToolbar()
    var datePicker = UIDatePicker()
    var beginTime : Date?
    var endTime: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
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
        self.navigationController?.setNavigationBarHidden(false, animated: true)

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
        viewModel?.doGenerateValue();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.viewModel?.focusTextField = textField
        
        if textField == titleTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateTitleEvent()
        }
        if textField == locationTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateLocationEvent()
        }
        if textField == descriptionTxt {
            viewModel?.text = textField.text ?? ""
            viewModel?.validateDescriptionEvent()
        }
        if textField == beginTimeTxt {
    datePicker.datePickerMode = .dateAndTime
       }
       if textField == endTimeTxt {
           datePicker.datePickerMode = .dateAndTime
       }
    }
    @objc func doneButtonTapped() {
    let dateFormatter = DateFormatter()
    if beginTimeTxt.isFirstResponder {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        beginTimeTxt.text = dateFormatter.string(from: datePicker.date)
        beginTime = datePicker.date
    }
    if endTimeTxt.isFirstResponder {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        endTimeTxt.text = dateFormatter.string(from: datePicker.date)
        endTime = datePicker.date
    }
        self.view.endEditing(true)

    }

  
   
}
