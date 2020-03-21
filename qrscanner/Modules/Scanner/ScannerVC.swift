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
    var resultLabel : UILabel? = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgView : UIView! = {
        let view = UIView()
        view.backgroundColor = .red
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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        iniUI()
        setup()
         
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
            // do nothing
        }) { [weak self] (context) in
            guard let weakSelf = self else { return }
            weakSelf.applyOrientation()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
      //  log(message: "viewDidAppear")
        //self.viewModel.defaultValue()
      //  registerEventBus()
         self.viewModel.askCameraPermission()
        iniUI()
        setup()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        GalleryHelper.flashlight(isOff: true)
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.bgView.layer.borderColor = AppColors.BLUE.cgColor
        setup()
    }
//    override func actionAlertYes() {
//        viewModel.openAppSetting()
//    }
    
    func setup()
    {
        isScanning = false
        isFirstApplyOrientation = false
        capture = ZXCapture()
        guard let _capture = capture else { return }
        _capture.camera = _capture.back()
        _capture.focusMode =  .continuousAutoFocus
        _capture.delegate = self
        self.bgView.layer.addSublayer(_capture.layer)
        self.bgView.bringSubviewToFront(imgView)

        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = 2.0
        scanView.setFrameSize(roi: lbScannerRectangle)
        scanView.drawCorners()
        self.scanView.isHidden = true
        
        self.bgView.bringSubviewToFront(scanView)
        self.bgView.bringSubviewToFront(lbScannerRectangle)

        //  self.view.bringSubviewToFront(_resultLabel)
    }
   
}


