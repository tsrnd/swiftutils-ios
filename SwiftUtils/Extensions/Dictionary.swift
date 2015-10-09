//
//  Dictionary.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension Dictionary {
  public var allKeys: [Key] {
    return Array(keys)
  }
  
  public var allValues: [Value] {
    return Array(values)
  }
  
  public mutating func updateValues(dic: [Key : Value]?) {
    if let dic = dic {
      dic.enumerate({ (e) -> Void in
        self[e.0] = e.1
      })
    }    
  }
  
  public func map<U, V>(trans: Element -> (U, V)?) -> [U : V] {
    var mapped = [U : V]()
    forEach { (e) -> () in
      if let e = trans(e) {
        mapped[e.0] = e.1
      }
    }
    return mapped
  }
  
  func has(key: Key) -> Bool {
    return indexForKey(key) != nil
  }
  
  mutating func shift() -> (Key, Value?)? {
    if let key = keys.first {
      return (key, removeValueForKey(key))
    }
    return nil
  }
}