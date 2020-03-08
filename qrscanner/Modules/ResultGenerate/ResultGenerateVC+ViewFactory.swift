//
//  ResultGenerateVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ResultGenerateVC {
    func initUI(){
        view.backgroundColor = .white
        view.addSubview(qrcodeImage)
        NSLayoutConstraint.activate([
            qrcodeImage.topAnchor.constraint(equalTo: view.topAnchor, constant : 50),
            qrcodeImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            qrcodeImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            //    qrcodeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrcodeImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)

        ])
    }
}
