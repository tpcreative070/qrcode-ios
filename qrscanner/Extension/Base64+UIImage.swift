//
//  Base64+UIImage.swift
//  qrscanner
//
//  Created by phong070 on 4/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
extension String {
    func toImageFromBase64() -> UIImage? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return UIImage(data: data)
    }
}
