//
//  DateTimePicker.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import UIKit
class DateTimePicker : UIView{
  var delegate : DateTimePickerDelegate?
  let datePicker = UIDatePicker()
  var dateCase : DateTimeCase = .DEFAULT
  var titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: AppConstants.TOOLBAR_HEIGHT))
  var cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: AppConstants.TOOLBAR_HEIGHT))
  var doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: AppConstants.TOOLBAR_HEIGHT))
  init(frame : CGRect,delegate : DateTimePickerDelegate) {
    self.delegate = delegate
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView(){
    addSubview(datePicker)
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    setupToolBar()
    bindLanguage()
  }
  
  func setupToolBar() {
//    cancelButton.setTitleColor(AppColors.GRAY_COLOR, for: .normal)
//    cancelButton.addTarget(self, action: #selector(cancelPress), for: .touchUpInside)
//    let leftBar = UIBarButtonItem(customView: cancelButton)
    doneButton.setTitleColor(UIColor(red: 0, green: 122, blue: 255), for: .normal)
    doneButton.titleLabel?.font = UIFont(name: AppFonts.SFranciscoRegular, size: 17)
    doneButton.addTarget(self, action: #selector(donePress), for: .touchUpInside)
    let rightBar = UIBarButtonItem(customView: doneButton)
    let centerBar = UIBarButtonItem(customView: titleLabel)
    titleLabel.textAlignment = .center
    titleLabel.textColor = AppColors.BLUE_COLOR
    titleLabel.font = UIFont(name: AppFonts.SFranciscoSemiBold, size: 18)
    let space  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let barAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    barAccessory.barStyle = .default
    barAccessory.backgroundColor = .white
    barAccessory.isTranslucent = false
    barAccessory.items = [space, space, centerBar, space, rightBar]
    barAccessory.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(barAccessory)
    NSLayoutConstraint.activate([
      barAccessory.leftAnchor.constraint(equalTo: self.leftAnchor),
      barAccessory.rightAnchor.constraint(equalTo: self.rightAnchor),
      barAccessory.topAnchor.constraint(equalTo: self.topAnchor),
      barAccessory.heightAnchor.constraint(equalToConstant: AppConstants.TOOLBAR_HEIGHT),
      barAccessory.bottomAnchor.constraint(equalTo: datePicker.topAnchor),
      ])
  }
  
  @objc func cancelPress() {
    delegate?.cancelPicker()
  }
  
  @objc func donePress() {
    delegate?.donePicker()
  }
  
  func bindLanguage() {
    cancelButton.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.CancelButtonTitle), for: .normal)
    doneButton.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.DoneButtonTitle), for: .normal)
    titleLabel.text = LanguageHelper.getTranslationByKey(LanguageKey.TimeFrame)
  }
}

enum DateTimeCase : String {
  case ONE
  case TWO
  case THREE
  case DEFAULT
}
