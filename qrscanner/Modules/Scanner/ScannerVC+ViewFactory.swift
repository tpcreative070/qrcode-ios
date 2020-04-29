//
//  ScannerVC+ViewFactory.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
import Photos
extension ScannerVC {
    func iniUI(){
        view.addSubview(viewBackground)
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        
        viewBackground.addSubview(viewIcon)
        NSLayoutConstraint.activate([
            viewIcon.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            viewIcon.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT_SCAN),
            viewIcon.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: DeviceHelper.Shared.MARGIN_RIGHT_SCAN),
            viewIcon.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            viewIcon.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_VIEWICON)
        ])
        viewBackground.addSubview(viewScan)
        NSLayoutConstraint.activate([
            viewScan.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            viewScan.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            viewScan.widthAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2),
            viewScan.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        viewBackground.addSubview(lbScannerRectangle)
        NSLayoutConstraint.activate([
            lbScannerRectangle.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            lbScannerRectangle.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            lbScannerRectangle.widthAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2),
            lbScannerRectangle.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        
        
        
        viewIcon.addSubview(viewFlipCamera)
        NSLayoutConstraint.activate([
            
            viewFlipCamera.topAnchor.constraint(equalTo: viewIcon.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFlipCamera.leadingAnchor.constraint(equalTo: viewIcon.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFlipCamera.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            viewFlipCamera.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewFlipCamera.addSubview(imgFlipCamera)
        NSLayoutConstraint.activate([
            imgFlipCamera.topAnchor.constraint(equalTo: viewFlipCamera.topAnchor),
            imgFlipCamera.leadingAnchor.constraint(equalTo: viewFlipCamera.leadingAnchor),
            imgFlipCamera.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            imgFlipCamera.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewFlashBg)
        NSLayoutConstraint.activate([
            
            viewFlashBg.topAnchor.constraint(equalTo: viewIcon.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFlashBg.leadingAnchor.constraint(equalTo: viewFlipCamera.trailingAnchor, constant: DeviceHelper.Shared.MARGIN_LEFT_ICON),
            viewFlashBg.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            viewFlashBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewFlashBg.addSubview(imgFlashOff)
        NSLayoutConstraint.activate([
            imgFlashOff.topAnchor.constraint(equalTo: viewFlashBg.topAnchor),
            imgFlashOff.leadingAnchor.constraint(equalTo: viewFlashBg.leadingAnchor),
            imgFlashOff.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            imgFlashOff.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewScanBg)
        NSLayoutConstraint.activate([
            
            viewScanBg.topAnchor.constraint(equalTo: viewIcon.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewScanBg.trailingAnchor.constraint(equalTo: viewIcon.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewScanBg.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            viewScanBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewScanBg.addSubview(imgScan)
        NSLayoutConstraint.activate([
            imgScan.topAnchor.constraint(equalTo: viewScanBg.topAnchor),
            imgScan.leadingAnchor.constraint(equalTo: viewScanBg.leadingAnchor),
            imgScan.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            imgScan.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewHelpBg)
        NSLayoutConstraint.activate([
            viewHelpBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewHelpBg.trailingAnchor.constraint(equalTo: viewScanBg.leadingAnchor, constant:  DeviceHelper.Shared.MARGIN_RIGHT_ICON),
            viewHelpBg.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            viewHelpBg.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        
        viewHelpBg.addSubview(imgHelp)
        NSLayoutConstraint.activate([
            imgHelp.topAnchor.constraint(equalTo: viewHelpBg.topAnchor),
            imgHelp.leadingAnchor.constraint(equalTo: viewHelpBg.leadingAnchor),
            imgHelp.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT),
            imgHelp.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SCAN_WIDTH_HEIGHT)
        ])
        
        self.view.layoutIfNeeded()
        self.viewBackground.layoutIfNeeded()
        let tapScan = UITapGestureRecognizer(target: self, action: #selector(actionGallery(sender:)))
        self.viewScanBg.addGestureRecognizer(tapScan)
        let tapFrontCamera = UITapGestureRecognizer(target: self, action: #selector(actionFrontCamera(sender:)))
        self.viewFlipCamera.addGestureRecognizer(tapFrontCamera)
        let tapHelp = UITapGestureRecognizer(target: self, action: #selector(actionHelp(sender:)))
        self.viewHelpBg.addGestureRecognizer(tapHelp)
        let tapFlash = UITapGestureRecognizer(target: self, action: #selector(actionFlash(sender:)))
        self.viewFlashBg.addGestureRecognizer(tapFlash)
        let pathBigRect = UIBezierPath(rect: viewBackground.frame)
        let pathSmallRect = UIBezierPath(roundedRect: CGRect(x: self.viewScan.frame.origin.x + 20 , y: self.viewScan.frame.origin.y - 20, width: view.frame.height/2.27, height: view.frame.height/2.27), cornerRadius: 10)
        pathBigRect.append(pathSmallRect)
        pathBigRect.usesEvenOddFillRule = true
        fillLayer.path = pathBigRect.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor(white: 0.3, alpha: 0.5).cgColor
        
    }
    func setuplayoutCamera(){
        let output = AVCaptureMetadataOutput()
        session?.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr, .code128, .code39, .code93,.dataMatrix,.ean13,.ean8,.aztec,.pdf417,.upce,.code39Mod43,.itf14]
        video = AVCaptureVideoPreviewLayer(session: session!)
        video.videoGravity = AVLayerVideoGravity.resizeAspectFill
        video.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        video.frame = view.layer.bounds
        viewBackground.layer.addSublayer(video)
        viewBackground.layer.addSublayer(fillLayer)
        
        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = AppConstants.WIDTH_BORDER_SCAN
        viewScan.setFrameSize(roi: lbScannerRectangle)
        viewScan.drawCorners()
        self.viewBackground.bringSubviewToFront(viewIcon)
        self.viewBackground.bringSubviewToFront(viewFlipCamera)
        self.viewBackground.bringSubviewToFront(viewHelpBg)
        self.viewBackground.bringSubviewToFront(viewFlashBg)
        self.viewBackground.bringSubviewToFront(viewScan)
        self.viewBackground.bringSubviewToFront(lbScannerRectangle)
        session?.startRunning()
    }
    func setupFooter(){
        viewBackground.addSubview(viewFooter)
        NSLayoutConstraint.activate([
            viewFooter.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM_ITEM),
            viewFooter.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFooter.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewFooter.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor)
        ])
        viewFooter.addSubview(lbTotal)
        NSLayoutConstraint.activate([
            lbTotal.topAnchor.constraint(equalTo: viewFooter.topAnchor),
            lbTotal.bottomAnchor.constraint(equalTo: viewFooter.bottomAnchor),
            lbTotal.leftAnchor.constraint(equalTo: viewFooter.leftAnchor),
        ])
        viewFooter.addSubview(lbTotalResult)
        NSLayoutConstraint.activate([
            lbTotalResult.topAnchor.constraint(equalTo: viewFooter.topAnchor),
            lbTotalResult.bottomAnchor.constraint(equalTo: viewFooter.bottomAnchor),
            lbTotalResult.leftAnchor.constraint(equalTo: lbTotal.rightAnchor, constant: AppConstants.MARGIN_LEFT),
        ])
        viewFooter.addSubview(btnOK)
        NSLayoutConstraint.activate([
            btnOK.topAnchor.constraint(equalTo: viewFooter.topAnchor),
            btnOK.bottomAnchor.constraint(equalTo: viewFooter.bottomAnchor),
            btnOK.rightAnchor.constraint(equalTo: viewFooter.rightAnchor, constant: AppConstants.MARGIN_RIGHT)
        ])
        self.lbTotalResult.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
        self.lbTotalResult.textColor = .white
        btnOK.addTarget(self, action: #selector(doneScanner), for: .touchUpInside)
    }
    
    func applyOrientation() {
        let orientation = UIApplication.shared.statusBarOrientation
        var captureRotation: Double
        var scanRectRotation: Double
        
        switch orientation {
        case .portrait:
            captureRotation = AppConstants.CAPTURE_ROTATION
            scanRectRotation = AppConstants.SCAN_REACT_ROTATION_90
            break
            
        case .landscapeLeft:
            captureRotation = AppConstants.SCAN_REACT_ROTATION_90
            scanRectRotation = AppConstants.SCAN_REACT_ROTATION_180
            break
            
        case .landscapeRight:
            captureRotation = AppConstants.SCAN_REACT_ROTATION_270
            scanRectRotation = AppConstants.CAPTURE_ROTATION
            break
            
        case .portraitUpsideDown:
            captureRotation = AppConstants.SCAN_REACT_ROTATION_180
            scanRectRotation = AppConstants.SCAN_REACT_ROTATION_270
            break
            
        default:
            captureRotation = AppConstants.CAPTURE_ROTATION
            scanRectRotation = AppConstants.SCAN_REACT_ROTATION_90
            break
        }
        
        applyRectOfInterest(orientation: orientation)
        
        let angleRadius = captureRotation / AppConstants.SCAN_REACT_ROTATION_180 * Double.pi
        let captureTranform = CGAffineTransform(rotationAngle: CGFloat(angleRadius))
        
        capture?.transform = captureTranform
        capture?.rotation = CGFloat(scanRectRotation)
        capture?.layer.frame = view.frame
        capture?.layer.backgroundColor = UIColor.white.withAlphaComponent(AppConstants.WITH_ALPHA_COMPONENT).cgColor
    }
    
    func applyRectOfInterest(orientation: UIInterfaceOrientation) {
        
        guard var transformedVideoRect = viewScan?.frame,
            let cameraSessionPreset = capture?.sessionPreset
            else { return }
        var scaleVideoX, scaleVideoY: CGFloat
        var videoHeight, videoWidth: CGFloat
        
        // Currently support only for 1920x1080 || 1280x720
        if cameraSessionPreset == AVCaptureSession.Preset.hd1920x1080.rawValue {
            videoHeight = AppConstants.VIDEO_HEIGHT_1080
            videoWidth = AppConstants.VIDEO_HEIGHT_1920
        } else {
            videoHeight = AppConstants.VIDEO_HEIGHT_720
            videoWidth = AppConstants.VIDEO_HEIGHT_1280
        }
        
        if orientation == UIInterfaceOrientation.portrait {
            scaleVideoX = self.view.frame.width / videoHeight
            scaleVideoY = self.view.frame.height / videoWidth
            
            // Convert CGPoint under portrait mode to map with orientation of image
            // because the image will be cropped before rotate
            // reference: https://github.com/TheLevelUp/ZXingObjC/issues/222
            let realX = transformedVideoRect.origin.y;
            let realY = self.view.frame.size.width - transformedVideoRect.size.width - transformedVideoRect.origin.x;
            let realWidth = transformedVideoRect.size.height;
            let realHeight = transformedVideoRect.size.width;
            transformedVideoRect = CGRect(x: realX, y: realY, width: realWidth, height: realHeight);
            
        } else {
            scaleVideoX = self.view.frame.width / videoWidth
            scaleVideoY = self.view.frame.height / videoHeight
        }
        
        captureSizeTransform = CGAffineTransform(scaleX: 1.0/scaleVideoX, y: 1.0/scaleVideoY)
        guard let _captureSizeTransform = captureSizeTransform else { return }
        let transformRect = transformedVideoRect.applying(_captureSizeTransform)
        capture?.scanRect = transformRect
    }
    
    
    
    func bindViewModel() {
        
        self.scannerviewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.scannerviewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        self.scannerviewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                let vc = QRCodeVC()
                vc.viewModel.listQRResult = (self?.scannerviewModel.listResult)!
                vc.viewModel.dateTime = self?.scannerviewModel.dateTime
                self?.navigationController?.pushViewController(vc,animated: true)
                UserDefaults(suiteName: AppConstants.sharedIndentifier)!.removeObject(forKey: AppConstants.shareKey)
                UserDefaults.standard.removeObject(forKey: AppConstants.keyImageData)
            }
        }
        self.scannerviewModel.navigate = { [weak self] in
            if self!.scannerviewModel.listResult.count > 1{
                self?.scannerviewModel.listResult.removeAll()
            }
            else{
                let  vc = DetailVC()
                vc.listContentViewModel = (self?.scannerviewModel.listTransaction)!
                self?.navigationController?.pushViewController(vc, animated: true)
                self?.scannerviewModel.defaultValue()
                UserDefaults(suiteName: AppConstants.sharedIndentifier)!.removeObject(forKey: AppConstants.shareKey)
                UserDefaults.standard.removeObject(forKey: AppConstants.keyImageData)
            }
        }
        self.scannerviewModel.resultScan.bind { value in
            //            let alert = UIAlertController(title: "Result", message: value, preferredStyle: .alert)
            //            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            //            self.present(alert,animated: true,completion: nil)
        }
        
    }
    func fetchData(){
        
        let arr = UserDefaults.standard.array(forKey: AppConstants.keyImageData) as? [Data]
        if arr != nil {
            if arr!.count > 0{
                ProgressHUD.showInView(view: self.view)
                for item in arr! {
                    print(item.base64EncodedString())
                    let rawImage = UIImage(data: item)
                    scannerviewModel.listImage.append(rawImage!)
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                    //                  DispatchQueue.main.async(execute: { () -> Void in
                    self.scannerviewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))
                    self.scannerviewModel.doAsync(list:self.scannerviewModel.listImage)
                    self.scannerviewModel.doGetListTransaction()
                    //
                    //                  })
                }
            }
        }
        if let prefs = UserDefaults(suiteName: AppConstants.sharedIndentifier) {
            if let imageData = prefs.object(forKey: AppConstants.shareKey) as? [Data] {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                    ProgressHUD.showInView(view: self.view)
                }
                for item in imageData {
                    let rawImage = UIImage(data: item)
                    scannerviewModel.listImage.append(rawImage!)
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                    //                  DispatchQueue.main.async(execute: { () -> Void in
                    self.scannerviewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))
                    self.scannerviewModel.doAsync(list:self.scannerviewModel.listImage)
                    self.scannerviewModel.doGetListTransaction()
                    //
                    //                  })
                }
            }
            
        }
    }
    
    func onTakeGallery(){
        let imagePicker = OpalImagePickerController()
        imagePicker.imagePickerDelegate = self
        if  !UserDefaults.standard.bool(forKey:KeyUserDefault.MultiLoad){
            imagePicker.maximumSelectionsAllowed = 1
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func setupCameraBack()
    {
        if backCamera?.isConnected == true {
            session?.stopRunning()
            let captureDevice =  AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do{
                
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                session = AVCaptureSession()
                session?.addInput(input)
                setuplayoutCamera()
                
            }
            catch{
                print(error)
            }
        }
        
    }
    func setupCameraFront()
    {
        if frontCamera?.isConnected == true {
            session?.stopRunning()
            let captureDevice =  AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do{
                
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                session = AVCaptureSession()
                session?.addInput(input)
                setuplayoutCamera()
            }
            catch{
                print(error)
            }
        }
    }
    
    
    
    func clearInput(){
        if let inputs = session?.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                session?.removeInput(input)
            }
        }
        session?.stopRunning()
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if AppConstants.isCam == 1{
        }
        else{
            if metadataObjects != nil && metadataObjects.count != 0 {
                let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
                print(object?.type.rawValue)

                if object?.stringValue != nil
                {
                    if  Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Vibrate) ?? false)
                    {
                        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                    }
                    if  Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Beep) ?? false) {
                        SoundHelper.shared.play()
                    }
                    if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.MultiScan) ?? false){
                        viewFooter.isHidden = false
                        setupFooter()
                        self.viewBackground.bringSubviewToFront(viewFooter)
                        let scanner = ScannerModel(value: (String((object?.stringValue)!)), typeScan: (object?.type.rawValue ?? ""))
                        scannerviewModel.listScanner.append(scanner)
                        lbTotalResult.text =  "\(scannerviewModel.listScanner.count)"
                        session?.stopRunning()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.session?.startRunning()
                        }
                    }
                    else{
                        scannerviewModel.listScanner.removeAll()
                        viewFooter.isHidden = true
                        lbTotalResult.text =  "\(scannerviewModel.listScanner.count)"
                        isScanning = false
                        scannerviewModel.isScanner = true
                        self.scannerviewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))
                        scannerviewModel.scannerResult(mValue: "\(String((object?.stringValue)!))", mType: (object?.type.rawValue ?? ""))
                        session?.stopRunning()
                    }
                }
                else{
                }
                
            }
            else{
                
            }
        }
    }
}
extension ScannerVC : OpalImagePickerControllerDelegate {
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        
        self.scannerviewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))
        if  UserDefaults.standard.bool(forKey:KeyUserDefault.MultiLoad){
            self.scannerviewModel.doAsync(list: images)
            scannerviewModel.doGetListTransaction()
        }
        else{
            if images.count > 1{
                let alert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message:LanguageHelper.getTranslationByKey(LanguageKey.ChooseOneQRCode) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Ok), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                ProgressHUD.dismiss()
                
            }
            else{
                self.scannerviewModel.doAsync(list: images)
                scannerviewModel.doGetListTransaction()
            }
        }
        
        
    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
        ProgressHUD.showInView(view: self.view)
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        ProgressHUD.dismiss()
    }
    
}

// MARK: ZXCaptureDelegate
extension ScannerVC: ZXCaptureDelegate {
    func captureCameraIsReady(_ capture: ZXCapture!) {
        isScanning = true
    }
    
    func captureResult(_ capture: ZXCapture!, result: ZXResult!) {
        // guard let _result = result, isScanning == true else { return }
        
        capture?.stop()
        isScanning = false
        scannerviewModel.isScanner = true
        //     viewModel.scannerResult(mValue: "\(result!)")
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.isScanning = true
            weakSelf.capture?.start()
        }
    }
    
}
extension ScannerVC : SingleButtonDialogPresenter {
    
}
