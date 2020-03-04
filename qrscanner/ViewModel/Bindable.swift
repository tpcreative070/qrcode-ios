//
//  Bindable.swift
//  qrscanner
//
//  Created by Mac10 on 3/2/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

class Bindable<T> {
  typealias Listener = ((T) -> Void)
  var listener: Listener?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ v: T) {
    self.value = v
  }
  
  /**
   bind event for uitexfield or custom event
  */
  func bind(_ listener: Listener?) {
    self.listener = listener
  }
  
  /**
   bind and fire event
  */
  func bindAndFire(_ listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
  /**
   unbinding
  */
  func unBind() {
    self.listener = nil
  }
}
