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

protocol TransferCashMultipleViewModelDeletegate {
    var moneyView : String? {get}
    var countView : String? {get}
}
