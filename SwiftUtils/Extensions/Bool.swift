//
//  Bool.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/8/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension Bool {
    public mutating func toggle() {
        self = !self
    }

    public func toInt() -> Int {
        return self ? 1 : 0
    }
}
