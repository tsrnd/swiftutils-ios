//
//  UICollectionView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/22/15.
//  Copyright © 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

extension UICollectionView {
  public func registerCellNib<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forCellWithReuseIdentifier: name)
  }
  
  public func registerCellClass<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forCellWithReuseIdentifier: name)
  }
  
  public func registerHeaderNib<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
  }
  
  public func registerHeaderClass<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
  }
  
  public func registerFooterNib<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    let nib = UINib(nibName: name, bundle: nil)
    registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
  }
  
  public func registerFooterClass<T: UICollectionViewCell>(aClass: T.Type) {
    let name = String(aClass)
    registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
  }
  
  public func dequeueCell<T: UICollectionViewCell>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableCellWithReuseIdentifier(String(aClass), forIndexPath: indexPath) as! T
  }
  
  public func dequeueHeader<T: UICollectionReusableView>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: String(aClass), forIndexPath: indexPath) as! T
  }
  
  public func dequeueFooter<T: UICollectionReusableView>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
    return dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: String(aClass), forIndexPath: indexPath) as! T
  }
}
