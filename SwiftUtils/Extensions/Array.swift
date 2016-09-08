//
//  Array.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

extension Array {
    public mutating func shuffle() {
        for i in (1 ..< count).reverse() {
            let j = Int.random(max: i - 1)
            swap(&self[i], &self[j])
        }
    }

    public func shuffled() -> [Element] {
        var array = self
        array.shuffle()
        return array
    }

    public func toJSONData() -> NSData? {
        do {
            guard let json = self as? AnyObject else { return nil }
            return try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions.PrettyPrinted)
        } catch {
            return nil
        }
    }
}

extension Array where Element: Equatable {
    public mutating func remove(element: Element) -> Element? {
        guard let idx = indexOf(element) else {
            return nil
        }
        return removeAtIndex(idx)
    }
}
