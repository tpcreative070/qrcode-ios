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
        case .Generate:
            setupGenerateSubView()
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionCellViewTap))
        self.backGroundView.addGestureRecognizer(tapGesture)
    }
    
   
}
