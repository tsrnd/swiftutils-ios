//
//  Range.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/9/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

extension Range {
    public static func random(from min: Int, to max: Int) -> CountableRange<Int>? {
        let lower = Int.random(min: min, max: max)
        let upper = Int.random(min: lower, max: max)
        return CountableRange<Int>(uncheckedBounds: (lower: lower, upper: upper))
    }
}
