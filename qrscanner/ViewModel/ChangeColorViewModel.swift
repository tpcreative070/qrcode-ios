//
//  ChangeColorViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 4/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class ChangeColorViewModel : ChangeColorViewModelDelegate , Codable {
    
    var isSelectedView: Bool{
        return isSelected ?? false
    }
    var imgQRView: String {
        return self.icon ?? ""
    }
    var icon : String?
    var position : Int?
    var isSelected : Bool?
    init(icon : String, position : Int, isSelected : Bool) {
        self.icon = icon
        self.position = position
        self.isSelected = isSelected
    }
    init() {
        
    }
}
