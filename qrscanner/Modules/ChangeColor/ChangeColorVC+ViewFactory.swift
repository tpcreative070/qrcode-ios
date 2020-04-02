//
//  ChangeColorVC+ViewFactory.swift
//  qrscanner
//
//  Created by Mac10 on 4/1/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension ChangeColorVC{
    func initUI(){
        view.backgroundColor = .white
       // view.addSubview(imgQRCode)
        view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            imgQRCode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.MARGIN_TOP_ITEM),
//                        imgQRCode.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppConstants.MARGIN_LEFT_HELP),
//                        imgQRCode.widthAnchor.constraint(equalToConstant: 80),
//                        imgQRCode.heightAnchor.constraint(equalToConstant: 100)
//                    ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.MARGIN_TOP),
              collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                   ])
        setupCollectionView()
             bindCollectionView()
    }
    func updateCollectionViewDataSource() {
        print(viewModel.listColor)
             self.collectionViewDataSource.items = self.viewModel.listColor
             self.collectionView.reloadData()
             debugPrint("updateCollectionViewDataSource")
       }

       func bindCollectionView(){
           /*Setup collectionview*/
        viewModel.getListColor()
        print(viewModel.listColor)
        self.collectionViewDataSource = CollectionViewDataSource(cellIdentifier: EnumIdentifier.ChangeColor.rawValue,size: 70, items: self.viewModel.listColor){ cell , vm in
            cell.configView(view: vm)
                 cell.delegate = self
                 
           }
           self.collectionView.dataSource = self.collectionViewDataSource
           self.collectionView.delegate = self.collectionViewDataSource
       }
       
    func setupCollectionView(){
          collectionView.showsHorizontalScrollIndicator = false
          collectionView.isPagingEnabled = true
          collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: EnumIdentifier.ChangeColor.rawValue)
      }
    func setupNavItems() {
          
          self.view.backgroundColor = .white
          self.navigationController?.setNavigationBarHidden(false, animated: true)
         
      }
     
    func bindViewModel() {
        self.viewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE.rawValue {
                self?.updateCollectionViewDataSource()
            }
         
        }
      
        
        self.viewModel.getListColor()
    }
}
extension ChangeColorVC: SingleButtonDialogPresenter { }

extension ChangeColorVC : CollectionViewCellDelegate{
    func cellCodable(codable: Codable) {
        
    }
    
    func cellViewSelected(cell: CollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
      //  self.viewModel.doSelectItem(index: indexPath.row)
    }
}
