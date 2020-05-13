//
//  RateViewController.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Cosmos
import MessageUI

class RateVC: UIViewController, MFMailComposeViewControllerDelegate {
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
         
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    lazy var lbCancel : ICLabel = {
           let view = ICLabel()
           view.text = LanguageHelper.getTranslationByKey(LanguageKey.Cancel)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    lazy var lbSubmit : ICLabel = {
           let view = ICLabel()
           view.text = LanguageHelper.getTranslationByKey(LanguageKey.Submit)
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
    let viewFooter: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    let viewFooterCancel: UIView = {
             let view = UIView()
             view.translatesAutoresizingMaskIntoConstraints = false
             return view
         }()
    let viewFooterSubmit: UIView = {
             let view = UIView()
             view.translatesAutoresizingMaskIntoConstraints = false
             return view
         }()
   
    let viewLine: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.GRAY_LIGHT_90
            return view
        }()
    let btnCancel: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LanguageHelper.getTranslationByKey(LanguageKey.Cancel),for: .normal)
        btn.setTitleColor(AppColors.COLOR_ACCENT, for: .normal)
        return btn
    }()
   
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var flagNoThanks : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        cosmosView.settings.minTouchRating = 1
        cosmosView.settings.disablePanGestures = true
        // Do any additional setup after loading the view.
        let count = UserDefaults.standard.integer(forKey: .reviewWorthyActionCount)
        if count == 5 {
            flagNoThanks = true
            lbNotNow.text = LanguageHelper.getTranslationByKey(LanguageKey.NoThanks)
        }
        else{
            lbNotNow.text = LanguageHelper.getTranslationByKey(LanguageKey.NotNow)
        }
    }

    @objc func doCancel (sender : UITapGestureRecognizer){
        if flagNoThanks {
             UserDefaults.standard.set(true, forKey: .pressNoThanks)
        }
        else{
          UserDefaults.standard.set(true, forKey: .pressNotNow)
        }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: .pressNotNow)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch began")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //setupFooter()
        print("touch end")
    }
    @objc func doSubmit (sender : UITapGestureRecognizer){
        if Int(cosmosView.rating) < cosmosView.settings.totalStars {
            UserDefaults.standard.set(true, forKey: .pressSubmitLittleFiveStar)

//            let vc = FeedbackVC()
//      //   let navController = UINavigationController(rootViewController: vc)
//      //   self.present(navController, animated:true, completion: nil)
//            let navigationController : UINavigationController = UIApplication.shared.keyWindow!.rootViewController as! UINavigationController
//            navigationController.pushViewController(vc, animated: true)
//            self.dismiss(animated: false, completion: nil)
            let mailComposer = configureMailController()
            if MFMailComposeViewController.canSendMail(){
                self.present(mailComposer,animated: true, completion: nil)
            }
            else{
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
        else {

            CommonService.ratingApp()
            UserDefaults.standard.set(true, forKey: .pressSubmitFiveStar)
            self.dismiss(animated: false, completion: nil)
        }
//        navigationController?.popViewController(animated: true)
//              dismiss(animated: true, completion: nil)
    }
    @objc func doRating (sender : UITapGestureRecognizer){
          setupFooter()
      }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch move")
    }
    
}
