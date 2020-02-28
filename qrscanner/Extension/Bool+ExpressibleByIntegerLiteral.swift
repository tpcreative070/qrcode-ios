//
//  Bool+ExpressibleByIntegerLiteral.swift
//  screenrecorder
//
//  Created by phong070 on 2/12/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = value != 0
    }
}
