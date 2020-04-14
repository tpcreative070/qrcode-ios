//
//  TableViewCell+ViewFactory.swift
//  vietlifetravel
//
//  Created by Mac10 on 7/3/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import UIKit
extension TableViewCell {
    func setupView(){
        switch identifier {
        case .History:
            self.setupBackgroud()
            setupHistorySubView()
            break
        case .HistoryChoose:
            self.setupBackgroud()
            setupChooseHistorySubView()
            break
        case .SaveChoose:
            self.setupBackgroud()
            setupChooseHistorySubView()
            break
        case .Generate:
            self.setupBackgroud()
            setupGenerateSubView()
        case .Save:
            self.setupBackgroud()
            setupSaveSubView()
        case .Url:
            setupUrlView()
        case .Text:
            setupTextView()
        case .Telephone:
            setupPhoneView()
        case .Email:
            setupEmailView()
        case .Wifi:
            setupWifiView()
        case .Contact:
            setupContactView()
        case .Location:
            setupLocationView()
        case .Message:
            setupMessageView()
        case .Event:
            setupEventView()
        case .Barcode:
            setupBarcodeView()
        case .EAN_8:
            setupBarcodeView()
        case .EAN_13:
            setupBarcodeView()
        case .Alert:
            self.setupBackgroud()
            setupAlertSubView()
        case .QRCodeList:
            self.setupBackgroud()
            setupQRCodeSubView()
        default :
            break
        }
    }
    
    func setupBackgroud(){
        backgroundView?.backgroundColor = .red
        self.addSubview(self.viewBackground)
        NSLayoutConstraint.activate([
            self.viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        //add gesture to leftView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap))
        self.viewBackground.addGestureRecognizer(tapGesture)
        
    }
    
    
}
