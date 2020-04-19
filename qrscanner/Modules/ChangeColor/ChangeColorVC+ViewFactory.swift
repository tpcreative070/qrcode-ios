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
        collectionView.setAnchor(top: imgQRCode.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: AppConstants.MARGIN_TOP, paddingLeft: AppConstants.DEFAULT_CONSTRAINT, paddingBottom: AppConstants.DEFAULT_CONSTRAINT, paddingRight: AppConstants.DEFAULT_CONSTRAINT)
        changeColorQRCode(imgQRCode: imgQRCode)
        setupCollectionView()
        bindCollectionView()
        
    }
    func updateCollectionViewDataSource() {
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
        self.navigationController?.navigationBar.backItem?.title = LanguageHelper.getTranslationByKey(LanguageKey.Back)
       
//
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: " Quay lai", style: .plain, target: nil, action: nil)
//
//         navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: DeviceHelper.isIpad() ? AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE) : AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE), NSAttributedString.Key.foregroundColor:UIColor.white]
//        let title = UIButton()
//        title.titleLabel?.text = LanguageHelper.getTranslationByKey(LanguageKey.Back)
//        title.titleLabel?.textColor = AppColors.WHITE_COLOR
//        title.titleLabel?.font = DeviceHelper.isIpad() ? AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE) : AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)
//        title.addTarget(self, action: #selector(doBack), for: .touchUpInside)
//        let menuButtonBack = UIButton(frame: DeviceHelper.isIpad() ? CGRect(x: 0, y: 0, width: AppConstants.ICON_WIDTH_HEIGHT_IPAD, height: AppConstants.ICON_WIDTH_HEIGHT_IPAD) : CGRect(x: 0, y: 0, width: AppConstants.ICON_WIDTH_HEIGHT, height: AppConstants.ICON_WIDTH_HEIGHT))
//        menuButtonBack.setBackgroundImage(UIImage(named: AppImages.IC_BACK), for: .normal)
//        menuButtonBack.addTarget(self, action: #selector(doBack), for: .touchDown)
//
//
//        let stackview = UIStackView.init(arrangedSubviews: [menuButtonBack, title])
//                 stackview.distribution = .equalSpacing
//                 stackview.axis = .horizontal
//            stackview.alignment = .center
//                 stackview.spacing = 0
       //       navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButtonBack)
        
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
        self.viewModel.doSelectItem(mindex: indexPath.row)
    }
}
