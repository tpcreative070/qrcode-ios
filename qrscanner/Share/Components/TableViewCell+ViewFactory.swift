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
        case .History:
            setupHistorySubView()
            break
            case .HistoryChoose:
                      setupChooseHistorySubView()
                      break
            case .SaveChoose:
            setupChooseHistorySubView()
            break
        case .Generate:
            setupGenerateSubView()
            case .Save:
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
            case .Content:
            setupContentView()
        default :
            break
        }
    }
    
 func setupBackgroud(){
    backgroundView?.backgroundColor = .red
        self.addSubview(self.viewBackground)
        NSLayoutConstraint.activate([
            self.viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:10),
            self.viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
        //add gesture to leftView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap))
        self.viewBackground.addGestureRecognizer(tapGesture)
    
    }
    
   
}
