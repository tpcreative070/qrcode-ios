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
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy   var LatBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy  var LonBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var queryBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var latLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Latitude
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lonLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Longtitude
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var queryLbL : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Query
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var latTxt: ICTextFieldNoneIcon = {
        let latTxt = ICTextFieldNoneIcon()
        latTxt.translatesAutoresizingMaskIntoConstraints = false
        latTxt.alpha = AppConstants.ALPHA_DISBALE
        latTxt.keyboardType = UIKeyboardType.numberPad
        
        return latTxt
    }()
    lazy var lonTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    
    lazy var queryTxt: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var createDateTime : Int = 0
    var locationValue = LocationModel()
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
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            let locationCoordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            // print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
            latTxt.text = String (locationCoordinate.latitude)
            lonTxt.text = String(locationCoordinate.longitude)
            addAnnotation(location: locationOnMap)
        }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Place you press"
        self.mapView.addAnnotation(annotation)
        
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
    func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Location
        self.viewModel?.lat = Float(latTxt.text!)
        self.viewModel?.lon = Float(lonTxt.text!)
        self.viewModel?.query = queryTxt.text
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


