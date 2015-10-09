//
//  String+Utils.swift
//  SwiftUtils
//
//  Created by DaoNV on 6/10/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

public typealias JSObject = [String : AnyObject]
public typealias JSArray = [JSObject]

internal func regex(pattern: String, ignoreCase: Bool = false) -> NSRegularExpression? {
  var options = NSRegularExpressionOptions.DotMatchesLineSeparators.rawValue
  if ignoreCase {
    options = NSRegularExpressionOptions.CaseInsensitive.rawValue | options
  }
  let regex: NSRegularExpression?
  do {
    regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions(rawValue: options))
  } catch {
    return nil
  }
  return regex
}