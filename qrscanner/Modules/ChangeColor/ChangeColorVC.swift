//
//  ChangeColorVC.swift
//  qrscanner
//
//  Created by Mac10 on 4/1/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ChangeColorVC: UIViewController {
    lazy var imgQRCode : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_QRCODE)
        return view
    }()
    lazy var wrapperView: UIView = {
              let parentView = UIView()
              parentView.translatesAutoresizingMaskIntoConstraints = false
              return parentView
          }()
    lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = AppConstants.SPACING
        layout.scrollDirection = .vertical
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return vc
    }()
    var collectionViewDataSource :CollectionViewDataSource<CollectionViewCell,ChangeColorViewModel>!
     let viewModel = ChangeColorViewModelList()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindViewModel()
    }
    
    @objc func doBack() {
           navigationController?.popViewController(animated: true)
           dismiss(animated: true, completion: nil)
           }
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        CollectionViewCell.identifier = EnumIdentifier.ChangeColor
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           self.navigationController?.isNavigationBarHidden = true
           navigationController?.interactivePopGestureRecognizer?.isEnabled = true
       }
  override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
}
