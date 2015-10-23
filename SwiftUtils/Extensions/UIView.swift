//
//  UIView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public class IntrinsicContentView: UIView {
  public var intrinsicContentSizeEnabled = true
}

extension UIView {
  public func clear() {
    backgroundColor = UIColor.clearColor()
    for (_, sub) in subviews.enumerate() {
      sub.clear()
    }
  }
  
  public func setBorderWithColor(color: UIColor, width: CGFloat = 0.5) {
    layer.borderColor = color.CGColor
    layer.borderWidth = width
  }
  
  public func setShadowWithColor(color: UIColor, offset: CGSize = CGSizeZero, opacity: Float = 1.0, radius: CGFloat = 3.0) {
    layer.shadowColor = color.CGColor
    layer.shadowOffset = offset
    layer.shadowOpacity = opacity
    layer.shadowRadius = radius
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.mainScreen().scale
  }
  
  public func removeSubviewsConstraints() {
    removeConstraints(constraints.filter({ (c: NSLayoutConstraint) -> Bool in
      let first = c.firstItem as? UIView
      let second = c.secondItem as? UIView
      if (first == self && second == self) || (first == self && second == nil) || (first == nil && second == self) {
          return false
      }
      return true
    }))
    for sub in subviews {
      sub.translatesAutoresizingMaskIntoConstraints = false
      sub.removeAllConstraints()
    }
  }
  
  public func removeAllConstraints() {
    if let view = self as? IntrinsicContentView {
      if view.intrinsicContentSizeEnabled {
        return
      }
    }
    var parent = superview
    while parent != nil {
      for (_, c) in parent!.constraints.enumerate() {
        let first = c.firstItem as? UIView
        let second = c.secondItem as? UIView
        if first == self || second == self {
          parent!.removeConstraint(c)
        }
      }
      parent = parent!.superview
    }
    removeConstraints(constraints)
    let subviews = self.subviews
    for (_, sub) in subviews.enumerate() {
      sub.removeAllConstraints()
    }
  }
  
  public func addTopBorderWithColor(color: UIColor, lineWidth: CGFloat = 0.5, insets: UIEdgeInsets = UIEdgeInsetsZero) {
    let rect = CGRectMake(0, 0, frame.size.width, lineWidth)
    let border = UIView(frame: rect)
    border.backgroundColor = color
    border.autoresizingMask = ([.FlexibleWidth, .FlexibleBottomMargin])
    addSubview(border)
  }
  
  public func addBottomBorderWithColor(color: UIColor, lineWidth: CGFloat = 0.5, insets: UIEdgeInsets = UIEdgeInsetsZero) {
    let rect = CGRectMake(0, frame.size.height - lineWidth, frame.size.width, lineWidth)
    let border = UIView(frame: rect)
    border.backgroundColor = color
    border.autoresizingMask = ([.FlexibleWidth, .FlexibleTopMargin])
    addSubview(border)
  }
  
  public func addLeftBorderWithColor(color: UIColor, lineWidth: CGFloat = 0.5, insets: UIEdgeInsets = UIEdgeInsetsZero) {
    let rect = CGRectMake(0, 0, lineWidth, frame.size.height)
    let border = UIView(frame: rect)
    border.backgroundColor = color
    border.autoresizingMask = ([.FlexibleHeight, .FlexibleRightMargin])
    addSubview(border)
  }
  
  public func addRightBorderWithColor(color: UIColor, lineWidth: CGFloat = 0.5, insets: UIEdgeInsets = UIEdgeInsetsZero) {
    let rect = CGRectMake(frame.size.width - lineWidth, 0, lineWidth, frame.size.height)
    let border = UIView(frame: rect)
    border.backgroundColor = color
    border.autoresizingMask = ([.FlexibleHeight, .FlexibleLeftMargin])
    addSubview(border)
  }
}