//
//  Dictionary.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension Dictionary {
    public var allKeys: [Key] {
        return Array(keys)
    }

    public var allValues: [Value] {
        return Array(values)
    }

    public mutating func update(values: [Key: Value]?) {
        if let values = values {
            for (key, value) in values {
                self[key] = value
            }
        }
    }

    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }

    public func toJSONData() -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            return nil
        }
    }
}
