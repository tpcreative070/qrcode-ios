//
//  TransferMultipleViewModel.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class TransferMultipleViewModel : TransferCashMultipleViewModelDeletegate , Codable  {
    
    var moneyView: String? {
        return money ?? ""
    }
    var countView: String? {
        return list.count.description
    }
    var money : String?
    var list = [String]()
    init() {
    }
}
