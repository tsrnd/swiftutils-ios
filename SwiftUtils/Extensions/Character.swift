//
//  Character.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/8/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

public extension Character {
  public func toInt () -> Int? {
    return Int(String(self))
  }
}