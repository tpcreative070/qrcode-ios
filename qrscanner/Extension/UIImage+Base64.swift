//
//  Uiimage+Base64.swift
//  qrscanner
//
//  Created by phong070 on 4/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    public func toBase64(format: ImageFormat) -> String? {
        var imageData: Data?

        switch format {
        case .png:
            imageData = self.pngData()
        case .jpeg(let compression):
            imageData = self.jpegData(compressionQuality: compression)
        }

        return imageData?.base64EncodedString()
    }
}
