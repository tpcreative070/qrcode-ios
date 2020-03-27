//
//  AlertViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/26/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
import UIKit
class AlertViewModel : Codable , AlertViewModelDeletegate{
    var nameItemView: String{
        return name ?? ""
    }
    
    var checkShowView: Bool?{
        return check
    }
    var name : String?
    var check : Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    
}
