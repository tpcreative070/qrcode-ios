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
            viewBackground.widthAnchor.constraint(equalToConstant: view.frame.width),
            viewBackground.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
        viewBackground.addSubview(wrapperFirstView)
        NSLayoutConstraint.activate([
            wrapperFirstView.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            wrapperFirstView.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            wrapperFirstView.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            wrapperFirstView.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            wrapperFirstView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/4)
        ])
        
        viewBackground.addSubview(viewIcon)
        NSLayoutConstraint.activate([
            viewIcon.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            viewIcon.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            viewIcon.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewIcon.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewIcon.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor)
        ])
        viewBackground.addSubview(viewScan)
        NSLayoutConstraint.activate([
            viewScan.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            viewScan.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            viewScan.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            viewScan.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            viewScan.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        viewBackground.addSubview(lbScannerRectangle)
        NSLayoutConstraint.activate([
            lbScannerRectangle.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            lbScannerRectangle.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            lbScannerRectangle.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: AppConstants.MARGIN_LEFT),
            lbScannerRectangle.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: AppConstants.MARGIN_RIGHT),
            lbScannerRectangle.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        viewBackground.addSubview(wrapperSecondView)
        NSLayoutConstraint.activate([
            wrapperSecondView.topAnchor.constraint(equalTo: lbScannerRectangle.bottomAnchor),
            wrapperSecondView.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            wrapperSecondView.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            wrapperSecondView.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            wrapperSecondView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/4)
        ])
        viewBackground.addSubview(wrapperThirdView)
        NSLayoutConstraint.activate([
            wrapperThirdView.topAnchor.constraint(equalTo: wrapperFirstView.bottomAnchor),
            wrapperThirdView.leftAnchor.constraint(equalTo: viewBackground.leftAnchor),
            wrapperThirdView.rightAnchor.constraint(equalTo: lbScannerRectangle.leftAnchor),
            wrapperThirdView.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            wrapperThirdView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        viewBackground.addSubview(wrapperFourView)
        NSLayoutConstraint.activate([
            wrapperFourView.topAnchor.constraint(equalTo: wrapperFirstView.bottomAnchor),
            wrapperFourView.leftAnchor.constraint(equalTo: lbScannerRectangle.rightAnchor),
            wrapperFourView.rightAnchor.constraint(equalTo: viewBackground.rightAnchor),
            wrapperFourView.widthAnchor.constraint(equalToConstant: viewBackground.frame.width),
            wrapperFourView.heightAnchor.constraint(equalTo: viewBackground.heightAnchor, multiplier: 1/2)
        ])
        viewIcon.addSubview(viewFlipCamera)
        NSLayoutConstraint.activate([
            
            viewFlipCamera.topAnchor.constraint(equalTo: viewIcon.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFlipCamera.leadingAnchor.constraint(equalTo: viewIcon.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            viewFlipCamera.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            viewFlipCamera.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewFlipCamera.addSubview(imgFlipCamera)
        NSLayoutConstraint.activate([
            imgFlipCamera.topAnchor.constraint(equalTo: viewFlipCamera.topAnchor),
            imgFlipCamera.leadingAnchor.constraint(equalTo: viewFlipCamera.leadingAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
            imgFlipCamera.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            imgFlipCamera.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewFlashBg)
        NSLayoutConstraint.activate([
            
            viewFlashBg.topAnchor.constraint(equalTo: viewIcon.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewFlashBg.leadingAnchor.constraint(equalTo: viewFlipCamera.trailingAnchor, constant: AppConstants.MARGIN_LEFT_ICON),
            viewFlashBg.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            viewFlashBg.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewFlashBg.addSubview(imgFlashOff)
        NSLayoutConstraint.activate([
            imgFlashOff.topAnchor.constraint(equalTo: viewFlashBg.topAnchor),
            imgFlashOff.leadingAnchor.constraint(equalTo: viewFlashBg.leadingAnchor),
            imgFlashOff.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            imgFlashOff.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewHelpBg)
        NSLayoutConstraint.activate([
            viewHelpBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewHelpBg.leadingAnchor.constraint(equalTo: viewFlashBg.trailingAnchor, constant:  AppConstants.MARGIN_LEFT_ALERT_BTN),
            viewHelpBg.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            viewHelpBg.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        
        viewHelpBg.addSubview(imgHelp)
        NSLayoutConstraint.activate([
            imgHelp.topAnchor.constraint(equalTo: viewHelpBg.topAnchor),
            imgHelp.leadingAnchor.constraint(equalTo: viewHelpBg.leadingAnchor),
            imgHelp.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            imgHelp.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewIcon.addSubview(viewScanBg)
        NSLayoutConstraint.activate([
            
            viewScanBg.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            viewScanBg.leadingAnchor.constraint(equalTo: viewHelpBg.trailingAnchor, constant: AppConstants.MARGIN_LEFT_ICON),
            viewScanBg.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            viewScanBg.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        viewScanBg.addSubview(imgScan)
        NSLayoutConstraint.activate([
            imgScan.topAnchor.constraint(equalTo: viewScanBg.topAnchor),
            imgScan.leadingAnchor.constraint(equalTo: viewScanBg.leadingAnchor),
            imgScan.widthAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT),
            imgScan.heightAnchor.constraint(equalToConstant: AppConstants.ICON_SCAN_WIDTH_HEIGHT)
        ])
        
        let tapScan = UITapGestureRecognizer(target: self, action: #selector(actionGallery(sender:)))
        self.viewScanBg.addGestureRecognizer(tapScan)
        let tapFrontCamera = UITapGestureRecognizer(target: self, action: #selector(actionFrontCamera(sender:)))
        self.viewFlipCamera.addGestureRecognizer(tapFrontCamera)
        let tapHelp = UITapGestureRecognizer(target: self, action: #selector(actionHelp(sender:)))
        self.viewHelpBg.addGestureRecognizer(tapHelp)
        let tapFlash = UITapGestureRecognizer(target: self, action: #selector(actionFlash(sender:)))
        self.viewFlashBg.addGestureRecognizer(tapFlash)
        
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
        print(viewScan.frame)
        
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
    
    
    func barcodeFormatToString(format: ZXBarcodeFormat) -> String {
        switch (format) {
        case kBarcodeFormatAztec:
            return LanguageKey.Aztec
            
        case kBarcodeFormatCodabar:
            return LanguageKey.CODABAR
            
        case kBarcodeFormatCode39:
            return LanguageKey.Code_39
            
        case kBarcodeFormatCode93:
            return LanguageKey.Code_93
            
        case kBarcodeFormatCode128:
            return LanguageKey.Code_128
            
        case kBarcodeFormatDataMatrix:
            return LanguageKey.Data_Matrix
            
        case kBarcodeFormatEan8:
            return LanguageKey.EAN_8
            
        case kBarcodeFormatEan13:
            return LanguageKey.EAN_13
            
        case kBarcodeFormatITF:
            return LanguageKey.ITF
            
        case kBarcodeFormatPDF417:
            return LanguageKey.PDF417
            
        case kBarcodeFormatQRCode:
            return LanguageKey.QR_Code
            
        case kBarcodeFormatRSS14:
            return LanguageKey.RSS_14
            
        case kBarcodeFormatRSSExpanded:
            return LanguageKey.RSS_Expanded
            
        case kBarcodeFormatUPCA:
            return LanguageKey.UPCA
            
        case kBarcodeFormatUPCE:
            return LanguageKey.UPCE
            
        case kBarcodeFormatUPCEANExtension:
            return LanguageKey.UPC_EAN_extension
            
        default:
            return LanguageKey.Unknown
        }
    }
    func bindViewModel() {
        
        self.viewModel.showLoading.bind { visible in
            print(visible)
         //   visible ? ProgressHUD.show(): ProgressHUD.dismiss()
            if visible{
             //   self.viewBackground.bringSubviewToFront(self.wrapperFirstView)
              //  self.view.backgroundColor = .blue
                ProgressHUD.showInView(view: self.view)
            }
            else{
                ProgressHUD.dismiss()
            }
        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        self.viewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                let vc = QRCodeVC()
                vc.viewModel.listQRResult = (self?.viewModel.listResult)!
                vc.viewModel.dateTime = self?.viewModel.dateTime
                self?.navigationController?.pushViewController(vc,animated: true)
            }
        }
        self.viewModel.navigate = { [weak self] in
            print(self!.viewModel.listResult.count)
            if self!.viewModel.listResult.count > 1{
                self?.viewModel.listResult.removeAll()
               // self?.viewModel.defaultValue()
            }
            else{
            let  vc = DetailVC()
            vc.listContentViewModel = (self?.viewModel.listTransaction)!
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.viewModel.defaultValue()
            }
        }
        self.viewModel.resultScan.bind { value in
            //            let alert = UIAlertController(title: "Result", message: value, preferredStyle: .alert)
            //            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            //            self.present(alert,animated: true,completion: nil)
        }
        
        //        viewModel.cameraBinding.bind {[weak self] value in
        //            DispatchQueue.main.async {
        //                if !value {
        //                      self?.doAlertMessage(permission: "Camera")
        //                }
        //            }
        //        }
    }
    
    
    
    func onTakeGallery(){
        let imagePicker = OpalImagePickerController()
        imagePicker.imagePickerDelegate = self
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
                print(view.layer.bounds)
            }
            catch{
                print(error)
            }
        }
    }
    func setuplayoutCamera(){
        let output = AVCaptureMetadataOutput()
        session?.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr, .code128, .code39, .code93,.dataMatrix,.ean13,.ean8,.aztec,.pdf417,.upce,.code39Mod43]
        video = AVCaptureVideoPreviewLayer(session: session!)
        video.videoGravity = AVLayerVideoGravity.resizeAspectFill
        video.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        video.frame = view.layer.bounds
        viewBackground.layer.addSublayer(video)
        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = AppConstants.WIDTH_BORDER_SCAN
        viewScan.setFrameSize(roi: lbScannerRectangle)
        viewScan.drawCorners()
        self.viewBackground.bringSubviewToFront(wrapperFirstView)
        self.viewBackground.bringSubviewToFront(wrapperSecondView)
        self.viewBackground.bringSubviewToFront(wrapperThirdView)
        self.viewBackground.bringSubviewToFront(wrapperFourView)
        self.lbScannerRectangle.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.viewBackground.bringSubviewToFront(viewIcon)
        self.viewBackground.bringSubviewToFront(viewFlipCamera)
        self.viewBackground.bringSubviewToFront(viewHelpBg)
        self.viewBackground.bringSubviewToFront(viewFlashBg)
        self.viewBackground.bringSubviewToFront(viewScan)
        self.viewBackground.bringSubviewToFront(viewScan)
        self.viewBackground.bringSubviewToFront(lbScannerRectangle)
        session?.startRunning()
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
        if metadataObjects != nil && metadataObjects.count != 0 {
            let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            print(object)
            if object?.stringValue != nil
            {
                print(AppConstants.isVibrate)
                if AppConstants.isVibrate == 1 {
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                }
                if AppConstants.isBeep == 1 {
                      SoundHelper.shared.play()
                }
                isScanning = false
                viewModel.isScanner = true
                viewModel.scannerResult(mValue: "\(String(describing: (object?.stringValue)!))")
                session?.stopRunning()
            }
            else{
                print("nil object")
            }
            
        }
        else{
            
        }
    }
}
extension ScannerVC : OpalImagePickerControllerDelegate {
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        self.viewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))

        self.viewModel.doAsync(list: images)
        
        viewModel.doGetListTransaction()

    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
        print("didF")
        ProgressHUD.showInView(view: self.view)
       // ProgressHUD.dismiss()
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        print("cancel")
         ProgressHUD.dismiss()
    }
}
// MARK: ZXCaptureDelegate
extension ScannerVC: ZXCaptureDelegate {
    func captureCameraIsReady(_ capture: ZXCapture!) {
        isScanning = true
    }
    
    func captureResult(_ capture: ZXCapture!, result: ZXResult!) {
        guard let _result = result, isScanning == true else { return }
        
        capture?.stop()
        isScanning = false
        viewModel.isScanner = true
        viewModel.scannerResult(mValue: "\(result!)")
     
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

