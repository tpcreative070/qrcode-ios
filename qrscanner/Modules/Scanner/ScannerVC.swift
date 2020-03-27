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
    var viewBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    var wrapperFirstView : UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
         return view
     }()
    var wrapperSecondView : UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
           return view
       }()
    var wrapperThirdView : UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
           return view
       }()
    var wrapperFourView : UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
           return view
       }()
    var viewIcon : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewScan : ViewRectangleArea! = {
        let view = ViewRectangleArea()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var lbScannerRectangle: UILabel = {
        let lbScannerRectangle = UILabel()
        lbScannerRectangle.translatesAutoresizingMaskIntoConstraints = false
        return lbScannerRectangle
    }()
    
    var viewScanBg : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewHelpBg : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewFlashBg : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var viewFlipCamera : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imgScan : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_IMAGE)
        view.tintColor = AppColors.WHITE_COLOR
        return view
    }()
    var imgFlipCamera : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_FLIP_CAMERA)
        view.tintColor = AppColors.WHITE_COLOR
        return view
    }()
   
    var imgHelp : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_HELP)
        view.tintColor = AppColors.WHITE_COLOR
        
        return view
    }()
    var imgFlashOff : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_FLASH_OFF)
        view.tintColor = AppColors.WHITE_COLOR
        return view
    }()
    var imgFlashOn : UIImageView = {
              let view = UIImageView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.image = UIImage(named: AppImages.IC_FLASH_ON)
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
    var isFlash : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        iniUI()
        bindViewModel()
        isScanning = false
        isFirstApplyOrientation = false
        capture = ZXCapture()
        guard let _capture = capture else { return }
        _capture.focusMode =  .continuousAutoFocus
        _capture.delegate = self
        setupBack()
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
        self.viewBackground.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        //setup()
    }
    //    override func actionAlertYes() {
    //        viewModel.openAppSetting()
    //    }
    func setupBack()
    {
        guard let _capture = capture else { return }
        _capture.camera = _capture.back()
        self.viewBackground.layer.addSublayer(_capture.layer)
        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = 2.0
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
    }
    func setupFront()
    {
        guard let _capture = capture else { return }
        _capture.camera = _capture.front()
        self.viewBackground.layer.addSublayer(_capture.layer)
        lbScannerRectangle.layer.masksToBounds = true
        lbScannerRectangle.layer.cornerRadius = self.regionCornerRadius
        lbScannerRectangle.layer.borderColor = UIColor.white.cgColor
        lbScannerRectangle.layer.borderWidth = 2.0
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
    }
    @objc func actionFlash(sender : UITapGestureRecognizer){
        print("actionFlash")
        GalleryHelper.flashlight()
        isFlash = !isFlash
        if isFlash{
            imgFlashOff.image = UIImage(named: AppImages.IC_FLASH_ON)
        }
        else{
            imgFlashOff.image = UIImage(named: AppImages.IC_FLASH_OFF)
        }
    }
    @objc func actionFrontCamera(sender : UITapGestureRecognizer){
        isFront = !isFront
        if isFront{
            setupFront()
        }
        else{
            setupBack()
        }
    }
    @objc func actionGallery(sender : UITapGestureRecognizer){
        print("actionGallery")
        self.viewBackground.bringSubviewToFront(viewIcon)
        viewModel.defaultValue()
        onTakeGallery()
    }
    
    @objc func actionHelp(sender : UITapGestureRecognizer){
        print("actionScanQR")
        let vc = HelpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


