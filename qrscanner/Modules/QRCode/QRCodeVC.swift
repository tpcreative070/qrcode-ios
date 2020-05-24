//
//  ListQRCodeVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/30/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC

class QRCodeVC: BaseViewController {
        lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        let wrapperView: UIView = {
            let parentView = UIView()
            parentView.translatesAutoresizingMaskIntoConstraints = false
            return parentView
        }()
        lazy var endedUpScrollViewContainerView : UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    lazy var lbTitle : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.ChooseQRCode)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
   let btnDone: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Done),for: .normal)
        btn.setTitleColor(AppColors.COLOR_ACCENT, for: .normal)
        return btn
    }()
        var tableView : UITableView!
        var viewModel = QRCodeViewModelList()
    
        var dataSource :TableViewDataSource<TableViewCell,QRCodeViewModel,HeaderView>!
        override func viewDidLoad() {
            super.viewDidLoad()
            initUI()
            bindViewModel()
        }
        override func actionLeft() {
            dismiss()
        }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           setupNavItems()

       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           self.navigationController?.isNavigationBarHidden = true
           navigationController?.interactivePopGestureRecognizer?.isEnabled = true

       }
    @objc func getListSelectedItem(sender: UITapGestureRecognizer){
        viewModel.listItemSelected.removeAll()
        viewModel.listTransaction.removeAll()
        self.viewModel.listContent.removeAll()
        for index in viewModel.listItem {
            //Utils.logMessage(object: viewModel.listItem)
            if index.check == true {
                guard let value = index.stringCode , let typeCode = index.typeCode else {
                    return
                }
                viewModel.scannerResult(mValue: value, mType: CommonService.barcodeFormatToString(format: ZXBarcodeFormat(rawValue: UInt32(Int(typeCode)))))
            }
        }
        viewModel.doGetListTransaction()
        
      }
      @objc func doSelectAll(_ sender: UIButton) {
          if !sender.isSelected {
              sender.isSelected = true
              viewModel.doSelectedAll(isValue: true)
          }
          else {
              sender.isSelected = false
              viewModel.doSelectedAll(isValue: false)
          }
     //   viewModel.doGetListTransaction()
      }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

}
