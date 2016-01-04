//
//  NSData.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension NSData {
  public var json: AnyObject? {
    do {
      return try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.AllowFragments)
    } catch {
      return nil
    }
  }
  
  public func string(encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
    return String(data: self, encoding: encoding)
  }
}