//
//  ScannerVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class ScannerVC: UIViewController , AVCaptureMetadataOutputObjectsDelegate{
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
    let regionCornerRadius = CGFloat(10.0)
    var isScanning: Bool?
    var isFirstApplyOrientation: Bool?
    var captureSizeTransform: CGAffineTransform?
    let viewModel =  ScannerViewModel()
    var isFlash = false
    var isFront = false
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var session : AVCaptureSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        iniUI()
        
        if #available(iOS 10.2, *){
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do{
                
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                session = AVCaptureSession()
                session?.addInput(input)
                setuplayoutCamera()
                
            }
            catch {
                print("error")
            }
        }
        
        bindViewModel()
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
        if isFront {
            setupCameraFront()
        }
        else{
            setupCameraBack()
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
    override func viewDidDisappear(_ animated: Bool) {
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear11")
        session?.startRunning()
    }
    
   
    
}


