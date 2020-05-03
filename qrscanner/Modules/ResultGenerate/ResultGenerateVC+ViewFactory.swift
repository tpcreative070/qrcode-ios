//
//  ResultGenerateVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ResultGenerateVC {
    func initUI(){
        view.addSubview(imgQrcode)
        NSLayoutConstraint.activate([
            imgQrcode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant : AppConstants.MARGIN_TOP),
            imgQrcode.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT),
            imgQrcode.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_QR_WIDTH_HEIGHT),
            imgQrcode.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        self.view.addSubview(viewShare)
        NSLayoutConstraint.activate([
            self.viewShare.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewShare.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.viewShare.topAnchor.constraint(equalTo: self.imgQrcode.bottomAnchor,constant:  AppConstants.MARGIN_TOP),
            
        ])
        
        
        viewShare.addSubview(imgShare)
        NSLayoutConstraint.activate([
            imgShare.topAnchor.constraint(equalTo: viewShare.topAnchor, constant:  AppConstants.MARGIN_TOP),
            imgShare.leadingAnchor.constraint(equalTo: viewShare.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgShare.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgShare.heightAnchor.constraint(equalToConstant:DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgShare.centerYAnchor.constraint(equalTo: self.viewShare.centerYAnchor)
            
        ])
        viewShare.addSubview(lbShare)
        NSLayoutConstraint.activate([
            lbShare.topAnchor.constraint(equalTo: viewShare.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbShare.leadingAnchor.constraint(equalTo: imgShare.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbShare.trailingAnchor.constraint(equalTo: viewShare.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbShare.centerYAnchor.constraint(equalTo: self.viewShare.centerYAnchor)
            
        ])
        
        self.view.addSubview(viewSave)
        NSLayoutConstraint.activate([
            self.viewSave.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewSave.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.viewSave.topAnchor.constraint(equalTo: self.viewShare.bottomAnchor,constant:  AppConstants.MARGIN_TOP),
            
        ])
        
        
        viewSave.addSubview(imgSave)
        NSLayoutConstraint.activate([
            imgSave.topAnchor.constraint(equalTo: viewSave.topAnchor, constant:  AppConstants.MARGIN_TOP),
            imgSave.leadingAnchor.constraint(equalTo: viewSave.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.imgSave.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgSave.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_WIDTH_HEIGHT),
            self.imgSave.centerYAnchor.constraint(equalTo: self.viewSave.centerYAnchor)
            
        ])
        viewSave.addSubview(lbSave)
        NSLayoutConstraint.activate([
            lbSave.topAnchor.constraint(equalTo: viewSave.topAnchor, constant: AppConstants.MARGIN_TOP),
            lbSave.leadingAnchor.constraint(equalTo: imgSave.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            lbSave.trailingAnchor.constraint(equalTo: viewSave.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            self.lbSave.centerYAnchor.constraint(equalTo: self.viewSave.centerYAnchor)
            
        ])
        
       setupNavItems()
        viewShare.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(shareView(sender:))))
        viewSave.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(saveView(sender:))))
    }
    func setupNavItems() {
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
      
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
       self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
             let menuButtonRight = UIButton(frame: CGRect(x: 0, y: 0, width: DeviceHelper.Shared.ICON_WIDTH_HEIGHT, height: DeviceHelper.Shared.ICON_WIDTH_HEIGHT))
        menuButtonRight.setBackgroundImage(UIImage(named: AppImages.IC_PRINT), for: .normal)
             menuButtonRight.addTarget(self, action: #selector(printAction), for: .touchUpInside)
            navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
        
        
  
    }
    func printImage(){
        let borderWidth: CGFloat = 100.0
        let internalPrintView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgCode.size.width, height: imgCode.size.height))
        let printView = UIView(frame: CGRect(x: 0, y: 0, width: imgCode.size.width + borderWidth*2, height: imgCode.size.height + borderWidth*2))
        internalPrintView.image = imgCode
        internalPrintView.center = CGPoint(x: printView.frame.size.width/2, y: printView.frame.size.height/2)
        printView.addSubview(internalPrintView)
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.jobName = "printing an image"
        printInfo.outputType = .photo
        printController.printInfo = printInfo
        printController.printingItem = printView.toImage()
        printController.present(animated: true) { (_, isPrinted, error) in
            if error == nil {
                if isPrinted{
                    print("image is printed")
                }
                else{
                    print("image is not print")
                }
            }
        }
    }
    func bindViewModel() {
           self.resultViewModel.showLoading.bind { visible in
               visible ? ProgressHUD.show(): ProgressHUD.dismiss()
           }
           self.resultViewModel.onShowError = { [weak self] alert in
               self?.presentSingleButtonDialog(alert: alert)
           }
           
//           self.resultViewModel.responseToView = {[weak self] value in
//               if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
//                   
//               }
//           }
       }
}
extension ResultGenerateVC: SingleButtonDialogPresenter { }
