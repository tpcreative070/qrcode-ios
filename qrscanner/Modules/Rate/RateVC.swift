//
//  RateViewController.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Cosmos
class RateVC: UIViewController {
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgApp: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Content_copy)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbNotNow : ICLabel = {
         let view = ICLabel()
         view.text = LanguageHelper.getTranslationByKey(LanguageKey.Content_copy)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    lazy var viewUnderLine1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewUnderLine2 : UIView = {
           let view = UIView()
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
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initUI()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }

}
