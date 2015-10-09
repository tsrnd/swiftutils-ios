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
  public func resetSubviewsAutolayout() {
    removeConstraints(constraints)
    let subviews = self.subviews
    for sub in subviews {
      sub.translatesAutoresizingMaskIntoConstraints = false
      sub.resetSubviewsAutolayout()
    }
  }
  
  public func removeAllConstraints() {
    if let view = self as? IntrinsicContentView {
      if view.intrinsicContentSizeEnabled {
        return
      }
    }
    removeConstraints(constraints)
    let subviews = self.subviews
    for sub in subviews {
      sub.removeAllConstraints()
    }
  }
  
  public func removeAllSubviewsConstraints() {
    let subviews = self.subviews
    for sub in subviews {
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