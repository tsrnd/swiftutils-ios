//
//  Type.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public typealias JSObject = [String : AnyObject]
public typealias JSArray = [JSObject]

public let iPhone4 = (UIScreen.mainScreen().bounds.size.height == 480)
public let iPhone5 = (UIScreen.mainScreen().bounds.size.height == 568)
public let iPhone6 = (UIScreen.mainScreen().bounds.size.height == 667)
public let iPhone6s = (UIScreen.mainScreen().bounds.size.height == 1104)

public let kCFBundleDisplayName = "kCFBundleDisplayName"
public let kCFBundleName = "CFBundleName"

public var kAppName: String = {
  let info = NSBundle.mainBundle().infoDictionary!
  let display = info[kCFBundleDisplayName] as? String
  let name = info[kCFBundleName] as! String
  return display ?? name
}()

public class SwiftUtils {
}