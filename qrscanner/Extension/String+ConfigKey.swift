//
//  String+ConfigKey.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
extension String {
    func infoForKey() -> String? {
        return (Bundle.main.infoDictionary?[self] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}

