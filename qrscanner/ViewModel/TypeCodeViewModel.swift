//
//  GenerateViewModel.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class TypeCodeViewModel : Codable , TypeCodeViewModelDelegate{
    var nameView: String{
        return name ?? ""
    }
    
    var imgIconView: String{
        return iconName ?? ""
    }
    
  var identify: Int?
  var name : String?
  var iconName: String?
  
  
  init(data: TypeCodeModel) {
    self.identify = data.identify
    self.name = data.name
    self.iconName = data.iconImage
   
  }
    
  var icon: UIImage {
    return UIImage(named: self.iconName!)!
  }
}
