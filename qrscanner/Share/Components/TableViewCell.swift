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
    let backGroundView : UIView = {
        let view = UIView()
        //        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let backGroundView1 : UIView = {
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
        view.image = UIImage(named: "ic_generate")
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
        self.lbCreatedDate.text = String(view.createdDateTimeView)
        self.lbContent.text = view.contentView
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
        if view.typeCodeView.uppercased() == LanguageKey.Url{
            let jsonData = view.contentView.data(using: .utf8)!
            let urlData = try! JSONDecoder().decode(UrlModel.self, from: jsonData)
            configView(viewModel: UrlViewModel(url: urlData.url!))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Email{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(EmailModel.self, from: jsonData)
            configView(viewModel: EmailViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Text{
            let jsonData = view.contentView.data(using: .utf8)!
            let urlData = try! JSONDecoder().decode(TextModel.self, from: jsonData)
            configView(viewModel: TextViewModel(text: urlData.text!))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Message{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(MessageModel.self, from: jsonData)
            configView(viewModel: MessageViewModel(data: MessageModel(to: data.to!, message: data.message!)))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Location{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
            configView(viewModel: LocationViewModel(data: LocationModel(latitude: data.latitude!, longtitude: data.longtitude!, query: data.query!)))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Event{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(EventModel.self, from: jsonData)
            configView(viewModel: EventViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Contact{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(ContactModel.self, from: jsonData)
            configView(viewModel: ContactViewModel(data: data))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Telephone{
            let jsonData = view.contentView.data(using: .utf8)!
            let data = try! JSONDecoder().decode(PhoneModel.self, from: jsonData)
            configView(viewModel: PhoneViewModel(phone: data))
        }
        if view.typeCodeView.uppercased() == LanguageKey.Wifi{
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
    lazy  var urlBg: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleLbl1 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var valueTxt1: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var valueTxt2: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var valueTxt3: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var valueTxt4: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    lazy var valueTxt5: ICTextFieldNoneIcon = {
        let view = ICTextFieldNoneIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = AppConstants.ALPHA_DISBALE
        
        return view
    }()
    var bgView1: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var bgView2: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var clipboardView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.GRAY_LIGHT_90
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var searchImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_search")
        return view
    }()
    lazy var titleLbl2 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var urlImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_language")
        return view
    }()
    
    lazy var titleLabel3 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleLabel4 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleLabel5 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var titleLabel6 : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var clipboardImage : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_copy")
        return view
    }()
    lazy var clipboardLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Clipboard"
        return view
    }()
    func configView(viewModel : UrlViewModelDelegate){
        self.titleLbl1.text = "Url"
        self.titleLbl2.text = "Url"
        self.titleLabel3.text = "Search"
        self.valueTxt1.text = viewModel.urlTxtView
    }
    /*text*/
    lazy var textImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_textsms")
        return view
    }()
    
    func configView(viewModel : TextViewModelDelegate){
        self.titleLbl1.text = "Text"
        self.titleLbl2.text = "Text"
        self.titleLabel3.text = "Search"
        self.valueTxt1.text = viewModel.textTxtView
    }
    /*phone*/
    lazy var phoneImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_phone")
        return view
    }()
    
    func configView(viewModel : PhoneViewModelDelegate){
        self.titleLbl1.text = "Phone"
        self.titleLbl2.text = "Phone"
        self.valueTxt1.text = viewModel.phoneTxtView
    }
    /*email*/
    lazy var emailImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_email")
        return view
    }()
    
    func configView(viewModel : EmailViewModelDelegate){
        self.titleLbl1.text = "To"
        self.titleLbl2.text = "Subject"
        self.titleLabel3.text = "Message"
        self.titleLabel4.text = "Email"
        
        self.valueTxt1.text = viewModel.toTxtView
        self.valueTxt2.text = viewModel.subjectView
        self.valueTxt3.text = viewModel.messageView
    }
    /*wifi*/
    lazy var wifiImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_wifi")
        return view
    }()
    
    func configView(viewModel : WifiViewModelDelegate){
        self.titleLbl1.text = "SSID"
        self.titleLbl2.text = "Password"
        self.titleLabel3.text = "Network Encryption"
        self.titleLabel4.text = "Hidden"
        self.titleLabel5.text = "Wifi"
        
        self.valueTxt1.text = viewModel.ssidView
        self.valueTxt2.text = viewModel.passwordView
        self.valueTxt3.text = viewModel.networkView
        if viewModel.hiddenView {
        self.valueTxt4.text = "true"
        }
        if !(viewModel.hiddenView) {
        self.valueTxt4.text = "false"
        }

    }
    /*contact*/
    lazy var contactImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_contact_calendar")
        return view
    }()
    
    func configView(viewModel : ContactViewModel){
        self.titleLbl1.text = "Fullname "
        self.titleLbl2.text = "Address"
        self.titleLabel3.text = "Phone"
        self.titleLabel4.text = "Email"
        self.titleLabel5.text = "AddressBook"
        
        self.valueTxt1.text = viewModel.fullnameView
        self.valueTxt2.text = viewModel.addressView
        self.valueTxt3.text = viewModel.phoneView
        self.valueTxt4.text = viewModel.emailView
        
    }
    /*location*/
    lazy var locationImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_location")
        return view
    }()
    
    func configView(viewModel : LocationViewModel){
        self.titleLbl1.text = "Latitude "
        self.titleLbl2.text = "Longtitude"
        self.titleLabel3.text = "Query"
        self.titleLabel4.text = "Location"
        
        self.valueTxt1.text = viewModel.latView
        self.valueTxt2.text = viewModel.longView
        self.valueTxt3.text = viewModel.query
        
    }
    /*message*/
    lazy var smsImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_textsms")
        return view
    }()
    
    func configView(viewModel : MessageViewModel){
        self.titleLbl1.text = "To "
        self.titleLbl2.text = "Message"
        self.titleLabel3.text = "SMS"
        
        self.valueTxt1.text = viewModel.toView
        self.valueTxt2.text = viewModel.messageView
        
    }
    /*calendar*/
    lazy var eventImg : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = AppColors.COLOR_ACCENT
        view.image = UIImage(named: "ic_event")
        return view
    }()
    
    func configView(viewModel : EventViewModel){
        self.titleLbl1.text = "Title "
        self.titleLbl2.text = "Location"
        self.titleLabel3.text = "Description"
        self.titleLabel4.text = "Begin Time"
        self.titleLabel5.text = "End Time"
        self.titleLabel6.text = "Calendar"
        
        
        
        self.valueTxt1.text = viewModel.titleView
        self.valueTxt2.text = viewModel.locationView
        self.valueTxt3.text = viewModel.descriptionView
        self.valueTxt4.text = viewModel.beginView
        self.valueTxt5.text = viewModel.endView
        
        
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
