//
//  UserDefaults+Key.swift
//  qrscanner
//
//  Created by Mac10 on 4/24/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation

extension UserDefaults {
  enum Key: String {
    case reviewWorthyActionCount
    case lastReviewRequestAppVersion
    case pressNotNow
     case pressNoThanks
     case pressSubmitFiveStar
    case pressSubmitLittleFiveStar
      case flagRating
  }

  func integer(forKey key: Key) -> Int {
    return integer(forKey: key.rawValue)
  }
    func bool(forKey key: Key) -> Bool {
       return bool(forKey: key.rawValue)
     }
  func string(forKey key: Key) -> String? {
    return string(forKey: key.rawValue)
  }

  func set(_ integer: Int, forKey key: Key) {
    set(integer, forKey: key.rawValue)
  }

  func set(_ object: Any?, forKey key: Key) {
    set(object, forKey: key.rawValue)
  }
}
