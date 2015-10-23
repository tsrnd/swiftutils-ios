//
//  UICollectionView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/22/15.
//  Copyright © 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

extension UICollectionView {
  public func registerCellNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UICollectionViewCell.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellWithReuseIdentifier: name)
  }
  
  public func registerCellClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UICollectionViewCell.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forCellWithReuseIdentifier: name)
  }
  
  public func registerHeaderNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UIView.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
  }
  
  public func registerHeaderClass(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UIView.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
  }
  
  public func registerFooterNib(aClass: AnyClass) {
    if aClass.isSubclassOfClass(UIView.self) == false {
      return
    }
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
  }
  
  public func registerFooterClass(aClass: AnyClass)
  {
    if aClass.isSubclassOfClass(UIView.self) == false {
      return
    }
    let name = String(aClass)
    registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
  }
}
