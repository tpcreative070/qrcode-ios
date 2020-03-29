//
//  EventGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by MacAppConstants.MARGIN_TOP_ITEM on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension EventGenerateVC {
    func initUI() {
//        let gety = view.frame.height * 5.8/7
//        let value_item = view.frame.height/7
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        scrollView.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            viewBackground.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND * 4.1)
            
        ])
        
        viewBackground.addSubview(viewTitleBg)
        NSLayoutConstraint.activate([
            viewTitleBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewTitleBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewTitleBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewTitleBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        
        viewTitleBg.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: viewTitleBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbTitle.leadingAnchor.constraint(equalTo: viewTitleBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbTitle.trailingAnchor.constraint(equalTo: viewTitleBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewTitleBg.addSubview(textFieldTitle)
        NSLayoutConstraint.activate([
            textFieldTitle.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldTitle.leadingAnchor.constraint(equalTo: viewTitleBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldTitle.trailingAnchor.constraint(equalTo: viewTitleBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewLocationBg)
        NSLayoutConstraint.activate([
            viewLocationBg.topAnchor.constraint(equalTo: viewTitleBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewLocationBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewLocationBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewLocationBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        viewLocationBg.addSubview(lbLocation)
        NSLayoutConstraint.activate([
            lbLocation.topAnchor.constraint(equalTo: viewLocationBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbLocation.leadingAnchor.constraint(equalTo: viewLocationBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbLocation.trailingAnchor.constraint(equalTo: viewLocationBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewLocationBg.addSubview(textFieldLocation)
        NSLayoutConstraint.activate([
            textFieldLocation.topAnchor.constraint(equalTo: lbLocation.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldLocation.leadingAnchor.constraint(equalTo: viewLocationBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldLocation.trailingAnchor.constraint(equalTo: viewLocationBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        viewBackground.addSubview(viewDescriptionBg)
        NSLayoutConstraint.activate([
            viewDescriptionBg.topAnchor.constraint(equalTo: viewLocationBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewDescriptionBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewDescriptionBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewDescriptionBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        viewDescriptionBg.addSubview(lbDescription)
        NSLayoutConstraint.activate([
            lbDescription.topAnchor.constraint(equalTo: viewDescriptionBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbDescription.leadingAnchor.constraint(equalTo: viewDescriptionBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbDescription.trailingAnchor.constraint(equalTo: viewDescriptionBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewDescriptionBg.addSubview(textFieldDescription)
        NSLayoutConstraint.activate([
            textFieldDescription.topAnchor.constraint(equalTo: lbDescription.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldDescription.leadingAnchor.constraint(equalTo: viewDescriptionBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldDescription.trailingAnchor.constraint(equalTo: viewDescriptionBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewBeginBg)
        NSLayoutConstraint.activate([
            viewBeginBg.topAnchor.constraint(equalTo: viewDescriptionBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewBeginBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBeginBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBeginBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        viewBeginBg.addSubview(lbBeginTime)
        NSLayoutConstraint.activate([
            lbBeginTime.topAnchor.constraint(equalTo: viewBeginBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbBeginTime.leadingAnchor.constraint(equalTo: viewBeginBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbBeginTime.trailingAnchor.constraint(equalTo: viewBeginBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBeginBg.addSubview(textFieldBeginTime)
        NSLayoutConstraint.activate([
            textFieldBeginTime.topAnchor.constraint(equalTo: lbBeginTime.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldBeginTime.leadingAnchor.constraint(equalTo: viewBeginBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldBeginTime.trailingAnchor.constraint(equalTo: viewBeginBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewEndBg)
        NSLayoutConstraint.activate([
            viewEndBg.topAnchor.constraint(equalTo: viewBeginBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewEndBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewEndBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewEndBg.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND_ITEM)
        ])
        viewEndBg.addSubview(lbEndTime)
        NSLayoutConstraint.activate([
            lbEndTime.topAnchor.constraint(equalTo: viewEndBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbEndTime.leadingAnchor.constraint(equalTo: viewEndBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbEndTime.trailingAnchor.constraint(equalTo: viewEndBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewEndBg.addSubview(textFieldEndTime)
        NSLayoutConstraint.activate([
            textFieldEndTime.topAnchor.constraint(equalTo: lbEndTime.bottomAnchor, constant: 5),
            textFieldEndTime.leadingAnchor.constraint(equalTo: viewEndBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldEndTime.trailingAnchor.constraint(equalTo: viewEndBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
          self.lbTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
          self.lbLocation.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
          self.lbDescription.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
         self.lbBeginTime.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
         self.lbEndTime.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        setupEndedUpScrollView()
        addTarget(textFieldTitle)
        addTarget(textFieldDescription)
        addTarget(textFieldLocation)

    }
    func setupEndedUpScrollView(){
        viewBackground.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: viewEndBg.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor)
        ])
        self.view.layoutIfNeeded()
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Event)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
        //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
        
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        let menuButtonRight = UIButton(type: .system)
        menuButtonRight.setImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            if errors.count > 0 {
                self?.textFieldTitle.errorMessage = errors[GenerateViewModelKey.TITLE_EVENT] ?? ""
                self?.textFieldLocation.errorMessage = errors[GenerateViewModelKey.LOCATION_EVENT] ?? ""
                self?.textFieldDescription.errorMessage = errors[GenerateViewModelKey.DESCRIPTION_EVENT] ?? ""
                self?.textFieldBeginTime.errorMessage = errors[GenerateViewModelKey.BEGINTIME_EVENT] ?? ""
                self?.textFieldEndTime.errorMessage = errors[GenerateViewModelKey.ENDTIME_EVENT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.textFieldTitle.errorMessage = ""
                    self?.textFieldLocation.errorMessage = ""
                    self?.textFieldDescription.errorMessage = ""
                    self?.textFieldBeginTime.errorMessage = ""
                    self?.textFieldEndTime.errorMessage = ""
                }
            }
            
        })
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        generateViewModel?.responseToView = { [weak self] value in
            
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: EventModel(title: (self?.textFieldTitle.text)!, location: (self?.textFieldLocation.text)!, description: (self?.textFieldDescription.text)!, beginTime: (self?.textFieldBeginTime.text)!, endTime: (self?.textFieldEndTime.text)!))
                resVC.imgCode = (self?.generateViewModel?.result)!
                resVC.resultViewModel.typeCode = EnumType.EVENT.rawValue
                if (self?.eventViewModel.isSeen)! == AppConstants.ISSEEN {
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = (self?.eventViewModel.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.titleEventBinding.bind({ (value) in
            self.textFieldTitle.text = value
        })
        generateViewModel?.locationEventBinding.bind({ (value) in
            self.textFieldLocation.text = value
        })
        generateViewModel?.descriptionEventBinding.bind({ (value) in
            self.textFieldDescription.text = value
        })
        generateViewModel?.beginTimeEventBinding.bind({ (value) in
            self.textFieldBeginTime.text = TimeHelper.getString(time: value, dateFormat: TimeHelper.FormatDateTime)
        })
        generateViewModel?.endTimeEventBinding.bind({ (value) in
            self.textFieldBeginTime.text = TimeHelper.getString(time: value, dateFormat: TimeHelper.FormatDateTime)
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TITLE_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LOCATION_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.DESCRIPTION_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.ENDTIME_EVENT] = ""
        
    }
    private func clearDataTextfield() {
        self.textFieldTitle.resignFirstResponder()
        self.textFieldLocation.resignFirstResponder()
        self.textFieldDescription.resignFirstResponder()
        self.textFieldTitle.text = ""
        self.textFieldLocation.text = ""
        self.textFieldDescription.text = ""
        self.textFieldBeginTime.text = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.textFieldEndTime.text = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.TITLE_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LOCATION_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.DESCRIPTION_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.ENDTIME_EVENT] = ""
    }
    func setupDatePicker(){
        textFieldBeginTime.inputView    = datePicker
        textFieldEndTime.inputView      = datePicker
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        textFieldBeginTime.inputAccessoryView   = toolBar
        textFieldEndTime.inputAccessoryView     = toolBar
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.EVENT.rawValue
        self.generateViewModel?.titleEvent = textFieldTitle.text
        self.generateViewModel?.locationEvent = textFieldLocation.text
        self.generateViewModel?.descriptionEvent = textFieldDescription.text
        print(generateViewModel?.beginTime)
        print(generateViewModel?.endTime)
        self.generateViewModel?.beginTimeEvent = generateViewModel?.beginTime
        self.generateViewModel?.endTimeEvent = generateViewModel?.endTime
        
        
    }
    func checkIsSeenDetail(){
        if eventViewModel.isSeen == AppConstants.ISSEEN {
            textFieldTitle.text = eventViewModel.title ?? ""
            textFieldLocation.text = eventViewModel.location ?? ""
            textFieldDescription.text = eventViewModel.description ?? ""
            textFieldBeginTime.text = eventViewModel.beginTime ?? ""
            textFieldEndTime.text = eventViewModel.endTime ?? ""
        }
    }
    
}
extension EventGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldTitle.delegate = self
        self.textFieldLocation.delegate = self
        self.textFieldDescription.delegate = self
        self.textFieldBeginTime.delegate = self
        self.textFieldEndTime.delegate = self
    }
}

extension EventGenerateVC : SingleButtonDialogPresenter {
    
}
