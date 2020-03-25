//
//  Protocols.swift
//  qrscanner
//
//  Created by phong070 on 2/28/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
protocol IntroCellDelegate {
    func onSkip()
    func onStart(isStart : Bool)
}
protocol BaseViewModel {
    var showLoading: Bindable<Bool> { get }
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?  { get set }
}
protocol TransferCashMultipleViewModelDeletegate {
    var moneyView : String? {get}
    var countView : String? {get}
}
protocol HeaderSectionDelegate {
    func cellSectionSelected(codable : Codable)
}
protocol TbViewCellViewModelDelegate  {
    var typeCode: String? { get }
    var datetimeCreate: String? { get }
    var content : String? {get}
    var errorMessages: Bindable<Dictionary<String, String>>{ get }
    var codable : Codable {get}
    var verified : (() -> ())? {get set}
    var maxBinding: Bindable<Int> {get}
}

protocol ScannersViewModelListDeletegate  : BaseViewModel{
    var navigate: (() -> ())?  { get }
    var listHistories : [HistoryViewModelList] {get}
    var responseToView : ((String) ->())? {get set}
    var isSelected : Bindable<Bool> {get}
}
protocol HistoryViewModelListDeletegate  : BaseViewModel{
    var navigate: (() -> ())?  { get }
    var listHistories : [HistoryViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    var isSelected : Bindable<Bool> {get}
}
protocol ContentViewModelListDeletegate  : BaseViewModel{
    var navigate: (() -> ())?  { get }
    var listContent : [ContentViewModel] {get}
    var responseToView : ((String) ->())? {get set}
}
protocol SaveViewModelListDeletegate  : BaseViewModel{
    var navigate: (() -> ())?  { get }
    var listSave : [SaveViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    var isSelected : Bindable<Bool> {get}
}
protocol GenerateViewModelDeletegate {
    var typeCodeView : String {get}
    var createdDateTimeView : String {get}
    var updatedDateTimeView : String{get}
    var isHistoryView : Bool{get}
    var isSaveView : Bool {get}
    var bookMark : Bool {get}
    var contentView : String {get}
    var checkShowView : Bool? {get}
}
protocol ContentViewModelDeletegate {
    var typeCodeView : String {get}
    var contentView : String {get}
    
}
protocol TypeCodeViewModelDelegate {
    var nameView : String {get}
    var imgIconView : String{get}
}
protocol ScannerViewModelDelegate : BaseViewModel {
    var responseToView : ((String) ->())? {get set}
    var dictionaryList : [Int: ContentModel] {get}
    var resultScan : Bindable<String> {get}
    var transactionIdBinding : Bindable<String> {get}
    var cameraBinding : Bindable<Bool>{get set}
}

protocol GenerateViewModelDelegate  {
    var navigate: (() -> ())?  { get set }
    var responseToView : ((String) ->())? {get set}
    var to: String? { get }
    var message: String? { get }
    var url: String? {get}
    var text: String? {get}
    var email: String? {get}
    var objectEmail: String? {get}
    var messageEmail: String? {get}
    var phoneTelephone: String? {get}
    var fullNameContact: String? {get}
    var addressContact: String? {get}
    var phoneContact: String? {get}
    var emailContact: String? {get}
    var typeCode : String{get}
    
    var toBinding : Bindable<String> {get}
    var messageBinding : Bindable<String> {get}
    var urlBinding : Bindable<String> {get}
    var textBinding : Bindable<String> {get}
    var objectEmailBinding : Bindable<String> {get}
    var messageEmailBinding : Bindable<String> {get}
    var phoneTelephoneBinding : Bindable<String> {get}
    var fullNameContactBinding : Bindable<String> {get}
    var addressContactBinding : Bindable<String> {get}
    var phoneContactBinding : Bindable<String> {get}
    var emailContactBinding : Bindable<String> {get}
     var latBinding : Bindable<Float> {get}
     var lonBinding : Bindable<Float> {get}
     var queryBinding : Bindable<String> {get}
     var titleEventBinding : Bindable<String> {get}
    var locationEventBinding : Bindable<String> {get}
    var descriptionEventBinding : Bindable<String> {get}
    var beginTimeEventBinding : Bindable<Date> {get}
    var endTimeEventBinding : Bindable<Date> {get}
    var ssidBinding : Bindable<String> {get}
    var passwordBinding : Bindable<String> {get}
    var protectBinding : Bindable<String> {get}
}
protocol ResultViewModelDelegate  {
    var navigate: (() -> ())?  { get set }
    var responseToView : ((String) ->())? {get set}
    
    
    
}
protocol TypeCodeViewModelListDelegate {
    var listTypeCondeViewModel : [TypeCodeViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    
}
protocol TableViewCellDelegate {
    func cellViewSelected(cell: TableViewCell)
    func cellViewLongSelected(cell: TableViewCell)
    
    func cellViewSelected(cell: TableViewCell,action: EnumResponseToView)
    func cellViewSelected(cell: TableViewCell,countSelected : Int)
    func cellViewSelected(cell: Codable)
    func cellViewLongSelected(cell: Codable)
    
    func cellCodable(codable : Codable)
}
protocol DateTimePickerDelegate {
    func cancelPicker()
    func donePicker()
}
/*Url Protocol*/
protocol UrlViewModelDelegate {
    var urlTxtView : String{get}
    
}
protocol DetailViewModelListDelegate {
    var listurl : [UrlViewModel] {get}
    var listtext : [TextViewModel] {get}
    var listphone : [PhoneViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    
}
/*Text Protocol*/

protocol TextViewModelDelegate {
    var textTxtView : String{get}
    
}
/*Phone Protocol*/

protocol PhoneViewModelDelegate {
    var phoneTxtView : String{get}
    
}
protocol ValuePushViewModelDelegate {
    var toTxtView : String{get}
    var subjectView : String{get}
    var messageView : String{get}
}
/*email protocol*/
protocol EmailViewModelDelegate {
    var toTxtView : String{get}
    var subjectView : String{get}
    var messageView : String{get}
}
/*wifi protocol*/
protocol WifiViewModelDelegate {
    var ssidView : String{get}
    var passwordView : String{get}
    var networkView : String{get}
    var hiddenView : Bool{get}
    
}
/*contact protocol*/
protocol ContactViewModelDelegate {
    var fullnameView : String{get}
    var addressView : String{get}
    var phoneView : String{get}
    var emailView : String{get}
    
}
/*location protocol*/
protocol LocationViewModelDelegate {
    var latView : String{get}
    var longView : String{get}
    var queryView : String{get}
    
}
/*message protocol*/
protocol MessageViewModelDelegate {
    var toView : String{get}
    var messageView : String{get}
}
/*event protocol*/
protocol EventViewModelDelegate {
    var titleView : String{get}
    var locationView : String{get}
    var descriptionView : String{get}
    var beginView : String{get}
    var endView : String{get}
    
}
