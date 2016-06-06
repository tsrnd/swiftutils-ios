//
//  BoolTests.swift
//  SwiftUtils
//
//  Created by DaoNV on 6/6/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class BoolTests: XCTestCase {
  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testToggle() {
    var bool = true
    bool.toggle()
    XCTAssertFalse(bool)
  }
}
