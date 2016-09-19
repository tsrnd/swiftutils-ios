//
//  Float.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension Float {
    public var abs: Float {
        return Foundation.fabsf(self)
    }

    public var sqrt: Float {
        return Foundation.sqrt(self)
    }

    public var floor: Float {
        return Foundation.floor(self)
    }

    public var ceil: Float {
        return Foundation.ceil(self)
    }

    public var round: Float {
        return Foundation.round(self)
    }

    public func clamp(_ min: Float, _ max: Float) -> Float {
        return Swift.max(min, Swift.min(max, self))
    }

    public static func random(min: Float = 0, max: Float) -> Float {
        let diff = max - min
        let rand = Float(arc4random() % (UInt32(RAND_MAX) + 1))
        return ((rand / Float(RAND_MAX)) * diff) + min
    }
}
