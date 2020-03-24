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
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var viewLatBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy  var viewLongBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewQueryBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLatitude : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Latitude
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLongtitude : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Longtitude
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbQuery : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Query
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textFieldLatitude: ICTextFieldNoneIcon = {
        let latTxt = ICTextFieldNoneIcon()
        latTxt.translatesAutoresizingMaskIntoConstraints = false
        latTxt.alpha = AppConstants.ALPHA_DISBALE
        latTxt.keyboardType = UIKeyboardType.numberPad
        
        return latTxt
    }()
    lazy var textFieldLongtitude: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    
    lazy var textFieldQuery: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var viewMap: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var createDateTime : Int = 0
    var locationValue = LocationViewModel()
    var isSeen : Int = 0
    var typeCode : String = ""
    var viewModel : GenerateViewModel?
    let regionMeter : Double = 10000.0
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCode = typeCode.uppercased()
        viewModel = GenerateViewModel()
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
            // print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
            textFieldLatitude.text = String (locationCoordinate.latitude)
            textFieldLongtitude.text = String(locationCoordinate.longitude)
            addAnnotation(location: locationOnMap)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        
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
    
    
}


