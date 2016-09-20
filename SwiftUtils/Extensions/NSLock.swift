//
//  NSLock.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

extension NSLock {
    public func sync(_ block: () -> Void) {
        let locked = `try`()
        block()
        if locked {
            unlock()
        }
    }
}
