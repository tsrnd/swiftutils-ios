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
        for i in (1 ..< count).reversed() {
            let j = Int.random(max: i - 1)
            swap(&self[i], &self[j])
        }
    }

    public func shuffled() -> [Element] {
        var array = self
        array.shuffle()
        return array
    }

    public func toJSONData() -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            return nil
        }
    }
}

extension Array where Element: Equatable {
    /// Removes and returns the first element is found.
    public mutating func remove(_ element: Element) -> Element? {
        guard let idx = index(of: element) else {
            return nil
        }
        return remove(at: idx)
    }
}
