//
//  UITableView+Utils.swift
//  Zody
//
//  Created by DaoNV on 10/22/15.
//  Copyright © 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

extension UITableView {
  func makeSeparatorInsetsZero() {
    separatorInset = UIEdgeInsetsZero
    layoutMargins = UIEdgeInsetsZero
  }
  
  func registerCellNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewCell.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellReuseIdentifier: name)
  }
  
  func registerCellClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewCell.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forCellReuseIdentifier: name)
  }
  
  func registerHeaderFooterNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewHeaderFooterView.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forHeaderFooterViewReuseIdentifier: name)
  }
  
  func registerHeaderFooterClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UITableViewHeaderFooterView.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forHeaderFooterViewReuseIdentifier: name)
  }
}

extension UITableViewCell {
  func makeSeparatorInsetsZero() {
    separatorInset = UIEdgeInsetsZero
    layoutMargins = UIEdgeInsetsZero
  }
}
