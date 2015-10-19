//
//  Array.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension Array {
  public mutating func shuffle() {
    for var i = self.count - 1; i >= 1; i-- {
      let j = Int.random(max: i - 1)
      swap(&self[i], &self[j])
    }
  }
  
  public var shuffled: [Element] {
    var array = self
    array.shuffle()
    return array
  }
  
  public func map<T>(trans: Element -> T?) -> [T] {
    var mapped = [T]()
    forEach { (e) -> () in
      if let e = trans(e) {
        mapped.append(e)
      }
    }
    return mapped
  }
}