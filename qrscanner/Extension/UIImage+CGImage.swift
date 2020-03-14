//
//  UIImage+CGImage.swift
//  qrscanner
//
//  Created by Mac10 on 3/14/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//
import UIKit
extension UIImage {
   func toCGImage() -> CGImage? {
      if let mCiImage = CIImage(image: self){
        return mCiImage.cgImage
      }
      return nil
   }
}
