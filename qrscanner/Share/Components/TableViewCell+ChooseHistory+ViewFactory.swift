//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension TableViewCell {
    func setupChooseHistorySubView(){
        
        self.viewBackground.addSubview(self.viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: AppConstants.MARGIN_TOP),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM)
            
        ])
        //        viewRoot.backgroundColor = .yellow
        self.viewRoot.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.stackView.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant:   (AppConstants.MARGIN_RIGHT)),
            self.stackView.topAnchor.constraint(equalTo: self.viewRoot.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor)
            
        ])
        self.stackView.axis = .horizontal
        self.stackView.spacing = 5
        
        self.stackView.addArrangedSubview(stackViewVertical)
        NSLayoutConstraint.activate([
            self.stackViewVertical.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.stackViewVertical.widthAnchor.constraint(equalTo: self.stackView.widthAnchor,multiplier: 5/6),
            
            self.stackViewVertical.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            
        ])
        self.stackViewVertical.axis = .vertical
        self.stackViewVertical.alignment = .fill
        self.stackViewVertical.distribution = UIStackView.Distribution.fillEqually
        self.stackViewVertical.spacing = 10
        self.stackViewVertical.addArrangedSubview(lbCreatedDate)
        self.stackViewVertical.addArrangedSubview(lbContent)
        
        self.stackView.addArrangedSubview(viewSub)
        NSLayoutConstraint.activate([
            self.viewSub.leadingAnchor.constraint(equalTo: self.stackViewVertical.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.viewSub.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor,constant:   (AppConstants.MARGIN_RIGHT)),
            self.viewSub.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.viewSub.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor)
            
        ])
        
      
            self.viewSub.addSubview(checkBox)
            NSLayoutConstraint.activate([
                self.checkBox.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                self.checkBox.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
                self.checkBox.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
                self.checkBox.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT)
            ])
      
        self.viewRoot.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
     
    }
}

