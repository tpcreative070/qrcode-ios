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
            viewBackground.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: AppConstants.MARGIN_TOP),
            viewBackground.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewBackground.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewBackground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND * 4.25)
        ])
        
        viewBackground.addSubview(viewLatBg)
        NSLayoutConstraint.activate([
            viewLatBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewLatBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewLatBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewLatBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
        ])
        viewLatBg.addSubview(lbLatitude)
        NSLayoutConstraint.activate([
            lbLatitude.topAnchor.constraint(equalTo: viewLatBg.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            lbLatitude.leadingAnchor.constraint(equalTo: viewLatBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbLatitude.trailingAnchor.constraint(equalTo: viewLatBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewLatBg.addSubview(textFieldLatitude)
        NSLayoutConstraint.activate([
            textFieldLatitude.topAnchor.constraint(equalTo: lbLatitude.bottomAnchor, constant: AppConstants.MARGIN_TOP_SUBITEM),
            textFieldLatitude.leadingAnchor.constraint(equalTo: viewLatBg.readableContentGuide.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            textFieldLatitude.trailingAnchor.constraint(equalTo: viewLatBg.readableContentGuide.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        viewBackground.addSubview(viewLongBg)
        NSLayoutConstraint.activate([
            viewLongBg.topAnchor.constraint(equalTo: viewLatBg.bottomAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
            viewLongBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewLongBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewLongBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
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
            viewQueryBg.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewQueryBg.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewQueryBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM)
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
            viewMap.leftAnchor.constraint(equalTo: viewBackground.readableContentGuide.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewMap.rightAnchor.constraint(equalTo: viewBackground.readableContentGuide.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewMap.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.HEIGHT_BACKGROUND_ITEM * 2.25)
        ])
        self.lbLatitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbLongtitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.lbQuery.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldLatitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldLatitude.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        self.textFieldQuery.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        
        self.keyboardHelper = KeyboardHelper(viewController: self, scrollView: scrollView)
        self.keyboardHelper?.setDismissKeyboardWhenTouchOutside()
        setupNavItems()
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        viewMap.addGestureRecognizer(longTapGesture)
        addTarget(textFieldLatitude)
        addTarget(textFieldLongtitude)
        addTarget(textFieldQuery)
    }
    func addTarget(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(inputFieldEditingDidEnd), for: .editingDidEnd)
    }
    func setupNavItems() {
        
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LanguageHelper.getTranslationByKey(LanguageKey.Location)
        let textAttributes = [NSAttributedString.Key.font: AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        let menuButtonRight = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRight.setBackgroundImage(UIImage(named: AppImages.IC_CHECK), for: .normal)
        menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchDown)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButtonRight)
    }
    
    func bindViewModel() {
        generateViewModel?.errorMessages.bind({ [weak self] errors in
            
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
        generateViewModel?.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            }
        }
        
        generateViewModel?.responseToView = { [weak self] value in
            
            if value == EnumResponseToView.CREATE_SUCCESS.rawValue {
                guard let lat = (self?.textFieldLatitude.text), let long = (self?.textFieldLongtitude.text), let query = (self?.textFieldQuery.text), let result = self?.generateViewModel?.result else {
                    return
                }
                let resVC = ResultGenerateVC()
                resVC.contentViewModel = ContentViewModel(data: LocationModel(latitude: Float(lat) , longtitude: Float(long), query: query))
                resVC.imgCode = result
                resVC.resultViewModel.typeCode = EnumType.LOCATION.rawValue
                if let isSeen = (self?.locationViewModel.isSeen), isSeen == AppConstants.ISSEEN {
                    guard let time = (self?.locationViewModel.createDateTime) else {
                        return
                    }
                    resVC.resultViewModel.isUpdate = AppConstants.ISUPDATE
                    resVC.resultViewModel.createDateTime = time
                    
                }
                self?.navigationController?.pushViewController(resVC, animated: true)
            }
        }
        generateViewModel?.onShowError = { [weak self] alert in
            self?.clearDataTextfield()
            self?.presentSingleButtonDialog(alert: alert)
        }
        generateViewModel?.latBinding.bind({ (value) in
            self.textFieldLatitude.text = String(value)
        })
        
        generateViewModel?.lonBinding.bind({ (value) in
            self.textFieldLongtitude.text = String(value)
        })
        
        generateViewModel?.queryBinding.bind({ (value) in
            self.textFieldQuery.text = value
        })
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    
    
    private func clearDataTextfield() {
        
        self.textFieldLatitude.resignFirstResponder()
        self.textFieldLongtitude.resignFirstResponder()
        self.textFieldQuery.resignFirstResponder()
        
        self.textFieldLatitude.text = ""
        self.textFieldLongtitude.text = ""
        self.textFieldQuery.text = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LAT] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.LON] = ""
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.QUERY] = ""
        
    }
    func checkIsSeenDetail(){
        if locationViewModel.isSeen == AppConstants.ISSEEN {
            textFieldLatitude.text = String(locationViewModel.latView)
            textFieldLongtitude.text = String(locationViewModel.longView)
            textFieldQuery.text = locationViewModel.query ?? ""
        }
    }
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Place you press"
        self.viewMap.addAnnotation(annotation)
    }
    func defineValue(){
        self.generateViewModel?.typeCode = EnumType.LOCATION.rawValue
        guard let lat = textFieldLatitude.text, let long = textFieldLongtitude.text else {
            return
        }
        self.generateViewModel?.lat = Float(lat)
        self.generateViewModel?.lon = Float(long)
        self.generateViewModel?.query = textFieldQuery.text
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
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: generateViewModel!.regionMeter, longitudinalMeters: generateViewModel!.regionMeter)
        viewMap.setRegion(region, animated: true)
        textFieldLatitude.text = String (round(location.coordinate.latitude * 100000)/100000)
        textFieldLongtitude.text = String(round(location.coordinate.longitude * 100000)/100000)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    func setupLocationManager(){
        generateViewModel?.locationManager.delegate = self
        generateViewModel?.locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
        if let location = generateViewModel?.locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: generateViewModel!.regionMeter, longitudinalMeters: generateViewModel!.regionMeter)
            viewMap.setRegion(region, animated: true)
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            viewMap.showsUserLocation = true
            //centerViewOnUserLocation()
            generateViewModel?.locationManager.startUpdatingLocation()
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            generateViewModel?.locationManager.requestWhenInUseAuthorization()
            viewMap.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
            break
        case .authorizedAlways:
            break
        default:
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
