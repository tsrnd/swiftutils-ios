//
//  Bool.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/8/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension Bool {
  public mutating func toggle() -> Bool {
    self = !self
    return self
  }
}