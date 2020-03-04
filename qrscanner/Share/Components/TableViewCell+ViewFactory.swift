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
        self.setupBackgroud()
        switch identifier {
        case .TransfereCashToeCash:
            setupSubView()
            break
       
        default :
            break
        }
    }
    
    func setupBackgroud(){
        self.addSubview(self.backGroundView)
        NSLayoutConstraint.activate([
            self.backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:10),
            self.backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
        //add gesture to leftView
   //     let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap))
    //    self.backGroundView.addGestureRecognizer(tapGesture)
    }
    
    func setupSubView(){
        self.backGroundView.addSubview(self.control)
        NSLayoutConstraint.activate([
            self.control.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor, constant:-10),
            self.control.widthAnchor.constraint(equalToConstant: 100),
            self.control.heightAnchor.constraint(equalToConstant: 40),
            self.centerYAnchor.constraint(equalTo: self.backGroundView.centerYAnchor)
            ])
        
        self.backGroundView.addSubview(self.lbTypeCode)
        NSLayoutConstraint.activate([
            self.lbTypeCode.trailingAnchor.constraint(equalTo: self.control.leadingAnchor, constant:-50),
            self.lbTypeCode.centerYAnchor.constraint(equalTo: self.control.centerYAnchor),
            self.lbTypeCode.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        self.backGroundView.addSubview(self.lbContent)
        NSLayoutConstraint.activate([
            self.lbContent.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor, constant: 0),
            self.lbContent.trailingAnchor.constraint(equalTo: self.lbTypeCode.leadingAnchor, constant:10),
            self.lbContent.centerYAnchor.constraint(equalTo: self.lbTypeCode.centerYAnchor)
            ])
    }
}
