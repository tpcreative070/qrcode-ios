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
            captureRotation = 0
            scanRectRotation = 90
            break
            
        case .landscapeLeft:
            captureRotation = 90
            scanRectRotation = 180
            break
            
        case .landscapeRight:
            captureRotation = 270
            scanRectRotation = 0
            break
            
        case .portraitUpsideDown:
            captureRotation = 180
            scanRectRotation = 270
            break
            
        default:
            captureRotation = 0
            scanRectRotation = 90
            break
        }
        
        applyRectOfInterest(orientation: orientation)
        
        let angleRadius = captureRotation / 180.0 * Double.pi
        let captureTranform = CGAffineTransform(rotationAngle: CGFloat(angleRadius))
        
        capture?.transform = captureTranform
        capture?.rotation = CGFloat(scanRectRotation)
        capture?.layer.frame = view.frame
        capture?.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
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
            videoHeight = 1080.0
            videoWidth = 1920.0
        } else {
            videoHeight = 720.0
            videoWidth = 1280.0
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
            print("Aztec")
            return "Aztec"
            
        case kBarcodeFormatCodabar:
            print("CODABAR")
            return "CODABAR"
            
        case kBarcodeFormatCode39:
            print("Code 39")
            return "Code 39"
            
        case kBarcodeFormatCode93:
            print("Code 93")
            return "Code 93"
            
        case kBarcodeFormatCode128:
            print("Code 128")
            return "Code 128"
            
        case kBarcodeFormatDataMatrix:
            print("Data Matrix")
            return "Data Matrix"
            
        case kBarcodeFormatEan8:
            print("EAN-8")
            return "EAN-8"
            
        case kBarcodeFormatEan13:
            print("EAN-13")
            return "EAN-13"
            
        case kBarcodeFormatITF:
            print("ITF")
            return "ITF"
            
        case kBarcodeFormatPDF417:
            print("PDF417")
            return "PDF417"
            
        case kBarcodeFormatQRCode:
            print("QR Code")
            return "QR Code"
            
        case kBarcodeFormatRSS14:
            print("RSS 14")
            return "RSS 14"
            
        case kBarcodeFormatRSSExpanded:
            print("RSS Expanded")
            return "RSS Expanded"
            
        case kBarcodeFormatUPCA:
            print("UPCA")
            return "UPCA"
            
        case kBarcodeFormatUPCE:
            print("UPCE")
            return "UPCE"
            
        case kBarcodeFormatUPCEANExtension:
            print("UPC/EAN extension")
            return "UPC/EAN extension"
            
        default:
            return "Unknown"
        }
    }
    func bindViewModel() {
        self.viewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModel.navigate = { [weak self] in
            let  vc = DetailVC()
            vc.listContentViewModel = (self?.viewModel.listItemContent)!
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.viewModel.defaultValue()
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
}
extension ScannerVC : OpalImagePickerControllerDelegate {
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        self.viewModel.doAsync(list: images)
    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
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

