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

    public mutating func updateValues(dic: [Key: Value]?) {
        if let dic = dic {
            for (key, value) in dic {
                self[key] = value
            }
        }
    }

    public func hasKey(key: Key) -> Bool {
        return indexForKey(key) != nil
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
