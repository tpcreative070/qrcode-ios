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
    var listHistories : [QRCodeViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    var isSelected : Bindable<Bool> {get}
}

protocol QRCodeViewModelDeletegate {
    var typeCodeView : String {get}
    var createdDateTimeView : String {get}
    var updatedDateTimeView : String{get}
    var isHistoryView : Int{get}
    var isSaveView : Int {get}
    var contentView : String {get}
    
}
protocol TypeCodeViewModelDelegate {
    var nameView : String {get}
    var imgIconView : String{get}
}
protocol ScannerViewModelDelegate : BaseViewModel {
    var responseToView : ((String) ->())? {get set}
    var dictionaryList : [Int: ScannerEntityModel] {get}
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
   
   
}
protocol TypeCodeViewModelListDelegate {
       var list : [TypeCodeViewModel] {get}
       var responseToView : ((String) ->())? {get set}   
    
}
protocol TableViewCellDelegate {
    func cellViewSelected(cell: TableViewCell)
    func cellViewSelected(cell: TableViewCell,action: EnumResponseToView)
    func cellViewSelected(cell: TableViewCell,countSelected : Int)
    func cellViewSelected(cell: Codable)
    func cellCodable(codable : Codable)
}
