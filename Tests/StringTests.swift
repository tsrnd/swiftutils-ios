//
//  StringTests.swift
//  SwiftUtils
//
//  Created by DaoNV on 7/28/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class StringTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initWithClass() {
        let clazz = String(UIViewController)
        XCTAssertEqual(clazz, "UIViewController")
    }

    func test_subscriptCharacter() {
        let str = "hello world"
        let sub: Character! = str[0]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "h")
    }

    func test_subscriptString() {
        let str = "hello world"
        let sub: String! = str[0]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "h")
    }

    func test_subscriptStringWithRange() {
        let str = "hello world"
        var sub: String!
        sub = str[0...1]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "he")
        sub = str[0...10]
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub, "hello world")
    }

    func test_stringByAppendingPathComponent() {
        let str = "http://google.com"
        var path: String
        path = str.stringByAppendingPathComponent("api/v3")
        XCTAssertEqual(path, "http://google.com/api/v3")
        path = str.stringByAppendingPathComponent("/api/v3")
        XCTAssertEqual(path, "http://google.com/api/v3")
        path = str.stringByAppendingPathComponent("/api/v3/")
        XCTAssertEqual(path, "http://google.com/api/v3")
    }

    func test_validate() {
        var email: String
        email = "supports@example.com"
        XCTAssertTrue(email.validate(String.Regex.Email2))
        email = "supports$@example.com"
        XCTAssertFalse(email.validate(String.Regex.Email2))
        email = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.com.vn"
        measureBlock {
            XCTAssertTrue(email.validate(String.Regex.Email2))
        }
    }

}
