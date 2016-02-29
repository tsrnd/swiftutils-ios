//
//  ArrayTests.swift
//  SwiftUtils
//
//  Created by DaoNV on 2/29/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class ArrayTests: XCTestCase {
  let origin: [Int] = {
    var numbers = [Int]()
    for i in 0...100000 {
      numbers.append(i)
    }
    return numbers
  }()
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testShuffled() {
    var shuffled: [Int]!
    self.measureBlock { () -> Void in
      shuffled = self.origin.shuffled
    }
    let test = { (a: Int, b: Int) -> Bool in
      return a < b
    }
    XCTAssertEqual(shuffled.sort(test), origin.sort(test), "sorted shuffled should equal to sorted origin")
  }
}
