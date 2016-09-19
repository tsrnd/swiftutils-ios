//
//  Double.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension Double {
    public var abs: Double {
        return Foundation.fabs(self)
    }

    public var sqrt: Double {
        return Foundation.sqrt(self)
    }

    public var floor: Double {
        return Foundation.floor(self)
    }

    public var ceil: Double {
        return Foundation.ceil(self)
    }

    public var round: Double {
        return Foundation.round(self)
    }

    public func clamp(_ min: Double, _ max: Double) -> Double {
        return Swift.max(min, Swift.min(max, self))
    }

    public static func random(min: Double = 0, max: Double) -> Double {
        let diff = max - min
        let rand = Double(arc4random() % (UInt32(RAND_MAX) + 1))
        return ((rand / Double(RAND_MAX)) * diff) + min
    }
}
