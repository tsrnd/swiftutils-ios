//
//  NSBundle.swift
//  SwiftUtils
//
//  Created by DaoNV on 2/27/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import Foundation

public let kCFBundleDisplayNameKey = "kCFBundleDisplayName"
public let kCFBundleNameKey = "CFBundleName"
public let kCFBundleShortVersionKey = "CFBundleShortVersionString"

extension NSBundle {
  public var name: String {
    let info = infoDictionary!
    let display = info[kCFBundleDisplayNameKey] as? String
    let name = info[kCFBundleNameKey] as! String
    return display ?? name
  }
  
  public var version: String {
    let info = infoDictionary!
    return info[kCFBundleVersionKey as String] as! String
  }
  
  public var build: String {
    let info = infoDictionary!
    return info[kCFBundleShortVersionKey] as! String
  }
}