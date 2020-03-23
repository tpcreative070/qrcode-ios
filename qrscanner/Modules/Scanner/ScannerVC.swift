//
//  ScannerVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class ScannerVC: UIViewController {
    var bgView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var iconView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var scanView : ViewRectangleArea! = {
        let view = ViewRectangleArea()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var lbScannerRectangle: UILabel = {
        let lbScannerRectangle = UILabel()
        lbScannerRectangle.translatesAutoresizingMaskIntoConstraints = false
        return lbScannerRectangle
    }()
   
    var imgScanView : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgHelpView : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgFlashView : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgCameraView : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgScan : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ic_image")
        view.tintColor = AppColors.WHITE_COLOR
        return view
    }()
    var frontCamera : UIImageView = {
          let view = UIImageView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.image = UIImage(named: "ic_flip_camera")
        view.tintColor = AppColors.WHITE_COLOR

          return view
      }()
    var imgHelp : UIImageView = {
             let view = UIImageView()
             view.translatesAutoresizingMaskIntoConstraints = false
             view.image = UIImage(named: "ic_help")
        view.tintColor = AppColors.WHITE_COLOR

             return view
         }()
    var flash : UIImageView = {
               let view = UIImageView()
               view.translatesAutoresizingMaskIntoConstraints = false
               view.image = UIImage(named: "ic_flash_off")
        view.tintColor = AppColors.WHITE_COLOR
               return view
           }()
    var video = AVCaptureVideoPreviewLayer()
    var capture: ZXCapture?
    private let regionCornerRadius = CGFloat(10.0)
    var isScanning: Bool?
    var isFirstApplyOrientation: Bool?
    var captureSizeTransform: CGAffineTransform?
    let viewModel =  ScannerViewModel()
    var flagDirectionCamera = false
    var isFront : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        iniUI()
       setup(isFront: false)
         bindViewModel()
       // setupNavItems()
        // view.backgroundColor = .red
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isFirstApplyOrientation == true { return }
        isFirstApplyOrientation = true
        applyOrientation()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition")
        coordinator.animate(alongsideTransition: { (context) in
        }) { [weak self] (context) in
            guard let weakSelf = self else { return }
            weakSelf.applyOrientation()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
      //  log(message: "viewDidAppear")
        self.viewModel.defaultValue()
      //  registerEventBus()
         self.viewModel.askCameraPermission()
      //  iniUI()
       // setup()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        GalleryHelper.flashlight(isOff: true)
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.bgView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        //setup()
    }
//    override func actionAlertYes() {
//        viewModel.openAppSetting()
//    }
    func setup(isFront : Bool)
    {
        isScanning = false
        isFirstApplyOrientation = false
        capture = ZXCapture()
        guard let _capture = capture else { return }
       
            _capture.camera = _capture.back()
       
        _capture.focusMode =  .continuousAutoFocus
        _capture.delegate = self
        self.bgView.layer.addSublayer(_capture.layer)
        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = 2.0
//        bgView.layer.masksToBounds = true
//        bgView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        scanView.setFrameSize(roi: lbScannerRectangle)
        scanView.drawCorners()
       // self.scanView.isHidden = true
        self.bgView.bringSubviewToFront(imgCameraView)
        self.bgView.bringSubviewToFront(imgHelpView)
        self.bgView.bringSubviewToFront(imgFlashView)

        self.bgView.bringSubviewToFront(imgScanView)
        self.bgView.bringSubviewToFront(scanView)
        self.bgView.bringSubviewToFront(lbScannerRectangle)

        //  self.view.bringSubviewToFront(_resultLabel)
    }
    @objc func actionFlash(sender : UITapGestureRecognizer){
        print("actionFlash")
        GalleryHelper.flashlight()
    }
    @objc func actionFrontCamera(sender : UITapGestureRecognizer){
//        if isFront {
//            capture = ZXCapture()
//                        guard let _capture = capture else { return }
//                        _capture.camera = _capture.back()
//                       _capture.focusMode =  .continuousAutoFocus
//            isFront = false
//        }
//        else{
//            capture = ZXCapture()
//             guard let _capture = capture else { return }
//             _capture.camera = _capture.front()
//            _capture.focusMode =  .continuousAutoFocus
//            _capture.delegate = self
//            self.bgView.layer.addSublayer(_capture.layer)
//            isFront = true
//
//        }
//
//
    }
    @objc func actionGallery(sender : UITapGestureRecognizer){
        print("actionGallery")
        self.bgView.bringSubviewToFront(iconView)
        viewModel.defaultValue()
       onTakeGallery()  
    }
    
    @objc func actionScanQR(sender : UITapGestureRecognizer){
         print("actionScanQR")
    }
  
}


