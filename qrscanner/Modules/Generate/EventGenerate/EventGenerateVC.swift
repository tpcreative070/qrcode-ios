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
    lazy var titleLbL : UILabel = {
        let view = UILabel()
        view.text = "Title"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var locationLbL : UILabel = {
        let view = UILabel()
        view.text = "Location"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var descriptionLbL : UILabel = {
        let view = UILabel()
        view.text = "Description"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var beginTimeLbL : UILabel = {
        let view = UILabel()
        view.text = "Time begin"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var endTimeLbL : UILabel = {
        let view = UILabel()
        view.text = "Time end"
        
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
        
        datetimePickerView?.datePickerMode = .dateAndTime
        datetimePickerView?.minimumDate = Date.calculateDate(day: 1, month: 1, year: 2020, hour: 0, minute: 0)
        datetimePickerView?.maximumDate = Date.calculateDate(day: 31, month: 1, year: 2030, hour: 0, minute: 0)
        
        datetimePickerView?.addTarget(self, action: #selector(EventGenerateVC.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EventGenerateVC.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
   

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
        self.viewModel?.typeCode = LanguageKey.Event
        self.viewModel?.titleEvent = titleTxt.text
        self.viewModel?.locationEvent = locationTxt.text
        self.viewModel?.descriptionEvent = descriptionTxt.text
        self.viewModel?.beginTimeEvent = Date()
        self.viewModel?.endTimeEvent = Date()
        
        
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
    var flagTime : Bool = false
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
//        if textField == beginTimeTxt {
//
//            //    viewModel?.beginTimeEvent =
//        }
//        if textField == endTimeTxt {
//            endTimeTxt.inputView = datetimePickerView
//
//        }
        
    }
    @objc func chooseBeginTime(){
        flagTime = true
        beginTimeTxt.inputView = datetimePickerView
    }
    @objc func chooseEndTime(){
        flagTime = false
        endTimeTxt.inputView = datetimePickerView
    }
    @objc  func viewTapped(gestureRecognizer : UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc  func dateChanged(datePicker : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        if flagTime {
            beginTimeTxt.text = formatter.string(from: datePicker.date)}
        else{
            endTimeTxt.text = formatter.string(from: datePicker.date)
        }
        view.endEditing(true)
    }
    func show(){
        let date = Date()
        let calendar = Calendar.current
        
        //    backgroundView.addSubview(datetimePickerView)
        //    NSLayoutConstraint.activate([
        //        titleLbL.topAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 20),
        //        titleLbL.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0),
        //        titleLbL.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  0)
        //    ])
    }
    
    //func hide(){
    //    backgroundView.didAddSubview(datetimePickerView)
    //
    // }
    
}
