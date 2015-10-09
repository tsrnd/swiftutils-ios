//
//  CGPoint.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/8/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension CGPoint {
  var isZero: Bool {
    return x == 0 && y == 0
  }
}

// +=
public func +=(inout point: CGPoint, other: CGPoint) -> CGPoint {
  point.x += other.x
  point.y += other.y
  return point
}

public func +=(inout point: CGPoint, size: CGSize) -> CGPoint {
  point.x += size.width
  point.y += size.height
  return point
}

public func +=(inout point: CGPoint, offset: CGVector) -> CGPoint {
  point.x += offset.dx
  point.y += offset.dy
  return point
}

// -=
public func -=(inout point: CGPoint, other: CGPoint) -> CGPoint {
  point.x -= other.x
  point.y -= other.y
  return point
}

public func -=(inout point: CGPoint, size: CGSize) -> CGPoint {
  point.x -= size.width
  point.y -= size.height
  return point
}

public func -=(inout point: CGPoint, offset: CGVector) -> CGPoint {
  point.x -= offset.dx
  point.y -= offset.dy
  return point
}

// +
public func +(point: CGPoint, other: CGPoint) -> CGPoint {
  var result = point
  result.x += other.x
  result.y += other.y
  return result
}

public func +(point: CGPoint, size: CGSize) -> CGPoint {
  var result = point
  result.x += size.width
  result.y += size.height
  return result
}

public func +(point: CGPoint, offset: CGVector) -> CGPoint {
  var result = point
  result.x += offset.dx
  result.y += offset.dy
  return result
}

// -
public func -(point: CGPoint, offset: CGPoint) -> CGPoint {
  var result = point
  result.x -= offset.x
  result.y -= offset.y
  return result
}

public func -(point: CGPoint, size: CGSize) -> CGPoint {
  var result = point
  result.x -= size.width
  result.y -= size.height
  return result
}

public func -(point: CGPoint, offset: CGVector) -> CGPoint {
  var result = point
  result.x -= offset.dx
  result.y -= offset.dy
  return result
}

extension CGSize {
  public var isZero: Bool {
    return width <= 0 || height <= 0
  }
}

// MARK: CGSize operators

public func +=(inout size: CGSize, offset: CGVector) {
  size.width += offset.dx
  size.height += offset.dy
}

public func -=(inout size: CGSize, offset: CGVector) {
  size.width -= offset.dx
  size.height -= offset.dy
}

public func *=(inout size: CGSize, k: CGFloat) {
  size.width *= k
  size.height *= k
}

public func +(size: CGSize, offset: CGVector) -> CGSize {
  var result = size
  result.width += offset.dx
  result.height += offset.dy
  return result
}

public func -(size: CGSize, offset: CGVector) -> CGSize {
  var result = size
  result.width -= offset.dx
  result.height -= offset.dy
  return result
}

public func *(size: CGSize, k: CGFloat) -> CGSize {
  var result = size
  result.width *= k
  result.height *= k
  return result
}

public enum MathError: ErrorType {
  case DivisionByZero
}
public func /(size: CGSize, k: CGFloat) throws -> CGSize {
  guard k != 0 else {
    throw MathError.DivisionByZero
  }
  var result = size
  result.width /= k
  result.height /= k
  return result
}

// MARK: CGVector operators

public prefix func -(u: CGVector) -> CGVector {
  return CGVector(dx: -u.dx, dy: -u.dy)
}

public func ==(u: CGVector, v: CGVector) -> Bool {
  return u.dx == v.dx && u.dy == v.dy
}

public func +(u: CGVector, v: CGVector) -> CGVector {
  return CGVector(dx: u.dx + v.dx, dy: u.dy + v.dy)
}

public func -(u: CGVector, v: CGVector) -> CGVector {
  return CGVector(dx: u.dx - v.dx, dy: u.dy - v.dy)
}

public func *(u: CGVector, k: CGFloat) -> CGVector {
  return CGVector(dx: u.dx * k, dy: u.dy * k)
}

public func /(u: CGVector, k: CGFloat) throws -> CGVector {
  guard k != 0 else {
    throw MathError.DivisionByZero
  }
  return CGVector(dx: u.dx / k, dy: u.dy / k)
}

public func *(u: CGVector, v: CGVector) -> CGFloat {
  return u.dx * v.dy + u.dy * v.dx
}
