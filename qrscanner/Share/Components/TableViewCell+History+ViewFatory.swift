//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension TableViewCell {
    func setupHistorySubView(){
        
        self.backGroundView.addSubview(self.viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor,constant: 0),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor,constant: -0),
            self.viewRoot.topAnchor.constraint(equalTo: self.backGroundView.topAnchor,constant: 0),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView.bottomAnchor,constant: -0)

        ])

//        self.viewRoot.backgroundColor = AppColors.BLUE_COLOR
        
//        self.viewRoot.addSubview(self.lbCreatedDate)
//        NSLayoutConstraint.activate([
//            self.lbCreatedDate.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: 20),
//            self.lbCreatedDate.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: -20),
//            self.lbCreatedDate.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: 0),
//             self.lbCreatedDate.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: 0),
//              self.lbCreatedDate.heightAnchor.constraint(equalToConstant: 50)
//        ])
////
//        self.viewRoot.addSubview(self.lbContent)
//        NSLayoutConstraint.activate([
//            self.lbContent.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: 20),
//            self.lbContent.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: -20),
//            self.lbContent.topAnchor.constraint(equalTo: self.lbCreatedDate.bottomAnchor,constant: 0),
//        ])
        
        self.viewRoot.addSubview(self.stackView)
               NSLayoutConstraint.activate([
                   self.stackView.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: 10),
                   self.stackView.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: 10),
                   self.stackView.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: 10),
                   self.stackView.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: -10)
                   ])
               self.stackView.axis = .vertical
               self.stackView.alignment = .fill
               self.stackView.distribution = UIStackView.Distribution.fillEqually
               self.stackView.spacing = 5
               self.stackView.addArrangedSubview(lbCreatedDate)
               self.stackView.addArrangedSubview(lbContent)
        
        self.viewRoot.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLine.backgroundColor = .gray
    }
}

