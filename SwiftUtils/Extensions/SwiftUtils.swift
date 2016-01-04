//
//  Type.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public class SwiftUtils {
}

extension SwiftUtils {
  public class Constants {
    public static let kCFBundleDisplayName = "kCFBundleDisplayName"
    public static let kCFBundleName = "CFBundleName"
    
    public static let kAppName: String = {
      let info = NSBundle.mainBundle().infoDictionary!
      let display = info[kCFBundleDisplayName] as? String
      let name = info[kCFBundleName] as! String
      return display ?? name
    }()
  }
}

extension SwiftUtils {
  public class TypeAlias {
    public typealias JSObject = [String : AnyObject]
    public typealias JSArray = [JSObject]
  }
}