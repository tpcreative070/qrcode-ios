//
//  AlertVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/26/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class AlertVC: BaseViewController {
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var lbAleart : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Copy_item)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Content_copy)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let wrapperView: UIView = {
        let parentView = UIView()
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.backgroundColor = UIColor.white
        parentView.layer.cornerRadius = AppConstants.CORNER_RADIUS
        parentView.layer.masksToBounds = true
        return parentView
    }()
    let btnCancel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Cancel),for: .normal)
        btn.setTitleColor(AppColors.COLOR_ACCENT, for: .normal)
        return btn
    }()
    let btnOK: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Copy),for: .normal)
        btn.setTitleColor(AppColors.COLOR_ACCENT, for: .normal)
        return btn
    }()
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var tableView : UITableView!
    var lbTitle : ICLabel!
    var viewModel : AlertViewModelList = AlertViewModelList()
    var dataSource :TableViewDataSource<TableViewCell,AlertViewModel,HeaderView>!
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("view didload typecode")
        initUI()
        bindViewModel()
        print(viewModel.listItem)
        checkAutoCopy()
    }
    @objc func closeAlert(sender: UITapGestureRecognizer){
       
         self.navigationController?.popViewController(animated: false)
    }
   
    @objc func copyItem(sender: UITapGestureRecognizer){
        var stringValue = ""
        if viewModel.countItemSelected > 0{
        if viewModel.listItem.count > 0 {
            for item in viewModel.listItem {
                stringValue += "\(item.nameItemView)\n"
            }
            print(stringValue)
            let pasteboard = UIPasteboard.general
            pasteboard.string = stringValue
            showToast(message: LanguageHelper.getTranslationByKey(LanguageKey.Copy_Item_Success)!)
        }
      
        }
    }
}
