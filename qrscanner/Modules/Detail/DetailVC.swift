//
//  DetailGenerate.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class DetailVC : BaseViewController{
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let viewWrapper: UIView = {
        let parentView = UIView()
        parentView.translatesAutoresizingMaskIntoConstraints = false
        return parentView
    }()
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var contentViewModel = ContentViewModelList()
    var dataSource :TableViewDataSourceContent<TableViewCell,ContentViewModel,HeaderView>!
    var listContentViewModel: [ContentViewModel] = [ContentViewModel]()
    var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        addLeftBackButton()
        bindViewModel()
        contentViewModel.listContent = listContentViewModel
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will appear")
        self.navigationController?.isNavigationBarHidden = true
        keyboardHelper?.deregisterKeyboardNotification()
    }
    override func actionLeft() {
        dismiss()
    }
    @objc func actionHelp(sender: UITapGestureRecognizer){
        let email = LanguageKey.Email_Help
        if let url = URL(string: "mailto:\(email)") {
           if #available(iOS 10.0, *) {
             UIApplication.shared.open(url)
           } else {
             UIApplication.shared.openURL(url)
           }
         }
     }
}
