//
//  TableViewCell+History+ViewFatory.swift
//  qrscanner
//
//  Created by Mac10 on 3/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension TableViewCell {
    func setupSaveSubView(){
      self.addSubview(self.viewBackgroundSecond)
                NSLayoutConstraint.activate([
                 self.viewBackgroundSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                 self.viewBackgroundSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                 self.viewBackgroundSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.MARGIN_TOP),
                 self.viewBackgroundSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: AppConstants.MARGIN_BOTTOM)
                    ])
         
         self.viewBackgroundSecond.addSubview(viewRoot)
         NSLayoutConstraint.activate([
             self.viewRoot.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
             self.viewRoot.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor,constant: AppConstants.MARGIN_LEFT_ITEM_HIS),
             self.viewRoot.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor),
             self.viewRoot.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor)
             
         ])
         self.viewRoot.addSubview(lbCreatedDate)
         NSLayoutConstraint.activate([
             self.lbCreatedDate.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
             self.lbCreatedDate.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
             self.lbCreatedDate.topAnchor.constraint(equalTo: self.viewRoot.topAnchor),
             
         ])
         self.viewRoot.addSubview(lbContent)
                NSLayoutConstraint.activate([
                    self.lbContent.leadingAnchor.constraint(equalTo: self.viewRoot.leadingAnchor,constant: AppConstants.MARGIN_LEFT),
                    self.lbContent.trailingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
                    self.lbContent.topAnchor.constraint(equalTo: self.lbCreatedDate.bottomAnchor,constant: AppConstants.MARGIN_TOP_ITEM),
                    self.lbContent.bottomAnchor.constraint(equalTo: self.viewRoot.bottomAnchor)
                    
                ])
         self.viewBackgroundSecond.addSubview(viewSub)
                NSLayoutConstraint.activate([
                    self.viewSub.leadingAnchor.constraint(equalTo: self.viewRoot.trailingAnchor),
                    self.viewSub.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor),
                    self.viewSub.topAnchor.constraint(equalTo: self.viewBackgroundSecond.topAnchor),
                    self.viewSub.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor)
                    
                ])
       
         self.viewSub.addSubview(imgIcon)
             self.imgIcon.centerYAnchor.constraint(equalTo: viewSub.centerYAnchor).isActive = true
         self.imgIcon.leadingAnchor.constraint(equalTo: viewRoot.trailingAnchor, constant: AppConstants.MARGIN_LEFT).isActive = true
         self.imgIcon.widthAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT).isActive = true
         self.imgIcon.heightAnchor.constraint(equalToConstant: AppConstants.ICON_WIDTH_HEIGHT).isActive = true
         self.imgIcon.image = UIImage(named: AppImages.IC_CREATE)
         
         self.viewBackgroundSecond.addSubview(self.viewUnderLine)
         NSLayoutConstraint.activate([
             self.viewUnderLine.leadingAnchor.constraint(equalTo: self.viewBackgroundSecond.leadingAnchor),
             self.viewUnderLine.trailingAnchor.constraint(equalTo: self.viewBackgroundSecond.trailingAnchor),
             self.viewUnderLine.bottomAnchor.constraint(equalTo: self.viewBackgroundSecond.bottomAnchor),
             self.viewUnderLine.heightAnchor.constraint(equalToConstant: 1)
         ])
         //  self.viewUnderLine.backgroundColor = .gray
          self.lbCreatedDate.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE)
          self.lbContent.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionImgCreateViewTap(sender:)))
       imgIcon.addGestureRecognizer(tapGesture)
       imgIcon.isUserInteractionEnabled  = true
       let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap(sender:)))
            viewRoot.addGestureRecognizer(tapGestureView)
            viewRoot.isUserInteractionEnabled  = true
    let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(actionCellViewLongPress))
       self.viewRoot.addGestureRecognizer(longPressRecognizer)
    }
}

