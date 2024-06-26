//
//  SettingsVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import MessageUI
class SettingsVC : BaseViewController, MFMailComposeViewControllerDelegate {
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
    lazy var viewWrapper: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewVibrate: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewBeep: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewMultiScan: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewSubMultiScan: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewMultiLoad: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewChangeColor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewCopy: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewOpenWeb: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewAppPermission: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewPrivacy: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewLanguage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewTheme: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewRate: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewHelp: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewShare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewSupport: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewVersion: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewDulplicate: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewChangeColor : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewMultiScan : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewMultiLoad : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewCopy : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewOpenWeb : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewDuplicate : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewVersion : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewLanguage : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewTheme : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewSupport : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewRate : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewHelp : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackViewShare : StackView = {
        let view = StackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbScan : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Scan)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbAvanceFeatures : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Advance_Feature)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbScanMulti : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.MultiScan)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLoadMulti : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.MultiLoad)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbDuplicate : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Duplicate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbInformation : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Information)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbVibrate : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Vibrate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbBeep : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Beep)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbChangeColor : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Change_code_color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbChangeColorContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Change_code_color_content)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbCopy : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.CopyClipboard)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbCurrentLanguage : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbCurrentTheme : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLanguage : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Language)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTheme : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Theme)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbThemeContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.ThemeContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbDuplicateContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Duplicate_Content)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbLanguageContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.ChooseYourLanguage)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbCopyContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.CopyClipboard_Content)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbOpenWeb : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.OpenWeb)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbOpenWebContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.OpenWebContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbAppPermission : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.AppPermission)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbPrivacy : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Privacy)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbRating : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Rate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbRateContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.RateContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbShare : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Share)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbShareContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.ShareContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbHelp : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Help)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbHelpContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.HelpContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbSupport : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Support)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbSupportContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.SupportContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbQrCode : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.QRVersion)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbQrCodeContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.QRVersionContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbMultiScanContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.MultiScanContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbContent : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbMultiLoadContent : ICLabel = {
        let view = ICLabel()
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.MultiLoadContent)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var switchVibrate: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchMultiScan: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchMultiLoad: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchDuplicate: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchBeep: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchCopy: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var switchOpen: ICSwitchButton = {
        let switchView = ICSwitchButton()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false;
        return switchView
    }()
    lazy var imgMultiScan : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_SCAN_QR)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgTheme : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_THEME)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgMultiLoad : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_MULTI_IMG)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgDuplicate : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_DUPLICATE)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgVibrate : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_VIBRATION)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgLanguage : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_FLAG)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    
    lazy var imgBeep : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_BEEP)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgCrownScan : UIImageView = {
           let view = UIImageView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.image = UIImage(named: AppImages.IC_CROWN)
           view.tintColor = AppColors.PRIMARY_COLOR
           return view
       }()
    lazy var imgCrownLoad : UIImageView = {
              let view = UIImageView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.image = UIImage(named: AppImages.IC_CROWN)
              view.tintColor = AppColors.PRIMARY_COLOR
              return view
          }()
    lazy var imgCrownChangeColor : UIImageView = {
              let view = UIImageView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.image = UIImage(named: AppImages.IC_CROWN)
              view.tintColor = AppColors.PRIMARY_COLOR
              return view
          }()
    lazy var imgCrownSkip : UIImageView = {
              let view = UIImageView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.image = UIImage(named: AppImages.IC_CROWN)
              view.tintColor = AppColors.PRIMARY_COLOR
              return view
          }()
    lazy var imgCrownTheme : UIImageView = {
              let view = UIImageView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.image = UIImage(named: AppImages.IC_CROWN)
              view.tintColor = AppColors.PRIMARY_COLOR
              return view
          }()
    lazy var imgChangeColor : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_COLOR)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var viewUnderLineScan : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewUnderLineAdvance : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewUnderLineInformation : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgQRCode : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_QRCODE)
        return view
    }()
    lazy var imgCopy : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_COPY)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgWeb : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_LANGUAGE)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgAppPermission : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_PERMISSION)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgPrivacy : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_PRIVACY)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgRate : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_START)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgShare : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_SHARE)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgHelp : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_HELP)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgSupport : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_SUPPORT)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgVersion : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_LABEL)
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    var scannerViewModel = ScannerViewModel()
    var settingViewModel = SettingViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindViewModel()
        checkIsOnSwitch()
    }
    
    @objc func switchVibrateDidChange (_ : ICSwitchButton){
        
        //ScannerVC().viewModel.isVibrate = switchVibrate.isOn
        if switchVibrate.isOn{
            switchVibrate.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Vibrate, value: true)
        }
        else {
            switchVibrate.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Vibrate, value: false)
        }
        
    }
    @objc func switchOpenDidChange (_ : ICSwitchButton){
        if switchOpen.isOn{
            switchOpen.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.OpenWeb, value: true)
            
            
        }
        else {
            switchOpen.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.OpenWeb, value: false)
            
        }
    }
    @objc func switchBeepDidChange (_ : ICSwitchButton){
        if switchBeep.isOn{
            switchBeep.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Beep, value: true)
            
        }
        else {
            switchBeep.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Beep, value: false)
        }
    }
    @objc func switchCopyDidChange (_ : ICSwitchButton){
        if switchCopy.isOn{
            switchCopy.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Copy, value: true)
        }
        else {
            switchCopy.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Copy, value: false)
        }
        //self.viewModel.isQRCode =  switchVibrate.isOn
    }
    @objc func doChangeLanguage (sender : UITapGestureRecognizer){
        
        let alrController = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Language), message: LanguageHelper.getTranslationByKey(LanguageKey.ChooseYourLanguage), preferredStyle: UIAlertController.Style.actionSheet)
        let enlishAc = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.English), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            CommonService.setMultipleLanguages(value: LanguageCode.English)
            self.navigationController?.pushViewController(MainVC(), animated: false)
            self.navigationController?.viewControllers.remove(at: 0)
            //  self.navigationController?.viewControllers.removeAll()
            self.dismiss()
            
        })
        let vietnamAc = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Vietnamese), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            CommonService.setMultipleLanguages(value: LanguageCode.Vietnamese)
            self.navigationController?.pushViewController(MainVC(), animated: false)
            self.navigationController?.viewControllers.remove(at: 0)
            self.dismiss()
            
        })
        let esAc = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Spanish), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            CommonService.setMultipleLanguages(value: LanguageCode.Spanish)
            self.navigationController?.pushViewController(MainVC(), animated: false)
            self.navigationController?.viewControllers.remove(at: 0)
            self.dismiss()
            
        })
        let ptAc = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Portuguese), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            CommonService.setMultipleLanguages(value: LanguageCode.Portuguese)
            self.navigationController?.pushViewController(MainVC(), animated: false)
            self.navigationController?.viewControllers.remove(at: 0)
            self.dismiss()
            
        })
        let cancelAction = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Cancel), style: UIAlertAction.Style.cancel, handler: {(alert: UIAlertAction!) in
            self.dismiss()
        })
        
        alrController.addAction(enlishAc)
        alrController.addAction(vietnamAc)
        alrController.addAction(esAc)
        alrController.addAction(ptAc)
        alrController.addAction(cancelAction)
        alrController.pruneNegativeWidthConstraints()
        if DeviceHelper.isIpad(){
            if let popoverController = alrController.popoverPresentationController {
                popoverController.sourceView = self.view //to set the source of your alert
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
                popoverController.permittedArrowDirections = [.up] //to hide the arrow of any particular direction
            }
            self.present(alrController, animated: true, completion: nil)
        }
        else{
            self.present(alrController, animated: true, completion: nil)
            
        }
        
    }
    @objc func doChangeTheme (sender : UITapGestureRecognizer){
        let alrController = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.ChangeTheme), message: LanguageHelper.getTranslationByKey(LanguageKey.ChooseYourTheme), preferredStyle: UIAlertController.Style.actionSheet)
        let lightTheme = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.LightTheme), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            
            CommonService.setUserDefault(key: KeyUserDefault.Theme, value: false)
            self.lbCurrentTheme.text = LanguageHelper.getTranslationByKey(LanguageKey.LightTheme)
           // self.overrideUserInterfaceStyle = .light
            UIApplication.shared.windows.forEach { window in
                                      window.overrideUserInterfaceStyle = .light
                                  }
            self.viewWrapper.overrideUserInterfaceStyle = .light

            self.dismiss()
            
        })
        let darkTheme = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.DarkTheme), style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            CommonService.setUserDefault(key: KeyUserDefault.Theme, value: true)
            self.lbCurrentTheme.text = LanguageHelper.getTranslationByKey(LanguageKey.DarkTheme)
            UIApplication.shared.windows.forEach { window in
                                      window.overrideUserInterfaceStyle = .dark
                                  }
            self.viewWrapper.overrideUserInterfaceStyle = .dark

            self.dismiss()
        })
        let cancelAction = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Cancel), style: UIAlertAction.Style.cancel, handler: {(alert: UIAlertAction!) in
            self.dismiss()
        })
        
        alrController.addAction(lightTheme)
        alrController.addAction(darkTheme)
        alrController.addAction(cancelAction)
        alrController.pruneNegativeWidthConstraints()
        if DeviceHelper.isIpad(){
            if let popoverController = alrController.popoverPresentationController {
                popoverController.sourceView = self.view //to set the source of your alert
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
                popoverController.permittedArrowDirections = [.up] //to hide the arrow of any particular direction
            }
            self.present(alrController, animated: true, completion: nil)
        }
        else{
            self.present(alrController, animated: true, completion: nil)
            
        }
        
    }
    @objc func doChangeColor (sender : UITapGestureRecognizer){
        let vc = ChangeColorVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func showPermission (sender : UITapGestureRecognizer){
        let alert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.AppPermission), message:"\(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent1)!)\n \(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent2)!) \n \(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent3)!) \n \(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent4)!)\n \(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent5)!)\n \(LanguageHelper.getTranslationByKey(LanguageKey.AppPermissonContent6)!)\n", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Ok), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func switchMultiScanDidChange (_ : ICSwitchButton){
        if switchMultiScan.isOn{
            switchMultiScan.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.MultiScan, value: true)
        }
        else {
            switchMultiScan.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.MultiScan, value: false)
        }
    }
    @objc func switchMultiLoadDidChange (_ : ICSwitchButton){
        if switchMultiLoad.isOn{
            switchMultiLoad.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.MultiLoad, value: true)
            
        }
        else {
            switchMultiLoad.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.MultiLoad, value: false)
            
        }
    }
    @objc func switchDuplicateDidChange (_ : ICSwitchButton){
        if switchDuplicate.isOn{
            switchDuplicate.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Duplicate, value: true)
            
        }
        else {
            switchDuplicate.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Duplicate, value: false)
            
        }
    }
    @objc func showPrivacy (sender : UITapGestureRecognizer){
        let string = LanguageKey.Link_Privacy
        if let url = NSURL(string: string) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            
        }
    }
    
    @objc func showShare (sender : UITapGestureRecognizer){
        let share = LanguageKey.Link_Share
        let activiController = UIActivityViewController(activityItems: [share], applicationActivities: nil)
        if DeviceHelper.isIpad(){
            if let popoverController = activiController.popoverPresentationController {
                popoverController.sourceView = self.view //to set the source of your alert
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
                popoverController.permittedArrowDirections = [.up] //to hide the arrow of any particular direction
            }
            self.present(activiController, animated: true, completion: nil)
        }
        else{
            self.present(activiController, animated: true, completion: nil)
            
        }
    }
    @objc func doSwitchVibrate (sender : UITapGestureRecognizer){
        settingViewModel.isVibrate = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.Vibrate) ?? false))
        if settingViewModel.isVibrate ?? false {
            switchVibrate.setOn(on: true, animated: true)
            switchVibrate.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Vibrate, value: true)
            
        }
        else {
            switchVibrate.setOn(on: false, animated: true)
            switchVibrate.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Vibrate, value: false)
        }
    }
    
    @objc func doSwitchBeep (sender : UITapGestureRecognizer){
        settingViewModel.isBeep = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.Beep) ?? false))
        if settingViewModel.isBeep ?? false {
            switchBeep.setOn(on: true, animated: true)
            switchBeep.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Beep, value: true)
            
        }
        else {
            switchBeep.setOn(on: false, animated: true)
            switchBeep.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Beep, value: false)
        }
    }
    
    @objc func doSwitchMultiScan (sender : UITapGestureRecognizer){
        settingViewModel.isMultiScan = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.MultiScan) ?? false))
        if settingViewModel.isMultiScan ?? false {
            switchMultiScan.setOn(on: true, animated: true)
            switchMultiScan.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.MultiScan, value: true)
            
        }
        else {
            switchMultiScan.setOn(on: false, animated: true)
            switchMultiScan.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.MultiScan, value: false)
        }
    }
    
    @objc func doSwitchMultiLoad (sender : UITapGestureRecognizer){
        settingViewModel.isMultiLoad = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.MultiLoad) ?? false))
        if settingViewModel.isMultiLoad ?? false {
            switchMultiLoad.setOn(on: true, animated: true)
            switchMultiLoad.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.MultiLoad, value: true)
            
        }
        else {
            switchMultiLoad.setOn(on: false, animated: true)
            switchMultiLoad.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.MultiLoad, value: false)
        }
    }
    
    @objc func doSwitchCopy (sender : UITapGestureRecognizer){
        settingViewModel.isCopy = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.Copy) ?? false))
        if settingViewModel.isCopy ?? false {
            switchCopy.setOn(on: true, animated: true)
            switchCopy.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Copy, value: true)
            
        }
        else {
            switchCopy.setOn(on: false, animated: true)
            switchCopy.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Copy, value: false)
        }
    }
    @objc func doSwitchOpenWeb (sender : UITapGestureRecognizer){
        settingViewModel.isOpenWeb = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.OpenWeb) ?? false))
        if settingViewModel.isOpenWeb ?? false {
            switchOpen.setOn(on: true, animated: true)
            switchOpen.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.OpenWeb, value: true)
            
        }
        else {
            switchOpen.setOn(on: false, animated: true)
            switchOpen.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.OpenWeb, value: false)
        }
    }
    @objc func doSwitchDulplicate (sender : UITapGestureRecognizer){
        settingViewModel.isSkip = !(Bool(CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false))
        if settingViewModel.isSkip ?? false {
            switchDuplicate.setOn(on: true, animated: true)
            switchDuplicate.isOn = true
            CommonService.setUserDefault(key: KeyUserDefault.Duplicate, value: true)
            
        }
        else {
            switchDuplicate.setOn(on: false, animated: true)
            switchDuplicate.isOn = false
            CommonService.setUserDefault(key: KeyUserDefault.Duplicate, value: false)
        }
    }
    
    @objc func showRating(sender : UITapGestureRecognizer){
         CommonService.ratingApp()
    }
    @objc func showHelp (sender : UITapGestureRecognizer){
        
        let vc = HelpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func showSupport (sender : UITapGestureRecognizer){
        let mailComposer = configureMailController()
                   if MFMailComposeViewController.canSendMail(){
                       self.present(mailComposer,animated: true, completion: nil)
                   }else{
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
    override func viewDidAppear(_ animated: Bool) {
        changeColorQRCode(imgQRCode: imgQRCode)
    }
    
}
