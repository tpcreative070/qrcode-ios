//
//  HeaderView+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension HeaderView{
    func setupView(){
        self.setupBackgroud()
        switch identifier {
        case .History:
            self.setupSubView()
            break
        case .Save:
            self.setupQrcodeHistorySubView()
            break
        case .HistoryChoose:
            self.setupSubView()
            break
        case .SaveChoose:
            self.setupSubView()
            break
        case .Transactions:
            self.setupSubView()
            break
            
        case .QRCodeHistory:
            self.setupQrcodeHistorySubView()
            break
        default:
            break
        }
    }
    
    fileprivate func setupBackgroud(){
        self.addSubview(self.backGroundView)
        NSLayoutConstraint.activate([
            self.backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0)
        ])
    }
    
    fileprivate func setupSubView(){
        self.backGroundView.addSubview(self.lbGroupName)
        NSLayoutConstraint.activate([
            self.lbGroupName.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.lbGroupName.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            self.lbGroupName.topAnchor.constraint(equalTo: self.backGroundView.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.lbGroupName.bottomAnchor.constraint(equalTo: self.backGroundView.bottomAnchor)
        ])
        
    }
    
    fileprivate func setupQrcodeHistorySubView(){
        self.backGroundView.addSubview(self.lbGroupName)
        NSLayoutConstraint.activate([
            self.lbGroupName.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor, constant: AppConstants.MARGIN_LEFT),
            self.lbGroupName.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            self.lbGroupName.topAnchor.constraint(equalTo: self.backGroundView.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.lbGroupName.bottomAnchor.constraint(equalTo: self.backGroundView.bottomAnchor)
        ])
    }
}
