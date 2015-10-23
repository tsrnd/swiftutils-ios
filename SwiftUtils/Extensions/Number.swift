//
//  Number.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/23/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public func ^(x: Int, y: Int) -> Int {
  return Int(pow(Double(x), Double(y)))
}

public func ^(x: Float, y: Float) -> Float {
  return pow(x, y)
}

public func ^(x: CGFloat, y: CGFloat) -> CGFloat {
  return pow(x, y)
}

public func ^(x: Double, y: Double) -> Double {
  return pow(x, y)
}

// MARK: Int_FloatingPointType

public func +(x: Int, y: Float) -> Float {
  return Float(x) + y
}

public func +(x: Float, y: Int) -> Float {
  return x + Float(y)
}

public func +=(inout x: Float, y: Int) -> Float {
  x = x + y
  return x
}

public func -(x: Int, y: Float) -> Float {
  return Float(x) - y
}

public func -(x: Float, y: Int) -> Float {
  return x - Float(y)
}

public func -=(inout x: Float, y: Int) -> Float {
  x = x - y
  return x
}

public func *(x: Int, y: Float) -> Float {
  return Float(x) * y
}

public func *(x: Float, y: Int) -> Float {
  return x * Float(y)
}

public func *=(inout x: Float, y: Int) -> Float {
  x = x * y
  return x
}

public func /(x: Int, y: Float) -> Float {
  return Float(x) / y
}

public func /(x: Float, y: Int) -> Float {
  return x / Float(y)
}

public func /=(inout x: Float, y: Int) -> Float {
  x = x / y
  return x
}

// MARK: Int_CGFloat

public func +(x: Int, y: CGFloat) -> CGFloat {
  return CGFloat(x) + y
}

public func +(x: CGFloat, y: Int) -> CGFloat {
  return x + CGFloat(y)
}

public func -(x: Int, y: CGFloat) -> CGFloat {
  return CGFloat(x) - y
}

public func -(x: CGFloat, y: Int) -> CGFloat {
  return x - CGFloat(y)
}

public func *(x: Int, y: CGFloat) -> CGFloat {
  return CGFloat(x) * y
}

public func *(x: CGFloat, y: Int) -> CGFloat {
  return x * CGFloat(y)
}

public func /(x: Int, y: CGFloat) -> CGFloat {
  return CGFloat(x) / y
}

public func /(x: CGFloat, y: Int) -> CGFloat {
  return x / CGFloat(y)
}

// MARK: Int_Double

public func +(x: Int, y: Double) -> Double {
  return Double(x) + y
}

public func +(x: Double, y: Int) -> Double {
  return x + Double(y)
}

public func +=(inout x: Double, y: Int) -> Double {
  x = x + y
  return x
}

public func -(x: Int, y: Double) -> Double {
  return Double(x) - y
}

public func -(x: Double, y: Int) -> Double {
  return x - Double(y)
}

public func -=(inout x: Double, y: Int) -> Double {
  x = x - y
  return x
}

public func *(x: Int, y: Double) -> Double {
  return Double(x) * y
}

public func *(x: Double, y: Int) -> Double {
  return x * Double(y)
}

public func *=(inout x: Double, y: Int) -> Double {
  x = x * y
  return x
}

public func /(x: Int, y: Double) -> Double {
  return Double(x) / y
}

public func /(x: Double, y: Int) -> Double {
  return x / Double(y)
}

public func /=(inout x: Double, y: Int) -> Double {
  x = x / y
  return x
}

// MARK: Float_CGFloat

public func +(x: Float, y: CGFloat) -> CGFloat {
  return CGFloat(x) + y
}

public func +(x: CGFloat, y: Float) -> CGFloat {
  return x + CGFloat(y)
}

public func +=(inout x: CGFloat, y: Float) -> CGFloat {
  x = x + y
  return x
}

public func -(x: Float, y: CGFloat) -> CGFloat {
  return CGFloat(x) - y
}

public func -(x: CGFloat, y: Float) -> CGFloat {
  return x - CGFloat(y)
}

public func -=(inout x: CGFloat, y: Float) -> CGFloat {
  x = x - y
  return x
}

public func *(x: Float, y: CGFloat) -> CGFloat {
  return CGFloat(x) * y
}

public func *(x: CGFloat, y: Float) -> CGFloat {
  return x * CGFloat(y)
}

public func *=(inout x: CGFloat, y: Float) -> CGFloat {
  x = x * y
  return x
}

public func /(x: Float, y: CGFloat) -> CGFloat {
  return CGFloat(x) / y
}

public func /(x: CGFloat, y: Float) -> CGFloat {
  return x / CGFloat(y)
}

public func /=(inout x: CGFloat, y: Float) -> CGFloat {
  x = x / y
  return x
}

// MARK: Float_Double

public func +(x: Float, y: Double) -> Double {
  return Double(x) + y
}

public func +(x: Double, y: Float) -> Double {
  return x + Double(y)
}

public func +=(inout x: Double, y: Float) -> Double {
  x = x + y
  return x
}

public func -(x: Float, y: Double) -> Double {
  return Double(x) - y
}

public func -(x: Double, y: Float) -> Double {
  return x - Double(y)
}

public func -=(inout x: Double, y: Float) -> Double {
  x = x - y
  return x
}

public func *(x: Float, y: Double) -> Double {
  return Double(x) * y
}

public func *(x: Double, y: Float) -> Double {
  return x * Double(y)
}

public func *=(inout x: Double, y: Float) -> Double {
  x = x * y
  return x
}

public func /(x: Float, y: Double) -> Double {
  return Double(x) / y
}

public func /(x: Double, y: Float) -> Double {
  return x / Double(y)
}

public func /=(inout x: Double, y: Float) -> Double {
  x = x / y
  return x
}

// MARK: CGFloat_Double

public func +(x: CGFloat, y: Double) -> Double {
  return Double(x) + y
}

public func +(x: Double, y: CGFloat) -> Double {
  return x + Double(y)
}

public func +=(inout x: Double, y: CGFloat) -> Double {
  x = x + y
  return x
}

public func -(x: CGFloat, y: Double) -> Double {
  return Double(x) - y
}

public func -(x: Double, y: CGFloat) -> Double {
  return x - Double(y)
}

public func -=(inout x: Double, y: CGFloat) -> Double {
  x = x - y
  return x
}

public func *(x: CGFloat, y: Double) -> Double {
  return Double(x) * y
}

public func *(x: Double, y: CGFloat) -> Double {
  return x * Double(y)
}

public func *=(inout x: Double, y: CGFloat) -> Double {
  x = x * y
  return x
}

public func /(x: CGFloat, y: Double) -> Double {
  return Double(x) / y
}

public func /(x: Double, y: CGFloat) -> Double {
  return x / Double(y)
}

public func /=(inout x: Double, y: CGFloat) -> Double {
  x = x / y
  return x
}