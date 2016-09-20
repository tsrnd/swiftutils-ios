//
//  NSRegularExpression.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/9/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    public convenience init?(pattern: String, ignoreCase: Bool = false) {
        let options: NSRegularExpression.Options = ignoreCase ? [.caseInsensitive] : []
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            return nil
        }
    }
}
