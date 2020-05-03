//
//  LocationGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import MapKit
class LocationGenerateVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var viewLatBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy  var viewLongBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewQueryBg: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLatitude : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Latitude)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLongtitude : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Longtitude)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbQuery : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Query)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textFieldLatitude: ICTextFieldNoneIcon = {
        let latTxt = ICTextFieldNoneIcon()
        latTxt.translatesAutoresizingMaskIntoConstraints = false
        latTxt.alpha = AppConstants.ALPHA_DISBALE
        latTxt.keyboardType = UIKeyboardType.numberPad
        latTxt.lineColor = AppColors.COLOR_ACCENT
        latTxt.selectedLineColor = AppColors.COLOR_ACCENT
        return latTxt
    }()
    lazy var textFieldLongtitude: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.keyboardType = UIKeyboardType.decimalPad
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
    
    lazy var textFieldQuery: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        view.lineColor = AppColors.COLOR_ACCENT
        view.selectedLineColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var viewMap: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var locationViewModel = LocationViewModel()
    var generateViewModel : GenerateViewModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        generateViewModel = GenerateViewModel()
        self.initUI()
        self.checkLocationService()
        self.bindViewModel()
        self.addLeftBackButton()
        self.checkIsSeenDetail()
    }
    @objc func longTap(sender: UIGestureRecognizer){
        if sender.state == .began {
            let locationInView = sender.location(in: viewMap)
            let locationOnMap = viewMap.convert(locationInView, toCoordinateFrom: viewMap)
            let locationCoordinate = viewMap.convert(locationInView, toCoordinateFrom: viewMap)
            textFieldLatitude.text = String (locationCoordinate.latitude)
            textFieldLongtitude.text = String(locationCoordinate.longitude)
            addAnnotation(location: locationOnMap)
        }
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
           self.generateViewModel?.focusTextField = textField
           
           if textField == textFieldLatitude {
            generateViewModel?.lat = Float(String(textField.text!)) ?? 0
           }
           if textField == textFieldLongtitude {
            generateViewModel?.lon = Float(String(textField.text!)) ?? 0
           }
           if textField == textFieldQuery {
               generateViewModel?.query = textField.text ?? ""
           }

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
    
    
}


