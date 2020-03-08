//
//  ResultGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ResultGenerateVC: BaseViewController {
    var imgCode : UIImage = UIImage()
     lazy var qrcodeImage: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       // print("\(imgCode)")
        initUI()
       qrcodeImage.image = imgCode
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
