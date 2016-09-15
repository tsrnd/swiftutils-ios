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
            return object(forKey: key as! KeyType)
        }
        set {
            if let value: AnyObject = newValue {
                setObject(value as! ObjectType, forKey: key as! KeyType)
            } else {
                removeObject(forKey: key as! KeyType)
            }
        }
    }
}
