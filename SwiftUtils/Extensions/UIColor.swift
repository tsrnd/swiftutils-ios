//
//  UIColor.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension UIColor {
  public convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
    let red   = max(0, min(CGFloat(r) / 255, 1))
    let green = max(0, min(CGFloat(g) / 255, 1))
    let blue  = max(0, min(CGFloat(b) / 255, 1))
    let alpha = max(0, min(a, 1))
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  public convenience init(w: CGFloat, a: CGFloat = 1) {
    self.init(white: w, alpha: a)
  }
}