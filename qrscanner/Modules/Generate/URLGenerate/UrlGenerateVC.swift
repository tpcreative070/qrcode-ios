//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class UrlGenerateVC: BaseViewController {
   lazy var backgroundView: UIView = {
                    let view = UIView()
                 view.layer.borderColor = UIColor.lightGray.cgColor
                 view.layer.borderWidth = 1
                 view.layer.cornerRadius = 10
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
          lazy   var urlBg: UIView = {
               let view = UIView()
               view.backgroundColor = AppColors.GRAY_LIGHT_90
              view.layer.borderColor = UIColor.white.cgColor
                 view.layer.borderWidth = 1
                 view.layer.cornerRadius = 10
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
             }()
    lazy var urlLbl : UILabel = {
             let view = UILabel()
             view.text = "Url"
             view.translatesAutoresizingMaskIntoConstraints = false
             return view
         }()
    lazy var urlTxt: ICTextFieldNoneIcon = {
             let view = ICTextFieldNoneIcon()
             view.translatesAutoresizingMaskIntoConstraints = false
             view.alpha = AppConstants.ALPHA_DISBALE

             return view
         }()
    lazy var searchImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_search")
        return view
    }()
    lazy var searchLbl : UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = "Search"
          return view
      }()
    lazy var urlImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_languages")
        return view
    }()
    lazy var clipboardImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_copy")
        return view
    }()
    lazy var clipboardLbl : UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = "Clipboard"
          return view
      }()
    var typeCode : String = ""
    var urlSeen : String = ""
    var isSeen : Int = 0
          var viewModel : GenerateViewModel?
       override func viewDidLoad() {
           super.viewDidLoad()
           typeCode = typeCode.uppercased()
           viewModel = GenerateViewModel()
        //   self.setupDelegate()
         //  setupStatusBar()
           self.bindViewModel()
           self.addLeftBackButton()
        print("isSeen : \(isSeen)")
    checkIsSeenDetail()
           
       }
    func checkIsSeenDetail(){
        if isSeen == AppConstants.ISSEEN {
            urlTxt.text = urlSeen
            urlTxt.isUserInteractionEnabled = false
             self.view.backgroundColor = .white
                      self.navigationController?.setNavigationBarHidden(false, animated: true)
                      navigationItem.title = LanguageKey.Url
                      let urlAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
                      navigationController?.navigationBar.titleTextAttributes = urlAttributes
                      navigationController?.navigationBar.isTranslucent = true
              //        navigationController?.navigationBar.prefersLargeTitles = DeviceHelper.isIpad() ? false : true
              //        navigationItem.largeTitleDisplayMode = DeviceHelper.isIpad() ? .never : .automatic
                      
                      navigationController?.navigationBar.backgroundColor = AppColors.PRIMARY_COLOR
                      self.navigationController?.navigationBar.tintColor = .white
              
                      let menuButtonRight = UIButton(type: .system)
                      menuButtonRight.setImage(#imageLiteral(resourceName: "ic_help"), for: .normal)
                    //  menuButtonRight.addTarget(self, action: #selector(doGenerate), for: .touchUpInside)
                      navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButtonRight)]
            self.initUI()

        }
        else{
            setupNavItems()
            self.initUI()

        }
    }
       override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              keyboardHelper?.registerKeyboardNotification()
          }
          
          override func viewWillDisappear(_ animated: Bool) {
              super.viewWillDisappear(animated)
              keyboardHelper?.deregisterKeyboardNotification()
          }
     func defineValue(){
        self.viewModel?.typeCode = LanguageKey.Url
             self.viewModel?.url = urlTxt.text
            
         
         
     }
     override func dismissKeyboard() {
         doDismiss()
     }
     override func closeButtonPress() {
         dismiss()
     }
     @objc func doGenerate() {
         print("done")
         self.defineValue()
         viewModel?.doGenerateValue();
     }
     @objc func inputFieldEditingDidEnd(textField: UITextField){
         self.viewModel?.focusTextField = textField
         
             if textField == urlTxt {
                 viewModel?.url = textField.text ?? ""
                 viewModel?.validateUrl()
             }
             
       }
         
     }


