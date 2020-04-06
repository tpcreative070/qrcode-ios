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
        view.keyboardType = .numberPad
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
        self.barcodeViewModel.typeBarcode = BarcodeType.EAN_8.rawValue
        self.bindViewModel()
        self.checkIsSeenDetail()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          keyboardHelper?.registerKeyboardNotification()
       // self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           keyboardHelper?.deregisterKeyboardNotification()
        self.navigationController?.isNavigationBarHidden = true
        
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
        print("done")
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
            self.barcodeViewModel.typeBarcode = type.rawValue
            self.lbType.text = self.setTextLabel(mString: String(describing: type.rawValue))
            
        }
        controller.preferredContentSize = CGSize(width: 300, height: 95)
        showPopup(controller, sourceView: sender)
    }
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.up]
        self.present(controller, animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lbType.text = setTextLabel(mString: self.barcodeViewModel.typeBarcode ?? "")
        self.generateViewModel?.errorMessages.value[GenerateViewModelKey.PRODUCTID] = ""
        if barcodeViewModel.typeBarcode == BarcodeType.EAN_8.rawValue{
            textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.Placeholder_Ean8)
        }
        else{
            textFieldProduct.placeholder = LanguageHelper.getTranslationByKey(LanguageKey.Placeholder_Ean13)                   }
    }
    
}


