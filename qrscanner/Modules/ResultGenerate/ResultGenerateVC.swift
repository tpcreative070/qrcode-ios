//
//  ResultGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ResultGenerateVC: BaseViewController {
    var shareView: UIView = {
           let view = UIView()
           view.backgroundColor = AppColors.GRAY_LIGHT_90
           view.layer.borderColor = UIColor.white.cgColor
           view.layer.borderWidth = 1
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       var saveView: UIView = {
           let view = UIView()
           view.backgroundColor = AppColors.GRAY_LIGHT_90
           view.layer.borderColor = UIColor.white.cgColor
           view.layer.borderWidth = 1
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
   
       lazy var shareImg : UIImageView = {
           let view = UIImageView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.tintColor = AppColors.COLOR_ACCENT
           view.image = UIImage(named: "ic_share")
           return view
       }()
       lazy var shareLbl : UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Share"
           return view
       }()
       lazy var saveImg : UIImageView = {
           let view = UIImageView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.tintColor = AppColors.COLOR_ACCENT
           view.image = UIImage(named: "ic_save")
           return view
       }()
       
       lazy var saveLabel : UILabel = {
           let view = UILabel()
           view.text = "Save"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    var imgCode : UIImage = UIImage()
    var typeCode = ""
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
        self.addLeftBackButton()
       qrcodeImage.image = imgCode
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           keyboardHelper?.registerKeyboardNotification()
           self.navigationController?.setNavigationBarHidden(false, animated: true)
           
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           keyboardHelper?.deregisterKeyboardNotification()
           self.navigationController?.isNavigationBarHidden = true
           
       }

   @objc func shareView(sender : UITapGestureRecognizer){
         let imageShare = [ imgCode ]
         let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
         activityViewController.popoverPresentationController?.sourceView = self.view
         self.present(activityViewController, animated: true, completion: nil)
     }
    @objc func saveView(sender : UITapGestureRecognizer){
            UIImageWriteToSavedPhotosAlbum(qrcodeImage.image!, nil, nil, nil)
        showToast(message: "Save success!")
        }
}
