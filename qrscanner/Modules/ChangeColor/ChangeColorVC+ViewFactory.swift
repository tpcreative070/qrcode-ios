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
        setupNavItems()
        self.view.addSubview(imgQRCode)
        NSLayoutConstraint.activate([
            imgQRCode.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.MARGIN_TOP),
            imgQRCode.widthAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND),
            imgQRCode.heightAnchor.constraint(equalToConstant: AppConstants.HEIGHT_BACKGROUND),
            imgQRCode.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        self.view.addSubview(collectionView)
        collectionView.setAnchor(top: imgQRCode.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: AppConstants.MARGIN_TOP, paddingLeft: AppConstants.MARGIN_LEFT_HELP, paddingBottom: AppConstants.DEFAULT_CONSTRAINT, paddingRight: AppConstants.MARGIN_RIGHT_HELP)
        changeColorQRCode(imgQRCode: imgQRCode)
        setupCollectionView()
        bindCollectionView()
        
    }
    func updateCollectionViewDataSource() {
        print(viewModel.listColor)
        self.collectionViewDataSource.items = self.viewModel.listColor
        self.collectionView.reloadData()
        changeColorQRCode(imgQRCode: imgQRCode)
    }
    
    func bindCollectionView(){
        self.collectionViewDataSource = CollectionViewDataSource(cellIdentifier: EnumIdentifier.ChangeColor.rawValue,size: Int(AppConstants.MARGIN_RIGHT_ITEM_HIS), items: self.viewModel.listColor){ cell , vm in
            cell.configView(view: vm)
            cell.delegate = self
        }
        self.collectionView.dataSource = self.collectionViewDataSource
        self.collectionView.delegate = self.collectionViewDataSource
    }
    
    func setupCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: EnumIdentifier.ChangeColor.rawValue)
    }
    func setupNavItems() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = AppColors.PRIMARY_COLOR
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func bindViewModel() {
        self.viewModel.showLoading.bind { visible in
            visible ? ProgressHUD.show(): ProgressHUD.dismiss()
        }
        self.viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        self.viewModel.responseToView = {[weak self] value in
            if value == EnumResponseToView.UPDATE_DATA_SOURCE_COLLECTION_VIEW.rawValue {
                self?.updateCollectionViewDataSource()
            }
            
        }
        
        self.viewModel.setListColor()
    }
}
extension ChangeColorVC: SingleButtonDialogPresenter { }

extension ChangeColorVC : CollectionViewCellDelegate{
    func cellCodable(codable: Codable) {
        
    }
    func cellViewSelected(cell: CollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        print(indexPath.row)
        self.viewModel.doSelectItem(mindex: indexPath.row)
    }
}
