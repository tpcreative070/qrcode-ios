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
        view.addSubview(bgView)
        bgView.addSubview(scanView)
        
        NSLayoutConstraint.activate([
            scanView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scanView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            scanView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            scanView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            
            scanView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2)
        ])
        bgView.addSubview(lbScannerRectangle)
        
        NSLayoutConstraint.activate([
            lbScannerRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lbScannerRectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            lbScannerRectangle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            lbScannerRectangle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            lbScannerRectangle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3)
        ])
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
    }
    
    func applyRectOfInterest(orientation: UIInterfaceOrientation) {
        guard var transformedVideoRect = scanView?.frame,
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
        
        self.viewModel.responseToView = {[weak self] value in
           
        }
        
        
        
        self.viewModel.resultScan.bind { value in
//            let alert = UIAlertController(title: "Result", message: value, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
//            self.present(alert,animated: true,completion: nil)
        }
        
        viewModel.cameraBinding.bind {[weak self] value in
            DispatchQueue.main.async {
                if !value {
                    self?.doAlertMessage(permission: "Camera")
                }
            }
        }
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
        print(_result.barcodeFormat)
        print(_result.resultMetadata)
         print(_result.resultPoints)
        let text = _result.text ?? "Unknow"
        let format = barcodeFormatToString(format: _result.barcodeFormat)

        let displayStr = "Scanned !\nFormat: \(format)\nContents: \(text)"
//        print(displayStr)
//        resultLabel?.text = displayStr
        print(format)
        viewModel.scannerResult(mValue: "\(result!)")
        let alert = UIAlertController(title: "Result", message: text, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                   self.present(alert,animated: true,completion: nil)
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

