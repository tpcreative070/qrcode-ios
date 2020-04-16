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
    var viewFooter : UIView = {
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
    
    lazy var lbTotal : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Total)
        view.textColor = AppColors.WHITE_COLOR
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTotalResult : ICLabel = {
           let view = ICLabel()
           view.text = "0"
           view.translatesAutoresizingMaskIntoConstraints = false
        
           return view
       }()
    let btnOK: UIButton = {
           let btn = UIButton()
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Done),for: .normal)
        btn.setTitleColor(AppColors.WHITE_COLOR, for: .normal)
           return btn
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
    let regionCornerRadius = AppConstants.CORNER_RADIUS
    var isScanning: Bool?
    var isFirstApplyOrientation: Bool?
    var captureSizeTransform: CGAffineTransform?
    let viewModel =  ScannerViewModel()
    let qrViewModel =  QRCodeViewModel()
    let settingViewModel = SettingViewModel()
    var isFlash = false
    var isFront = false
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var session : AVCaptureSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniUI()
        if #available(iOS 10.2, *){
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do{
                guard let mCaptureDevice = captureDevice else {
                    return
                }
                let input = try AVCaptureDeviceInput(device: mCaptureDevice)
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
        self.viewBackground.bringSubviewToFront(viewIcon)
        viewModel.defaultValue()
       // ProgressHUD.showInView(view: self.view)
        onTakeGallery()
    }
    @objc func doneScanner(){
        self.viewModel.dateTime = (TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))
        viewModel.isScanner = true
        for item in viewModel.listScanner {
            self.viewModel.scannerResult(mValue: item.value!, mType: item.typeScan!)
        }
        viewModel.doGetListTransaction()
        lbTotalResult.text =  "\(viewModel.listScanner.count)"
       }
    @objc func actionHelp(sender : UITapGestureRecognizer){
        let vc = HelpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        session?.stopRunning()
        UserDefaults(suiteName: AppConstants.sharedIndentifier)!.removeObject(forKey: AppConstants.shareKey)
       }
    
  
    override func viewWillAppear(_ animated: Bool) {
        ProgressHUD.dismiss()
    }
    override func viewDidAppear(_ animated: Bool) {
        ProgressHUD.dismiss()
        session?.startRunning()
        fetchData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}

