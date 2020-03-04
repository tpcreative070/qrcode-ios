//
//  TableViewCellViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class AnyObjectViewModel : Codable{
    
}
class TableViewCellViewModel : TbViewCellViewModelDelegate{
    var typeCode: String?
    var datetimeCreate: String?
    var content: String?
   var maxBinding: Bindable<Int> = Bindable(0)
     var codable: Codable = AnyObjectViewModel()
     var verified: (() -> ())?
     
     var errorMessages: Bindable<Dictionary<String, String>> = Bindable(Dictionary<String, String>())

}
