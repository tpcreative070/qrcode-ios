//
//  PhoneGenerateVC.swift
//  qrscanner
//
//  Created by Mac10 on 3/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

class BarcodeVC: BaseViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var endedUpScrollViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy   var viewBarcodeBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = AppConstants.WIDTH_BORDER
        view.layer.cornerRadius = AppConstants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbProductId : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.ProductID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbType : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldProduct: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        return view
    }()
    lazy var  viewDropDown : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgDropdown : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_DROPDOWN)
        view.tintColor = AppColors.BLACK_COLOR
        return view
    }()
    lazy var dropdownType : DropDown  = {
        let view  = DropDown()
        view.shadowColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var barcodeViewModel = BarcodeViewModel()
    var generateViewModel : GenerateViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        generateViewModel = GenerateViewModel()
        self.bindViewModel()
        self.checkIsSeenDetail()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          keyboardHelper?.registerKeyboardNotification()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

    }
    
    override func dismissKeyboard() {
        doDismiss()
    }
    override func closeButtonPress() {
        dismiss()
    }
    @objc func doBack() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        }
    @objc func doGenerate() {
        self.defineValue()
        generateViewModel?.doGenerateBarCode();
    }
    @objc func inputFieldEditingDidEnd(textField: UITextField){
        self.generateViewModel?.focusTextField = textField
        if textField == textFieldProduct {
            generateViewModel?.productID = textField.text ?? ""
        }
        
    }
    @objc func actionDropDown(sender : UIView){
        let controller = ArrayChoiceTableViewController(BarcodeType.allValues) { (type) in
            self.barcodeViewModel.barcodetype = type.rawValue
            self.lbType.text = self.setTextLabel(mString: String(describing: type.rawValue))
        }
        controller.preferredContentSize = CGSize(width: view.frame.width, height: DeviceHelper.Shared.HEIGHT_BGDROPDOWN )
        showPopup(controller, sourceView: sender)
    }
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.up]
        self.present(controller, animated: true)
    }
 func setTextLabel(mString: String) -> String{
        if mString == BarcodeType.EAN_8.rawValue{
            self.textFieldProduct.keyboardType = UIKeyboardType.numberPad
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8) ?? "EAN 8"
        }
        else if mString == BarcodeType.EAN_13.rawValue{
             self.textFieldProduct.keyboardType = UIKeyboardType.numberPad
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_13) ?? "EAN 13"
        }
//        else if mString == BarcodeType.PDF417.rawValue{
//            self.textFieldProduct.keyboardType = UIKeyboardType.alphabet
//            return LanguageHelper.getTranslationByKey(LanguageKey.PDF417) ?? "PDF417"
//
//        }
//        else if mString == BarcodeType.Aztec.rawValue{
//            self.textFieldProduct.keyboardType = UIKeyboardType.default
//            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "Aztec"
//        }
//        else if mString == BarcodeType.UPCE.rawValue{
//            self.textFieldProduct.keyboardType = UIKeyboardType.default
//            return LanguageHelper.getTranslationByKey(LanguageKey.UPCE) ?? "UPCE"
//        }
//        else if mString == BarcodeType.UPCA.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.UPCA) ?? "UPCA"
//        }
//        else if mString == BarcodeType.CODE128.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Code_128) ?? "CODE 128"
//        }
//        else if mString == BarcodeType.CODE93.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Code_93) ?? "CODE 93"
//        }
//        else if mString == BarcodeType.CODE39.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "CODE 39"
//        }
//        else if mString == BarcodeType.ITF.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.ITF) ?? "ITF"
//        }
//        else if mString == BarcodeType.CODABAR.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.CODABAR) ?? "CODABAR"
//        }
        else{
            return LanguageHelper.getTranslationByKey(LanguageKey.NotFound) ?? "EAN 8"
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lbType.text = QRCodeHelper.shared.setTextLabel(mString: self.barcodeViewModel.barcodetype ?? "")
        self.textFieldProduct.keyboardType = UIKeyboardType.numberPad
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PRODUCTID] = ""
        if barcodeViewModel.barcodetype == BarcodeType.EAN_8.rawValue{
            textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.Placeholder_Ean8)
        }
        else if barcodeViewModel.barcodetype == BarcodeType.EAN_13.rawValue{
            textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.Placeholder_Ean13)                   }
        else if barcodeViewModel.barcodetype == BarcodeType.PDF417.rawValue{
             textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.PDF417)

        }
            
        else if barcodeViewModel.barcodetype == BarcodeType.Aztec.rawValue{
             textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.Aztec)
        }
        else if barcodeViewModel.barcodetype == BarcodeType.UPCE.rawValue{
                   textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.UPCE)
              }
    }
    
}


