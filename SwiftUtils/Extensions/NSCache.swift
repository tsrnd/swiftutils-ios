//
//  NSCache.swift
//  SwiftUtils
//
//  Created by DaoNV on 8/23/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import Foundation
import UIKit

extension NSCache {
    public convenience init(name: String, totalCostLimit: Int = 0, countLimit: Int = 0) {
        self.init()
        self.name = name
        self.totalCostLimit = totalCostLimit
        self.countLimit = countLimit
    }
    
    public subscript(key: AnyObject) -> AnyObject? {
        set {
            if let value = newValue {
                (self as? NSCache<AnyObject, AnyObject>)?.setObject(value, forKey: key)
            } else {
                (self as? NSCache<AnyObject, AnyObject>)?.removeObject(forKey: key)
            }
        }
        
        get {
            return (self as? NSCache<AnyObject, AnyObject>)?.object(forKey: key)
        }
    
    }
}
