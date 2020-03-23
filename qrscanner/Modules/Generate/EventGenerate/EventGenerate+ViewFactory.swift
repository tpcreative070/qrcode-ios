//
//  EventGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension EventGenerateVC {
    func initUI() {
        let gety = view.frame.height * 5.7/7
        let value_item = view.frame.height/7
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
        scrollView.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: gety)
            
        ])
        
        backgroundView.addSubview(titleBg)
        NSLayoutConstraint.activate([
            titleBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            titleBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            titleBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            titleBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        
        titleBg.addSubview(titleLbL)
        NSLayoutConstraint.activate([
            titleLbL.topAnchor.constraint(equalTo: titleBg.topAnchor, constant: 10),
            titleLbL.leadingAnchor.constraint(equalTo: titleBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            titleLbL.trailingAnchor.constraint(equalTo: titleBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        titleBg.addSubview(titleTxt)
        NSLayoutConstraint.activate([
            titleTxt.topAnchor.constraint(equalTo: titleLbL.bottomAnchor, constant: 5),
            titleTxt.leadingAnchor.constraint(equalTo: titleBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            titleTxt.trailingAnchor.constraint(equalTo: titleBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(locationBg)
        NSLayoutConstraint.activate([
            locationBg.topAnchor.constraint(equalTo: titleBg.bottomAnchor, constant: 10),
            locationBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            locationBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            locationBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        locationBg.addSubview(locationLbL)
        NSLayoutConstraint.activate([
            locationLbL.topAnchor.constraint(equalTo: locationBg.topAnchor, constant: 10),
            locationLbL.leadingAnchor.constraint(equalTo: locationBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            locationLbL.trailingAnchor.constraint(equalTo: locationBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        locationBg.addSubview(locationTxt)
        NSLayoutConstraint.activate([
            locationTxt.topAnchor.constraint(equalTo: locationLbL.bottomAnchor, constant: 5),
            locationTxt.leadingAnchor.constraint(equalTo: locationBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            locationTxt.trailingAnchor.constraint(equalTo: locationBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        backgroundView.addSubview(descriptionBg)
        NSLayoutConstraint.activate([
            descriptionBg.topAnchor.constraint(equalTo: locationBg.bottomAnchor, constant: 10),
            descriptionBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            descriptionBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            descriptionBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        descriptionBg.addSubview(descriptionLbL)
        NSLayoutConstraint.activate([
            descriptionLbL.topAnchor.constraint(equalTo: descriptionBg.topAnchor, constant: 10),
            descriptionLbL.leadingAnchor.constraint(equalTo: descriptionBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            descriptionLbL.trailingAnchor.constraint(equalTo: descriptionBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        descriptionBg.addSubview(descriptionTxt)
        NSLayoutConstraint.activate([
            descriptionTxt.topAnchor.constraint(equalTo: descriptionLbL.bottomAnchor, constant: 5),
            descriptionTxt.leadingAnchor.constraint(equalTo: descriptionBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            descriptionTxt.trailingAnchor.constraint(equalTo: descriptionBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(beginTimeBg)
        NSLayoutConstraint.activate([
            beginTimeBg.topAnchor.constraint(equalTo: descriptionBg.bottomAnchor, constant: 10),
            beginTimeBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            beginTimeBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            beginTimeBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        beginTimeBg.addSubview(beginTimeLbL)
        NSLayoutConstraint.activate([
            beginTimeLbL.topAnchor.constraint(equalTo: beginTimeBg.topAnchor, constant: 10),
            beginTimeLbL.leadingAnchor.constraint(equalTo: beginTimeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            beginTimeLbL.trailingAnchor.constraint(equalTo: beginTimeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        beginTimeBg.addSubview(beginTimeTxt)
        NSLayoutConstraint.activate([
            beginTimeTxt.topAnchor.constraint(equalTo: beginTimeLbL.bottomAnchor, constant: 5),
            beginTimeTxt.leadingAnchor.constraint(equalTo: beginTimeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            beginTimeTxt.trailingAnchor.constraint(equalTo: beginTimeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(endTimeBg)
        NSLayoutConstraint.activate([
            endTimeBg.topAnchor.constraint(equalTo: beginTimeBg.bottomAnchor, constant: 10),
            endTimeBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            endTimeBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            endTimeBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        endTimeBg.addSubview(endTimeLbL)
        NSLayoutConstraint.activate([
            endTimeLbL.topAnchor.constraint(equalTo: endTimeBg.topAnchor, constant: 10),
            endTimeLbL.leadingAnchor.constraint(equalTo: endTimeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            endTimeLbL.trailingAnchor.constraint(equalTo: endTimeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        endTimeBg.addSubview(endTimeTxt)
        NSLayoutConstraint.activate([
            endTimeTxt.topAnchor.constraint(equalTo: endTimeLbL.bottomAnchor, constant: 5),
            endTimeTxt.leadingAnchor.constraint(equalTo: endTimeBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            endTimeTxt.trailingAnchor.constraint(equalTo: endTimeBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        setupNavItems()
        setupEndedUpScrollView()
    }
    func setupEndedUpScrollView(){
        backgroundView.addSubview(endedUpScrollViewContainerView)
        NSLayoutConstraint.activate([
            endedUpScrollViewContainerView.topAnchor.constraint(equalTo: endTimeBg.bottomAnchor),
            endedUpScrollViewContainerView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            endedUpScrollViewContainerView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            endedUpScrollViewContainerView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
        self.view.layoutIfNeeded()
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Event
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
        menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
    func bindViewModel() {
        viewModel?.errorMessages.bind({ [weak self] errors in
            if errors.count > 0 {
                self?.titleTxt.errorMessage = errors[GenerateViewModelKey.TITLE_EVENT] ?? ""
                self?.locationTxt.errorMessage = errors[GenerateViewModelKey.LOCATION_EVENT] ?? ""
                self?.descriptionTxt.errorMessage = errors[GenerateViewModelKey.DESCRIPTION_EVENT] ?? ""
                self?.beginTimeTxt.errorMessage = errors[GenerateViewModelKey.BEGINTIME_EVENT] ?? ""
                self?.endTimeTxt.errorMessage = errors[GenerateViewModelKey.ENDTIME_EVENT] ?? ""
            }
            else {
                if errors.count == 0{
                    self?.titleTxt.errorMessage = ""
                    self?.locationTxt.errorMessage = ""
                    self?.descriptionTxt.errorMessage = ""
                    self?.beginTimeTxt.errorMessage = ""
                    self?.endTimeTxt.errorMessage = ""
                }
            }
         
        })
        viewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        viewModel?.responseToView = { [weak self] value in
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                let resVC = ResultGenerateVC()
                resVC.typeCode = LanguageKey.Event
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentModel(data: EventModel(title: (self?.titleTxt.text)!, location: (self?.locationTxt.text)!, description: (self?.descriptionTxt.text)!, beginTime: (self?.beginTimeTxt.text)!, endTime: (self?.endTimeTxt.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            //self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.titleEventBinding.bind({ (value) in
            self.titleTxt.text = value
        })
        viewModel?.locationEventBinding.bind({ (value) in
            self.locationTxt.text = value
        })
        viewModel?.descriptionEventBinding.bind({ (value) in
            self.descriptionTxt.text = value
        })
        viewModel?.beginTimeEventBinding.bind({ (value) in
            self.beginTimeTxt.text = TimeHelper.getString(time: value, dateFormat: TimeHelper.FormatDateTime)
        })
        viewModel?.endTimeEventBinding.bind({ (value) in
            self.beginTimeTxt.text = TimeHelper.getString(time: value, dateFormat: TimeHelper.FormatDateTime)
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TITLE_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LOCATION_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.DESCRIPTION_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.ENDTIME_EVENT] = ""
        
    }
        private func clearDataTextfield() {
        self.titleTxt.resignFirstResponder()
        self.locationTxt.resignFirstResponder()
        self.descriptionTxt.resignFirstResponder()
        self.titleTxt.text = ""
        self.locationTxt.text = ""
        self.descriptionTxt.text = ""
        self.beginTimeTxt.text = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.endTimeTxt.text = TimeHelper.getString(time: Date(), dateFormat: TimeHelper.FormatDateTime)
        self.viewModel?.errorMessages.value[GenerateViewModelKey.TITLE_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LOCATION_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.DESCRIPTION_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.BEGINTIME_EVENT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.ENDTIME_EVENT] = ""
    }
    func setupDatePicker(){
        beginTimeTxt.inputView    = datePicker
        endTimeTxt.inputView      = datePicker
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        beginTimeTxt.inputAccessoryView   = toolBar
        endTimeTxt.inputAccessoryView     = toolBar
    }
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Event
        self.viewModel?.titleEvent = titleTxt.text
        self.viewModel?.locationEvent = locationTxt.text
        self.viewModel?.descriptionEvent = descriptionTxt.text
        self.viewModel?.beginTimeEvent = beginTime
        self.viewModel?.endTimeEvent = endTime
        
        
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            titleTxt.text = eventValue.title ?? ""
            locationTxt.text = eventValue.location ?? ""
            descriptionTxt.text = eventValue.description ?? ""
            beginTimeTxt.text = eventValue.beginTime ?? ""
            endTimeTxt.text = eventValue.endTime ?? ""
        }
    }
    
}
extension EventGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.titleTxt.delegate = self
        self.locationTxt.delegate = self
        self.descriptionTxt.delegate = self
        self.beginTimeTxt.delegate = self
        self.endTimeTxt.delegate = self
    }
}

extension EventGenerateVC : SingleButtonDialogPresenter {
    
}
