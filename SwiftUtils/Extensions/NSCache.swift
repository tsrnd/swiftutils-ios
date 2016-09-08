//
//  NSCache.swift
//  SwiftUtils
//
//  Created by DaoNV on 8/23/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import Foundation

extension NSCache {
    public convenience init(name: String, totalCostLimit: Int = 0, countLimit: Int = 0) {
        self.init()
        self.name = name
        self.totalCostLimit = totalCostLimit
        self.countLimit = countLimit
    }

    public subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        set {
            if let value: AnyObject = newValue {
                setObject(value, forKey: key)
            } else {
                removeObjectForKey(key)
            }
        }
    }
}
