//
//  ResultGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ResultGenerateVC: BaseViewController {
    var viewShare: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewSave: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imgShare : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_SHARE)
        return view
    }()
    lazy var lbShare : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Share)
        return view
    }()
    lazy var imgSave : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_SAVE)
        return view
    }()
    
    lazy var lbSave : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Save)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewModel : ResultViewModel = ResultViewModel()
    var imgCode : UIImage = UIImage()
    var contentData : ContentViewModel?
    lazy var imgQrcode: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        self.addLeftBackButton()
        imgQrcode.image = imgCode
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    @objc func shareView(sender : UITapGestureRecognizer){
        let imageShare = [ imgCode ]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    @objc func saveView(sender : UITapGestureRecognizer){
        UIImageWriteToSavedPhotosAlbum(imgQrcode.image!, nil, nil, nil)
        showToast(message: LanguageHelper.getTranslationByKey(LanguageKey.SaveSuccess)!)
        print(viewModel.typeCode!.uppercased())
        let jsonData = contentData!.content!.data(using: .utf8)!
        if viewModel.typeCode!.uppercased() == EnumType.URL.rawValue {
            let valueData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.TEXT.rawValue {
            let valueData = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.WIFI.rawValue {
            let valueData = try! JSONDecoder().decode(WifiModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.TELEPHONE.rawValue {
            let valueData = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.CONTACT.rawValue {
            let valueData = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.EVENT.rawValue {
            let valueData = try! JSONDecoder().decode(EventModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.LOCATION.rawValue {
            let valueData = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.MESSAGE.rawValue {
            let valueData = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if viewModel.typeCode!.uppercased() == EnumType.EMAIL.rawValue {
            let valueData = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            if viewModel.isUpdate != AppConstants.ISUPDATE
            {
                viewModel.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel.doUpdate(mCreateDateTime: viewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData))
            }
        }
        
    }
    
}
