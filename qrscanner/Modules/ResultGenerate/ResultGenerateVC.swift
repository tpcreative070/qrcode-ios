//
//  ResultGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class ResultGenerateVC: BaseViewController {
    var shareView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var saveView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var shareImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_share")
        return view
    }()
    lazy var shareLbl : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = LanguageKey.Share
        return view
    }()
    lazy var saveImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_save")
        return view
    }()
    
    lazy var saveLabel : ICLabel = {
        let view = ICLabel()
        view.text = LanguageKey.Save
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewModel : ResultViewModel?
    var imgCode : UIImage = UIImage()
    var typeCode = ""
    var contentData : ContentModel?
    var createDateTime : Int = 0
    var isUpdate = 0
    lazy var qrcodeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        self.addLeftBackButton()
        viewModel = ResultViewModel()
        qrcodeImage.image = imgCode
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
        UIImageWriteToSavedPhotosAlbum(qrcodeImage.image!, nil, nil, nil)
        showToast(message: LanguageKey.SaveSuccess)
        print(typeCode)
        viewModel!.typeCode = typeCode
        typeCode = typeCode.uppercased()
        
        let jsonData = contentData!.content!.data(using: .utf8)!
        if typeCode == LanguageKey.Url {
            let valueData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if typeCode == LanguageKey.Text {
            let valueData = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        else if typeCode == LanguageKey.Telephone {
            let valueData = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if typeCode == LanguageKey.Wifi {
            let valueData = try! JSONDecoder().decode(WifiModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        else if typeCode == LanguageKey.Contact {
            let valueData = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
            }
        }
        else if typeCode == LanguageKey.Event {
            let valueData = try! JSONDecoder().decode(EventModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        else if typeCode == LanguageKey.Location {
            let valueData = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        else if typeCode == LanguageKey.Message {
            let valueData = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        else if typeCode == LanguageKey.Email {
            let valueData = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            if isUpdate != AppConstants.ISUPDATE
            {
                viewModel?.doInsert(mValue: GenerateEntityModel(data: valueData))
            }
            else
            {
                viewModel?.doUpdate(mCreateDateTime: createDateTime, mValue: GenerateEntityModel(data: valueData))
                
            }
        }
        
    }
    
}
