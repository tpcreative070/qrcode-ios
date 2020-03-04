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
    var listHistories : [ScannerViewModel] {get}
    var responseToView : ((String) ->())? {get set}
    var isSelected : Bindable<Bool> {get}
}

protocol ScannerViewModelDeletegate {
    var typeCode : String {get}
    var createdDateTime : String {get}
    var updatedDateTime : String{get}
    var isHistory : Int{get}
    var isSave : Int {get}
    var content : String {get}
    
}
protocol TableViewCellDelegate {
    func cellViewSelected(cell: TableViewCell)
    func cellViewSelected(cell: TableViewCell,action: EnumResponseToView)
    func cellViewSelected(cell: TableViewCell,countSelected : Int)
    func cellViewSelected(cell: Codable)
    func cellCodable(codable : Codable)
}
