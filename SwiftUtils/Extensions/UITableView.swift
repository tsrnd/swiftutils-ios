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
  
  public func makeSeparatorInsetsZero() {
    separatorInset = UIEdgeInsetsZero
    layoutMargins = UIEdgeInsetsZero
  }
  
  public func registerCellNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewCell.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellReuseIdentifier: name)
  }
  
  public func registerCellClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewCell.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forCellReuseIdentifier: name)
  }
  
  public func registerHeaderFooterNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewHeaderFooterView.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forHeaderFooterViewReuseIdentifier: name)
  }
  
  public func registerHeaderFooterClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewHeaderFooterView.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forHeaderFooterViewReuseIdentifier: name)
  }
  
  public func dequeueCell<T: UITableViewCell>(aClass: T) -> T {
    return dequeueReusableCellWithIdentifier(String(aClass)) as! T
  }
  
  public func dequeueCell<T: UITableViewCell>(aClass: T, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableCellWithIdentifier(String(aClass), forIndexPath: indexPath) as! T
  }
  
  public func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(aClass: T) -> T {
    return dequeueReusableHeaderFooterViewWithIdentifier(String(aClass)) as! T
  }
}

extension UITableViewCell {
  public func makeSeparatorInsetsZero() {
    separatorInset = UIEdgeInsetsZero
    layoutMargins = UIEdgeInsetsZero
  }
}