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
        
        view.addSubview(qrcodeImage)
        NSLayoutConstraint.activate([
            qrcodeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant : 20),
            qrcodeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            qrcodeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            qrcodeImage.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            qrcodeImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2)
            
        ])
        self.view.addSubview(shareView)
        NSLayoutConstraint.activate([
            self.shareView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            shareView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            shareView.heightAnchor.constraint(equalToConstant: 50),
            self.shareView.topAnchor.constraint(equalTo: self.qrcodeImage.bottomAnchor,constant: 20),
            
        ])
        
        shareView.addSubview(shareImg)
        NSLayoutConstraint.activate([
            shareImg.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            shareImg.widthAnchor.constraint(equalToConstant: 30),
            shareImg.heightAnchor.constraint(equalToConstant: 30),
            shareImg.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: AppConstants.MARGIN_LEFT)
            
        ])
        shareView.addSubview(shareLbl)
        NSLayoutConstraint.activate([
            shareLbl.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 10),
            shareLbl.leadingAnchor.constraint(equalTo: shareImg.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            shareLbl.trailingAnchor.constraint(equalTo: shareView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        self.view.addSubview(saveView)
        NSLayoutConstraint.activate([
            self.saveView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            saveView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT),
            saveView.heightAnchor.constraint(equalToConstant: 50),
            
            self.saveView.topAnchor.constraint(equalTo: self.shareView.bottomAnchor,constant: 20),
            
        ])
        
        saveView.addSubview(saveImg)
        NSLayoutConstraint.activate([
            saveImg.topAnchor.constraint(equalTo: saveView.topAnchor, constant: 10),
            saveImg.widthAnchor.constraint(equalToConstant: 30),
            saveImg.heightAnchor.constraint(equalToConstant: 30),
            saveImg.leadingAnchor.constraint(equalTo: saveView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            
        ])
        saveView.addSubview(saveLabel)
        NSLayoutConstraint.activate([
            saveLabel.topAnchor.constraint(equalTo: saveView.topAnchor, constant: 10),
            saveLabel.leadingAnchor.constraint(equalTo: saveImg.trailingAnchor, constant: AppConstants.MARGIN_LEFT),
            saveLabel.trailingAnchor.constraint(equalTo: saveView.trailingAnchor, constant:  AppConstants.MARGIN_RIGHT)
        ])
        
        setupNavItems()
        shareView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(shareView(sender:))))
        saveView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(saveView(sender:))))
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = typeCode
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
        //        let menuButtonLeft = UIButton(type: .system)
        //        menuButtonLeft.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        //        menuButtonLeft.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
        //        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: menuButtonLeft)]
        //     let menuButtonRight = UIButton(type: .system)
        //     menuButtonRight.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
        //     menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
        //    navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
    }
    
}
