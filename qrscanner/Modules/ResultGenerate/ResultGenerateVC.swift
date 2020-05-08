//
//  ResultGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Photos
class ResultGenerateVC: BaseViewController {
    var viewShare: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewSave: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: AppColors.ColorViewBg)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
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
    var resultViewModel : ResultViewModel = ResultViewModel()
    var imgCode : UIImage = UIImage()
    var dataImage : Data = Data()
    var contentViewModel : ContentViewModel?
    lazy var imgQrcode: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: AppColors.ColorAppearance)
        initUI()
        imgQrcode.image = imgCode
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHelper?.registerKeyboardNotification()
//        self.navigationController?.viewControllers.remove(at: 1)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        bindViewModel()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardHelper?.deregisterKeyboardNotification()
       // self.navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        if resultViewModel.isSave {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    @objc func shareView(sender : UITapGestureRecognizer){
        let imageShare = [ imgCode ]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
   
    }
    @objc func saveView(sender : UITapGestureRecognizer){
        resultViewModel.isSave =  true
        self.navigationController?.viewControllers.remove(at: 1)
       // UIImageWriteToSavedPhotosAlbum(imgQrcode.image!, nil, nil, nil)
         guard let mData = imgQrcode.image else {
                   return
               }
        CustomPhotoAlbum.sharedInstance.save(image: mData)
        let jsonData = contentViewModel!.content!.data(using: .utf8)!
        var isCode = "QRCode"
        if resultViewModel.typeCode!.uppercased() == EnumType.URL.rawValue {
            let valueData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.TEXT.rawValue {
            let valueData = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.WIFI.rawValue {
            let valueData = try! JSONDecoder().decode(WifiModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.TELEPHONE.rawValue {
            let valueData = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.CONTACT.rawValue {
            let valueData = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.EVENT.rawValue {
            let valueData = try! JSONDecoder().decode(EventModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.LOCATION.rawValue {
            let valueData = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.MESSAGE.rawValue {
            let valueData = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.EMAIL.rawValue {
            let valueData = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            if resultViewModel.isUpdate != AppConstants.ISUPDATE
            {
                resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
            else
            {
                resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
            }
        }
        else if resultViewModel.typeCode!.uppercased() == EnumType.BARCODE.rawValue {
                   let valueData = try! JSONDecoder().decode(BarcodeModel.self, from: jsonData)
                    isCode = valueData.barcodetype ?? "Barcode"
                   if resultViewModel.isUpdate != AppConstants.ISUPDATE
                   {
                    
                    resultViewModel.doInsert(mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
                   }
                   else
                   {
                       resultViewModel.doUpdate(mCreateDateTime: resultViewModel.createDateTime!, mValue: GenerateEntityModel(data: valueData, isCode: isCode, isHistory : false, isSave: true))
                   }
               }
        showToast(message: LanguageHelper.getTranslationByKey(LanguageKey.SaveSuccess)!)
    }
    @objc func printAction(sender : UITapGestureRecognizer){
        self.printImage()
    }
    
}
