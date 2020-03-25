//
//  TableViewCell.swift
//  vietlifetravel
//
//  Created by Mac10 on 7/3/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import UIKit
import Contacts
import MapKit
import EventKit
class TableViewCell : UITableViewCell{
    var viewModel  = TableViewCellViewModel()
    var delegate : TableViewCellDelegate?
    var identifier =  EnumIdentifier.None
    var codable : Codable?
    let viewBackground : UIView = {
        let view = UIView()
        //        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let viewBackgroundSecond : UIView = {
        let view = UIView()
        //        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewUnderLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imgIcon : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        return view
    }()
    lazy var imgPlusIcon : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_GENERATE)
        return view
    }()
    lazy var lbTitle : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    /*history*/
    lazy var viewRoot : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewContent : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lbCreatedDate : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewSub : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lbContent : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTypeCode : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var checkBox : ICCheckBox = {
        let view = ICCheckBox()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var stackViewVertical : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //config with history
    func configView(view : GenerateViewModelDeletegate){
        self.lbTypeCode.text = "\(view.typeCodeView)"
        print("\(view.typeCodeView)")
        self.lbCreatedDate.text = String(view.createdDateTimeView)
        print("\(view.createdDateTimeView)")
        self.lbContent.text = view.contentView
        print("\(view.contentView)")
        self.lbContent.textColor = AppColors.GRAY
        self.checkBox.borderStyle = .square
        self.checkBox.checkmarkStyle = .tick
        self.checkBox.borderWidth = 2
        self.checkBox.checkedBorderColor = AppColors.COLOR_ACCENT
        self.checkBox.checkmarkColor = AppColors.COLOR_ACCENT
        self.checkBox.isEnabled = false
        self.checkBox.isChecked = view.checkShowView ?? false
    }
    func configView(view : ContentViewModelDeletegate){
        if view.typeCodeView.uppercased() == EnumType.URL.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let urlData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            configView(viewModel: UrlViewModel(url: urlData.url!))
        }
        if view.typeCodeView.uppercased() == EnumType.EMAIL.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            configView(viewModel: EmailViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == EnumType.TEXT.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let urlData = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            configView(viewModel: TextViewModel(text: urlData.text!))
        }
        if view.typeCodeView.uppercased() == EnumType.MESSAGE.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            configView(viewModel: MessageViewModel(data: MessageModel(to: data.to!, message: data.message!)))
        }
        if view.typeCodeView.uppercased() == EnumType.LOCATION.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            configView(viewModel: LocationViewModel(data: LocationModel(latitude: data.latitude!, longtitude: data.longtitude!, query: data.query!)))
        }
        if view.typeCodeView.uppercased() == EnumType.EVENT.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(EventModel.self, from: jsonData)
            configView(viewModel: EventViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == EnumType.CONTACT.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            configView(viewModel: ContactViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == EnumType.TELEPHONE.rawValue{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            configView(viewModel: PhoneViewModel(phone: data))
        }
        if view.typeCodeView.uppercased() == EnumType.WIFI.rawValue{
                 let jsonData = view.contentView.data(using: .utf8)!
                 let data = try! JSONDecoder().decode(WifiModel.self, from: jsonData)
                 configView(viewModel: WifiViewModel(data: data))
             }
       }
    func configViewSave(view : GenerateViewModelDeletegate){
           self.lbTypeCode.text = "\(view.typeCodeView)"
           self.lbCreatedDate.text = String(view.updatedDateTimeView)
           self.lbContent.text = view.contentView
           self.lbContent.textColor = AppColors.GRAY
        }
    //Config with generate
    func configView(viewModel : TypeCodeViewModelDelegate){
        self.lbTitle.text = "\(viewModel.nameView)"
        self.imgIcon.image = UIImage(named: viewModel.imgIconView)
    }
//    func configView(viewModel: ContentModel){
//        if viewModel.typeCode!.uppercased() == LanguageKey.Url{
//            configView(viewModel: UrlViewModel(url: "sdfsd"))
//        }
//        if viewModel.typeCode!.uppercased() == LanguageKey.Phone{
//            configView(viewModel: PhoneViewModel(phone: "983248593"))
//        }
//    }
    func configData(viewModel : Codable){
        self.codable = viewModel
    }
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if reuseIdentifier == EnumIdentifier.History.rawValue {
            identifier = EnumIdentifier.History
        }
        else if reuseIdentifier == EnumIdentifier.Generate.rawValue {
            identifier = EnumIdentifier.Generate
        }
        else if reuseIdentifier == EnumIdentifier.Save.rawValue {
            identifier = EnumIdentifier.Save
        }
        else if reuseIdentifier == EnumIdentifier.Url.rawValue {
            identifier = EnumIdentifier.Url
        }
        else if reuseIdentifier == EnumIdentifier.Text.rawValue {
            identifier = EnumIdentifier.Text
        }
        else if reuseIdentifier == EnumIdentifier.Telephone.rawValue {
            identifier = EnumIdentifier.Telephone
        }
        else if reuseIdentifier == EnumIdentifier.Email.rawValue {
            identifier = EnumIdentifier.Email
        }
        else if reuseIdentifier == EnumIdentifier.Wifi.rawValue {
            identifier = EnumIdentifier.Wifi
        }
        else if reuseIdentifier == EnumIdentifier.Contact.rawValue {
            identifier = EnumIdentifier.Contact
        }
        else if reuseIdentifier == EnumIdentifier.Location.rawValue {
            identifier = EnumIdentifier.Location
        }
        else if reuseIdentifier == EnumIdentifier.Message.rawValue {
            identifier = EnumIdentifier.Message
        }
        else if reuseIdentifier == EnumIdentifier.Event.rawValue {
            identifier = EnumIdentifier.Event
        }
        else if reuseIdentifier == EnumIdentifier.HistoryChoose.rawValue {
            identifier = EnumIdentifier.HistoryChoose
        }
        else if reuseIdentifier == EnumIdentifier.SaveChoose.rawValue {
            identifier = EnumIdentifier.SaveChoose
        }
        else if reuseIdentifier == EnumIdentifier.Content.rawValue {
                   identifier = EnumIdentifier.Content
               }
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func actionCellViewTap(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            self.delegate?.cellViewSelected(cell: data)
        }
        if identifier == EnumIdentifier.HistoryChoose {
            self.checkBox.isChecked = !self.checkBox.isChecked
        }
        if identifier == EnumIdentifier.SaveChoose {
                   self.checkBox.isChecked = !self.checkBox.isChecked
               }
        
    }
    @objc func actionCellViewLongPress(sender : UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizer.State.began {
            self.delegate?.cellViewLongSelected(cell: self)
            //                      if let data = codable {
            //                          self.delegate?.cellViewSelected(cell: data)
            //                      }
            if identifier == EnumIdentifier.HistoryChoose {
                self.checkBox.isChecked = !self.checkBox.isChecked
            }
            if identifier == EnumIdentifier.SaveChoose {
                self.checkBox.isChecked = !self.checkBox.isChecked
            }
        }
        
        
    }
    @objc func actionImageViewTap(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            //  self.delegate?.cellViewSelected(cell: data)
            let value_data = JSONHelper.get(value: HistoryViewModel.self,anyObject: data)
            if value_data != nil{
                let valueShare = Helper.getValueShareContent(typeCode: value_data!.typeCode, contentData: value_data!.content.content!)
                
                let activiController = UIActivityViewController(activityItems: [valueShare], applicationActivities: nil)
                UIApplication.shared.keyWindow?.rootViewController?.present(activiController,animated: true, completion: nil)
     
            }
        }
    }
    
    @objc func actionCellViewAction(sender : UITapGestureRecognizer){
        if identifier == EnumIdentifier.Lixi {
            self.delegate?.cellViewSelected(cell: self, action: EnumResponseToView.ACTION_GIFT)
        }
    }
    
    @objc func controlValueChanged(sender : ICStepper){
        self.delegate?.cellViewSelected(cell: self, countSelected: Int(sender.value))
        self.viewModel.maxBinding.value = Int(sender.value)
    }
    /*url detail */
    lazy  var viewUrlBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTitleFirst : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textFieldValueFirst: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var textFieldValueSecond: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var textFieldValueThird: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var textFieldValueFour: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var textFieldValueFive: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    var viewBackgroundThird: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewBackgroundFour: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var viewClipboard: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgSearch : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_SEARCH)
        return view
    }()
    lazy var lbTitleSecond : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgUrl : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_LANGUAGE)
        return view
    }()
    
    lazy var lbTitleThird : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTitleFour : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTitleFive : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lbTitleSix : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imgClipboard : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_COPY)
        return view
    }()
    lazy var lbClipboard : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = LanguageHelper.getTranslationByKey(LanguageKey.Clipboard)
        return view
    }()
    func configView(viewModel : UrlViewModelDelegate){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Url)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Search)
        self.textFieldValueFirst.text = viewModel.urlTxtView
    }
    /*text*/
    lazy var imgText : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_SMS)
        return view
    }()
    
    func configView(viewModel : TextViewModelDelegate){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.Text)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Text)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Search)
        self.textFieldValueFirst.text = viewModel.textTxtView
    }
    /*phone*/
    lazy var imgPhone : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_PHONE)
        return view
    }()
    
    func configView(viewModel : PhoneViewModelDelegate){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.Phone)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Phone)
        self.textFieldValueFirst.text = viewModel.phoneTxtView
    }
    /*email*/
    lazy var imgEmail : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_EMAIL)
        return view
    }()
    
    func configView(viewModel : EmailViewModelDelegate){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.To)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Subject)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Message)
        self.lbTitleFour.text = LanguageHelper.getTranslationByKey(LanguageKey.Email)
        
        self.textFieldValueFirst.text = viewModel.toTxtView
        self.textFieldValueSecond.text = viewModel.subjectView
        self.textFieldValueThird.text = viewModel.messageView
    }
    /*wifi*/
    lazy var imgWifi : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_WIFI)
        return view
    }()
    
    func configView(viewModel : WifiViewModelDelegate){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.SSID)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Password)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.NetworkEncryption)
        self.lbTitleFour.text = LanguageHelper.getTranslationByKey(LanguageKey.Hidden)
        self.lbTitleFive.text = LanguageHelper.getTranslationByKey(LanguageKey.Wifi)
        
        self.textFieldValueFirst.text = viewModel.ssidView
        self.textFieldValueSecond.text = viewModel.passwordView
        self.textFieldValueThird.text = viewModel.networkView
        if viewModel.hiddenView {
            self.textFieldValueFour.text = LanguageKey.True
        }
        if !(viewModel.hiddenView) {
            self.textFieldValueFour.text = LanguageKey.False
        }

    }
    /*contact*/
    lazy var imgContact : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_CONTACT_CALENDAR)
        return view
    }()
    
    func configView(viewModel : ContactViewModel){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.FullName)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Address)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Phone)
        self.lbTitleFour.text = LanguageHelper.getTranslationByKey(LanguageKey.Email)
        self.lbTitleFive.text = LanguageHelper.getTranslationByKey(LanguageKey.AddressBook)
        
        self.textFieldValueFirst.text = viewModel.fullnameView
        self.textFieldValueSecond.text = viewModel.addressView
        self.textFieldValueThird.text = viewModel.phoneView
        self.textFieldValueFour.text = viewModel.emailView
        
    }
    /*location*/
    lazy var imgLocation : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_LOCATION)
        return view
    }()
    
    func configView(viewModel : LocationViewModel){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.Latitude)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Longtitude)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Query)
        self.lbTitleFour.text = LanguageHelper.getTranslationByKey(LanguageKey.Location)
        
        self.textFieldValueFirst.text = viewModel.latView
        self.textFieldValueSecond.text = viewModel.longView
        self.textFieldValueThird.text = viewModel.query
        
    }
    /*message*/
    lazy var imgSms : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_SMS)
        return view
    }()
    
    func configView(viewModel : MessageViewModel){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.To)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Message)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Sms)
        
        self.textFieldValueFirst.text = viewModel.toView
        self.textFieldValueSecond.text = viewModel.messageView
        
    }
    /*calendar*/
    lazy var imgEvent : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: AppImages.IC_EVENT)
        return view
    }()
    
    func configView(viewModel : EventViewModel){
        self.lbTitleFirst.text = LanguageHelper.getTranslationByKey(LanguageKey.Title)
        self.lbTitleSecond.text = LanguageHelper.getTranslationByKey(LanguageKey.Location)
        self.lbTitleThird.text = LanguageHelper.getTranslationByKey(LanguageKey.Description)
        self.lbTitleFour.text = LanguageHelper.getTranslationByKey(LanguageKey.TimeBegin)
        self.lbTitleFive.text = LanguageHelper.getTranslationByKey(LanguageKey.TimeEnd)
        self.lbTitleSix.text = LanguageHelper.getTranslationByKey(LanguageKey.Calendar)
        
        
        
        self.textFieldValueFirst.text = viewModel.titleView
        self.textFieldValueSecond.text = viewModel.locationView
        self.textFieldValueThird.text = viewModel.descriptionView
        self.textFieldValueFour.text = viewModel.beginView
        self.textFieldValueFive.text = viewModel.endView
        
        
    }
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //          super.setSelected(selected, animated: animated)
    //          self.accessoryType = selected ? .checkmark : .none
    //      }
    @objc func urlAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
            let value_data = valueContentView?.content
           let jsonData = value_data!.data(using: .utf8)!
            let urlValue = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            if let url = NSURL(string: urlValue.url!) {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                
            }
        }
    }
    @objc func searchUrlAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
            let value_data = valueContentView?.content
           let jsonData = value_data!.data(using: .utf8)!
            let urlValue = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            if let url = URL(string: urlValue.url!) {
                UIApplication.shared.open(url)
            }
        }
    }
    @objc func searchTextAction(sender : UITapGestureRecognizer){
        
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
            let value_data = valueContentView?.content
           let jsonData = value_data!.data(using: .utf8)!
            let value = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            let text = value.text ?? ""
             let  query = text.replacingOccurrences(of: " ", with: "+")
                       let url = "https://www.google.co.in/search?q=" + query
                       UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    @objc func textAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
            let value_data = valueContentView?.content
           let jsonData = value_data!.data(using: .utf8)!
            let value = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            let text = value.text ?? ""
                     let activiController = UIActivityViewController(activityItems: [text as Any], applicationActivities: nil)
                       self.window?.rootViewController!.present(activiController, animated: true, completion: nil)
        }
    }
    @objc func phoneAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
                      let value_data = valueContentView?.content
                     let jsonData = value_data!.data(using: .utf8)!
                      let value = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            let textValue = value.phone ?? ""
            if let url = URL(string: "tel://\(textValue)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            
        }
    }
    @objc func messageAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
                      let value_data = valueContentView?.content
                     let jsonData = value_data!.data(using: .utf8)!
                      let value = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            let smsValue = "sms:+\((value.to ?? ""))&body=\(value.message ?? "")"
            let strURL: String = smsValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
            
        }
    }
    @objc func clipboardAction(sender : UITapGestureRecognizer){
        
    }
    @objc func addContactAction(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
             let value = valueContentView?.content
            let jsonData = value!.data(using: .utf8)!
             let value_data = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            let store = CNContactStore()
            store.requestAccess(for: .contacts) { (granted, err) in
                if err != nil{
                    print("Failed request access")
                    return
                }
                if granted{
                    // Creating a new contact
                    let newContact = CNMutableContact()
                    newContact.givenName = value_data.fullNameContact!
                    let email = CNLabeledValue(label: CNLabelHome, value: "\(value_data.emailContact!)" as NSString)
                    newContact.emailAddresses = [email]
                    let homeAddress = CNMutablePostalAddress()
                    homeAddress.city = value_data.addressContact!
                    newContact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]
                    newContact.phoneNumbers = [CNLabeledValue(
                        label:CNLabelPhoneNumberiPhone,
                        value:CNPhoneNumber(stringValue:value_data.phoneContact!))]
                    
                    
                    // Saving contact
                    let saveRequest = CNSaveRequest()
                    saveRequest.add(newContact, toContainerWithIdentifier:nil)
                    do{
                        try store.execute(saveRequest)
                        let alert = UIAlertController(title: "", message: "Saved", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in })
                        alert.addAction(okAction)
                        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                        
                        
                    }
                    catch{
                        let alert = UIAlertController(title: "Message", message: "Contact already exists", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in })
                        alert.addAction(okAction)
                        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                        
                        print(error)
                    }
                }
                else
                {
                    print("access deni")
                }
                
            }
        }
    }
    @objc func emailAction(sender : UITapGestureRecognizer){
        if let data = codable {
             let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
                        let value = valueContentView?.content
                       let jsonData = value!.data(using: .utf8)!
                        let value_data = try? JSONDecoder().decode(EmailModel.self, from: jsonData)
            let email = value_data?.email ?? ""
            let objectEmail = value_data?.objectEmail ?? ""
            let messageEmail = value_data?.messageEmail ?? ""
            let value_email = "mailto:\(email)?subject=\(objectEmail)&body=\(messageEmail)"
            if let url = URL(string: value_email) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    @objc func wifiAction(sender : UITapGestureRecognizer){
        if let url = URL(string:"App-Prefs:root=WIFI") {
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    @objc func locationAction(sender : UITapGestureRecognizer){
        if let data = codable {
             let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
                                   let value = valueContentView?.content
                                  let jsonData = value!.data(using: .utf8)!
                                   let value_data = try? JSONDecoder().decode(LocationModel.self, from: jsonData)
            let lat = Float(value_data!.latitude ?? 0)
            let lng = Float(value_data!.longtitude ?? 0)
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(lng))
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Place here"
            mapItem.openInMaps(launchOptions: options)
        }
    }
    @objc func eventAction(sender : UITapGestureRecognizer){
        if let data = codable {
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: data)
                                   let value = valueContentView?.content
                                  let jsonData = value!.data(using: .utf8)!
                                   let value_data = try? JSONDecoder().decode(EventModel.self, from: jsonData)
            let eventStore : EKEventStore = EKEventStore()
            // 'EKEntityTypeReminder' or 'EKEntityTypeEvent'
            eventStore.requestAccess(to: .event) { (granted, error) in
                
                if (granted) && (error == nil) {
                    print("granted \(granted)")
                    
                    let event:EKEvent = EKEvent(eventStore: eventStore)
                    
                    event.title = value_data!.title
                    print(value_data?.beginTime)
                    event.startDate = TimeHelper.getDateTime(timeString: value_data!.beginTime!) ?? Date()
                   
                    event.endDate = TimeHelper.getDateTime(timeString: value_data!.endTime!) ?? Date()
                    event.notes = value_data?.description ?? ""
                    event.location = value_data?.location ?? ""
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    do {
                        try eventStore.save(event, span: .thisEvent)
                        
                        
                        DispatchQueue.main.async(execute: {
                            UIApplication.shared.registerForRemoteNotifications()
                            guard let url = URL(string: "calshow://") else { return }
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        })
                    } catch let error as NSError {
                        print("failed to save event with error : \(error)")
                    }
                    
                }
                else{
                    
                }
            }
        }
    }
    @objc func actionImgCreateViewTap(sender : UITapGestureRecognizer){
        if let data = codable {
          
            self.delegate?.cellCodable(codable: data)

        }
    }
}
