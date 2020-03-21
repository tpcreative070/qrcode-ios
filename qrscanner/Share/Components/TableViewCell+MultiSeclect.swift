//
//  TableViewCell+MultiSeclect.swift
//  qrscanner
//
//  Created by Mac10 on 3/19/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
public typealias Index = Int
public typealias Closure = () -> Void
public typealias SelectionClosure = (Index, String) -> Void
public typealias MultiSelectionClosure = ([Index], [String]) -> Void

