//
//  SaveVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class SaveVC : UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
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
    var tableView : UITableView!
   lazy var lbNoItem : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.NoItem)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var dataSource :TableViewDataSource<TableViewCell,SaveViewModel,HeaderView>!
    var sections = [TableSection<String, SaveViewModel>]()
    let viewModel = SaveViewModelList()
    var floaty = Floaty()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = TableSection.group(rowItems: self.viewModel.listSave, by: { (headline) in
            return headline.typeCode
        })
        self.sections.sort { (lhs, rhs) in lhs.rowItems[0].updatedDateTime > rhs.rowItems[0].updatedDateTime }
        initUI()
        setupFloatButton()
        bindViewModel()
       // RateView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)).showAlert()
       // RateView.instance.showAlert()
    }
    
    
    @objc func doShare(sender: UITapGestureRecognizer){
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.viewModel.doGetListSave()
        self.viewModel.isSelected.value = false
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
