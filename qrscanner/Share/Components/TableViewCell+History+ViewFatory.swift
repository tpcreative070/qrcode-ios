//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension UIStackView {
    func addBackground(color: UIColor) {
        let bglayer = CAShapeLayer()
        self.layer.insertSublayer(bglayer, at: 0)
        bglayer.path = UIBezierPath(rect: self.bounds).cgPath
        bglayer.fillColor = color.cgColor
    }
}
extension TableViewCell {
    func setupHistorySubView(){
        
        self.backGroundView.addSubview(self.viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor,constant:  0),
            self.viewRoot.topAnchor.constraint(equalTo: self.backGroundView.safeAreaLayoutGuide.topAnchor,constant: 0),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.backGroundView.bottomAnchor,constant: -20)

        ])
//        viewRoot.backgroundColor = .yellow
        self.viewRoot.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackView.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:   (AppConstants.MARGIN_RIGHT)),
            self.stackView.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: 0),
            self.stackView.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: -0)

        ])
        self.stackView.axis = .horizontal
        self.stackView.spacing = 5
        
        self.stackView.addArrangedSubview(stackViewVertical)
        NSLayoutConstraint.activate([
                  self.stackViewVertical.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor,constant: 0),
                  self.stackViewVertical.widthAnchor.constraint(equalTo: self.stackView.widthAnchor,multiplier: 5/6),
                  
                  self.stackViewVertical.topAnchor.constraint(equalTo: self.stackView.topAnchor,constant: 0),

              ])
                        self.stackViewVertical.axis = .vertical
                          self.stackViewVertical.alignment = .fill
                          self.stackViewVertical.distribution = UIStackView.Distribution.fillEqually
                          self.stackViewVertical.spacing = 10
                          self.stackViewVertical.addArrangedSubview(lbCreatedDate)
                          self.stackViewVertical.addArrangedSubview(lbContent)
               
        self.stackView.addArrangedSubview(viewSub)
        viewSub.addSubview(imgIcon)
        self.imgIcon.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        self.imgIcon.image = UIImage(named: "ic_share")
     
        self.viewRoot.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
     //  self.viewUnderLine.backgroundColor = .gray
    }
}

