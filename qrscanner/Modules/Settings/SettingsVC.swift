//
//  SettingsVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class SettingsVC : BaseViewController {
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
    var stackViewChangeColor : StackView = {
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
    var stackViewVersion : StackView = {
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
    lazy var lbShare : ICLabel = {
           let view = ICLabel()
           view.text = LanguageHelper.getTranslationByKey(LanguageKey.Share)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    lazy var lbHelp : ICLabel = {
            let view = ICLabel()
            view.text = LanguageHelper.getTranslationByKey(LanguageKey.Help)
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
    lazy var switchVibrate: IGSwitch = {
       let switchView = IGSwitch()
       switchView.isOn = false
       switchView.translatesAutoresizingMaskIntoConstraints = false;
       return switchView
     }()
    lazy var switchBeep: IGSwitch = {
       let switchView = IGSwitch()
       switchView.isOn = false
       switchView.translatesAutoresizingMaskIntoConstraints = false;
       return switchView
     }()
    lazy var switchCopy: IGSwitch = {
       let switchView = IGSwitch()
       switchView.isOn = false
       switchView.translatesAutoresizingMaskIntoConstraints = false;
       return switchView
     }()
    lazy var switchOpen: IGSwitch = {
       let switchView = IGSwitch()
       switchView.isOn = false
       switchView.translatesAutoresizingMaskIntoConstraints = false;
       return switchView
     }()
    lazy var imgVibrate : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: AppImages.IC_VIBRATION)
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
        view.tintColor = AppColors.COLOR_ACCENT
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
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
