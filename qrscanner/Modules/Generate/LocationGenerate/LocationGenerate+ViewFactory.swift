//
//  LocationGenerate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
extension LocationGenerateVC {
    func initUI() {
        let gety = view.frame.height * 3.5/7
        let value_item = view.frame.height/7
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: gety)
            
        ])

        backgroundView.addSubview(LatBg)
        NSLayoutConstraint.activate([
            LatBg.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            LatBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            LatBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            LatBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        LatBg.addSubview(latLbL)
        NSLayoutConstraint.activate([
            latLbL.topAnchor.constraint(equalTo: LatBg.topAnchor, constant: 20),
            latLbL.leadingAnchor.constraint(equalTo: LatBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            latLbL.trailingAnchor.constraint(equalTo: LatBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        LatBg.addSubview(latTxt)
        NSLayoutConstraint.activate([
            latTxt.topAnchor.constraint(equalTo: latLbL.bottomAnchor, constant: 5),
            latTxt.leadingAnchor.constraint(equalTo: LatBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            latTxt.trailingAnchor.constraint(equalTo: LatBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        backgroundView.addSubview(LonBg)
        NSLayoutConstraint.activate([
            LonBg.topAnchor.constraint(equalTo: LatBg.bottomAnchor, constant: 10),
            LonBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            LonBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            LonBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        LonBg.addSubview(lonLbL)
        NSLayoutConstraint.activate([
            lonLbL.topAnchor.constraint(equalTo: LonBg.topAnchor, constant: 20),
            lonLbL.leadingAnchor.constraint(equalTo: LonBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lonLbL.trailingAnchor.constraint(equalTo: LonBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        LonBg.addSubview(lonTxt)
        NSLayoutConstraint.activate([
            lonTxt.topAnchor.constraint(equalTo: lonLbL.bottomAnchor, constant: 5),
            lonTxt.leadingAnchor.constraint(equalTo: LonBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lonTxt.trailingAnchor.constraint(equalTo: LonBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        
        backgroundView.addSubview(queryBg)
        NSLayoutConstraint.activate([
            queryBg.topAnchor.constraint(equalTo: LonBg.bottomAnchor, constant: 10),
            queryBg.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            queryBg.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            queryBg.heightAnchor.constraint(equalToConstant: value_item)
        ])
        queryBg.addSubview(queryLbL)
        NSLayoutConstraint.activate([
            queryLbL.topAnchor.constraint(equalTo: queryBg.topAnchor, constant: 20),
            queryLbL.leadingAnchor.constraint(equalTo: queryBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            queryLbL.trailingAnchor.constraint(equalTo: queryBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        queryBg.addSubview(queryTxt)
        NSLayoutConstraint.activate([
            queryTxt.topAnchor.constraint(equalTo: queryLbL.bottomAnchor, constant: 5),
            queryTxt.leadingAnchor.constraint(equalTo: queryBg.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            queryTxt.trailingAnchor.constraint(equalTo: queryBg.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10),
            mapView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 5),
            mapView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -5),
            mapView.heightAnchor.constraint(equalToConstant: value_item*2)
        ])
      
        setupNavItems()
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        mapView.addGestureRecognizer(longTapGesture)
        
    }
 
    func setupNavItems() {
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageKey.Location
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
                self?.latTxt.errorMessage = errors[GenerateViewModelKey.LAT] ?? ""
                self?.lonTxt.errorMessage = errors[GenerateViewModelKey.LON] ?? ""
                self?.queryTxt.errorMessage = errors[GenerateViewModelKey.QUERY] ?? ""
            }
                
            else {
                if errors.count == 0{
                    self?.latTxt.errorMessage = ""
                    self?.lonTxt.errorMessage = ""
                    self?.queryTxt.errorMessage = ""
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
                resVC.typeCode = LanguageKey.Location
                resVC.createDateTime = self!.createDateTime
                resVC.contentData = ContentModel(data: LocationModel(latitude: Float((self?.latTxt.text)!) , longtitude: Float((self?.lonTxt.text)!), query: (self?.queryTxt.text)!))
                resVC.imgCode = (self?.viewModel?.result)!
                if self?.isSeen == AppConstants.ISSEEN {
                    resVC.isUpdate = AppConstants.ISUPDATE
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        viewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        viewModel?.latBinding.bind({ (value) in
            self.latTxt.text = String(value)
        })
        
        viewModel?.lonBinding.bind({ (value) in
            self.lonTxt.text = String(value)
        })
        
        viewModel?.queryBinding.bind({ (value) in
            self.queryTxt.text = value
        })
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    
    
    private func clearDataTextfield() {
        
        self.latTxt.resignFirstResponder()
        self.lonTxt.resignFirstResponder()
        self.queryTxt.resignFirstResponder()
        
        self.latTxt.text = ""
        self.lonTxt.text = ""
        self.queryTxt.text = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.viewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            latTxt.text = String(locationValue.latitude ?? 0)
            lonTxt.text = String(locationValue.longtitude ?? 0)
            queryTxt.text = locationValue.query ?? ""
        }
    }
    
    
}
extension LocationGenerateVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDelegate() {
        self.latTxt.delegate = self
        self.lonTxt.delegate = self
        self.queryTxt.delegate = self
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
        mapView.setRegion(region, animated: true)
        latTxt.text = String (location.coordinate.latitude)
        lonTxt.text = String(location.coordinate.longitude)
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
            mapView.setRegion(region, animated: true)
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            //centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
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
