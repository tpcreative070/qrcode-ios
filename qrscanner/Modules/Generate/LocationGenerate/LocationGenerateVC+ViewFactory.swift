//
//  LocationGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by MacAppConstants.MARGIN_TOP_ITEM on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
extension LocationGenerateVC {
    func initUI() {
        let gety = view.frame.height * 5.8/7
        let value_item = view.frame.height/7
         self.view.addSubview(scrollView)
                  NSLayoutConstraint.activate([
                      scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                      scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                      scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                      scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                  ])
             scrollView.addSubview(viewBackground)
       NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: AppConstants.MARGIN_TOP),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: gety)
        ])
        
        viewBackground.addSubview(viewLatBg)
        NSLayoutConstraint.activate([
            viewLatBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewLatBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewLatBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewLatBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewLatBg.addSubview(lbLatitude)
        NSLayoutConstraint.activate([
            lbLatitude.topAnchor.constraint(equalTo: viewLatBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbLatitude.leadingAnchor.constraint(equalTo: viewLatBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbLatitude.trailingAnchor.constraint(equalTo: viewLatBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewLatBg.addSubview(textFieldLatitude)
        NSLayoutConstraint.activate([
            textFieldLatitude.topAnchor.constraint(equalTo: lbLatitude.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldLatitude.leadingAnchor.constraint(equalTo: viewLatBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldLatitude.trailingAnchor.constraint(equalTo: viewLatBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewLongBg)
        NSLayoutConstraint.activate([
            viewLongBg.topAnchor.constraint(equalTo: viewLatBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewLongBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewLongBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewLongBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewLongBg.addSubview(lbLongtitude)
        NSLayoutConstraint.activate([
            lbLongtitude.topAnchor.constraint(equalTo: viewLongBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbLongtitude.leadingAnchor.constraint(equalTo: viewLongBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbLongtitude.trailingAnchor.constraint(equalTo: viewLongBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewLongBg.addSubview(textFieldLongtitude)
        NSLayoutConstraint.activate([
            textFieldLongtitude.topAnchor.constraint(equalTo: lbLongtitude.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldLongtitude.leadingAnchor.constraint(equalTo: viewLongBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldLongtitude.trailingAnchor.constraint(equalTo: viewLongBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        
        viewBackground.addSubview(viewQueryBg)
        NSLayoutConstraint.activate([
            viewQueryBg.topAnchor.constraint(equalTo: viewLongBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewQueryBg.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewQueryBg.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewQueryBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        viewQueryBg.addSubview(lbQuery)
        NSLayoutConstraint.activate([
            lbQuery.topAnchor.constraint(equalTo: viewQueryBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbQuery.leadingAnchor.constraint(equalTo: viewQueryBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbQuery.trailingAnchor.constraint(equalTo: viewQueryBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewQueryBg.addSubview(textFieldQuery)
        NSLayoutConstraint.activate([
            textFieldQuery.topAnchor.constraint(equalTo: lbQuery.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldQuery.leadingAnchor.constraint(equalTo: viewQueryBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldQuery.trailingAnchor.constraint(equalTo: viewQueryBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewMap)
        NSLayoutConstraint.activate([
            viewMap.topAnchor.constraint(equalTo: viewQueryBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewMap.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewMap.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewMap.heightAnchor.constraint(equalToConstant: value_item*2)
        ])
         self.lbLatitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
         self.lbLongtitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbQuery.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        viewMap.addGestureRecognizer(longTapGesture)
        
    }
    
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Location)
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
                self?.textFieldLatitude.errorMessage = errors[GenerateViewModelKey.LAT] ?? ""
                self?.textFieldLongtitude.errorMessage = errors[GenerateViewModelKey.LON] ?? ""
                self?.textFieldQuery.errorMessage = errors[GenerateViewModelKey.QUERY] ?? ""
            }
                
            else {
                if errors.count == 0{
                    self?.textFieldLatitude.errorMessage = ""
                    self?.textFieldLongtitude.errorMessage = ""
                    self?.textFieldQuery.errorMessage = ""
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
                resVC.contentData = ContentViewModel(data: LocationModel(latitude: Float((self?.textFieldLatitude.text)!) , longtitude: Float((self?.textFieldLongtitude.text)!), query: (self?.textFieldQuery.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                resVC.viewModel.typeCode = EnumType.LOCATION.rawValue
                if (self?.locationValue.isSeen)! == AppConstants.ISSEEN {
                    resVC.viewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.viewModel.createDateTime = (self?.locationValue.createDateTime)!

                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.latBinding.bind({ (value) in
            self.textFieldLatitude.text = String(value)
        })
        
        viewModel?.lonBinding.bind({ (value) in
            self.textFieldLongtitude.text = String(value)
        })
        
        viewModel?.queryBinding.bind({ (value) in
            self.textFieldQuery.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    
    
    private func clearDataTextfield() {
        
        self.textFieldLatitude.resignFirstResponder()
        self.textFieldLongtitude.resignFirstResponder()
        self.textFieldQuery.resignFirstResponder()
        
        self.textFieldLatitude.text = ""
        self.textFieldLongtitude.text = ""
        self.textFieldQuery.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    func checkIsSeenDetail(){
        if locationValue.isSeen == AppConstants.ISSEEN {
            textFieldLatitude.text = String(locationValue.latitude!)
            textFieldLongtitude.text = String(locationValue.longtitude!)
            textFieldQuery.text = locationValue.query ?? ""
        }
    }
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Place you press"
        self.viewMap.addAnnotation(annotation)
    }
    func defineValue(){
        self.viewModel?.typeCode = EnumType.LOCATION.rawValue
        self.viewModel?.lat = Float(textFieldLatitude.text!)
        self.viewModel?.lon = Float(textFieldLongtitude.text!)
        self.viewModel?.query = textFieldQuery.text
    }
    
}
extension LocationGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.textFieldLatitude.delegate = self
        self.textFieldLongtitude.delegate = self
        self.textFieldQuery.delegate = self
    }
    
}

extension LocationGenerateVC : SingleButtonDialogPresenter {
    
}
extension LocationGenerateVC : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionMeter, longitudinalMeters: regionMeter)
        viewMap.setRegion(region, animated: true)
        textFieldLatitude.text = String (location.coordinate.latitude)
        textFieldLongtitude.text = String(location.coordinate.longitude)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func checkLocationService(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }
        else{
            
        }
    }
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionMeter, longitudinalMeters: regionMeter)
            viewMap.setRegion(region, animated: true)
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            viewMap.showsUserLocation = true
            //centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            viewMap.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
            break
        case .authorizedAlways:
            break
        }
    }
}
extension LocationGenerateVC: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { print("no mkpointannotaions"); return nil }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.rightCalloutAccessoryView = UIButton(type: .infoDark)
            pinView!.pinTintColor = UIColor.black
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("tapped on pin ")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {    }
    }
}
