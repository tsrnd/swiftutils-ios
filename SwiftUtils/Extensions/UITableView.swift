//
//  UITableView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension UITableView {
  override public var delaysContentTouches: Bool {
    didSet {
      for view in subviews {
        if let scroll = view as? UIScrollView {
          scroll.delaysContentTouches = delaysContentTouches
        }
        break
      }
    }
  }
}