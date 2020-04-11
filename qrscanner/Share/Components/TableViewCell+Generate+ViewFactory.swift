//
//  TableViewCell+Generate+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension TableViewCell {
    func setupGenerateSubView(){
        self.viewBackground.addSubview(self.viewRoot)
        NSLayoutConstraint.activate([
            self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor),
            self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor),
            self.viewRoot.topAnchor.constraint(equalTo: self.viewBackground.safeAreaLayoutGuide.topAnchor),
            self.viewRoot.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor)
        ])
        
        //               self.viewRoot.backgroundColor = AppColors.GRAY_LIGHT
        
        self.viewRoot.addSubview(imgIcon)
        NSLayoutConstraint.activate([
            self.imgIcon.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.imgIcon.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
            self.imgIcon.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
            self.imgIcon.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgIcon.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgIcon.centerYAnchor.constraint(equalTo: self.viewRoot.centerYAnchor)
        ])
        
        

        self.viewRoot.addSubview(self.lbTitle)
        NSLayoutConstraint.activate([
            self.lbTitle.leadingAnchor.constraint(equalTo: self.imgIcon.trailingAnchor,constant: AppConstants.MARGIN_LEFT),
//            self.lbTitle.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor,constant: AppConstants.MARGIN_RIGHT),
            self.lbTitle.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.lbTitle.centerYAnchor.constraint(equalTo: self.viewRoot.centerYAnchor),
             self.lbTitle.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM),
        ])
        self.viewRoot.addSubview(self.viewSub)
        NSLayoutConstraint.activate([
            self.viewSub.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor, constant: AppConstants.MARGIN_RIGHT),
            self.viewSub.topAnchor.constraint(equalTo: self.viewRoot.topAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
            self.viewSub.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_ITEM)
        ])
        self.viewSub.addSubview(self.imgPlusIcon)
        NSLayoutConstraint.activate([
            self.imgPlusIcon.topAnchor.constraint(equalTo: self.viewSub.topAnchor),
            self.imgPlusIcon.bottomAnchor.constraint(equalTo: self.viewSub.bottomAnchor),
            self.imgPlusIcon.leadingAnchor.constraint(equalTo: self.viewSub.leadingAnchor),
            self.imgPlusIcon.trailingAnchor.constraint(equalTo: self.viewSub.trailingAnchor),
            self.imgPlusIcon.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgPlusIcon.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT),
            self.imgPlusIcon.centerYAnchor.constraint(equalTo: self.viewRoot.centerYAnchor)
        ])

        self.viewRoot.addSubview(self.viewUnderLine)
        NSLayoutConstraint.activate([
            self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor),
            self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
            self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor),
            self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        self.viewUnderLine.backgroundColor = AppColors.GRAY_LIGHT
         self.lbTitle.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)

    }
   
}

