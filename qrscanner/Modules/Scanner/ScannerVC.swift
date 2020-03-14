//
//  ScannerVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class ScannerVC: BaseViewController {
    var bgView : UIView = {
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
        setupNavItems()
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
        log(message: "viewDidAppear")
        //self.viewModel.defaultValue()
        registerEventBus()
         self.viewModel.askCameraPermission()
    }
    override func viewWillDisappear(_ animated: Bool) {
        GalleryHelper.flashlight(isOff: true)
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.bgView.layer.borderColor = AppColors.BLUE.cgColor
    }
    override func actionAlertYes() {
        viewModel.openAppSetting()
    }
    
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


