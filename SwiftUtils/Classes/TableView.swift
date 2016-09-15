//
//  TableView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/5/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

open class TableView: UITableView {
    open var allowHeaderViewsToFloat: Bool = false
    open var allowFooterViewsToFloat: Bool = false

    open func allowsHeaderViewsToFloat() -> Bool {
        return allowHeaderViewsToFloat
    }

    open func allowsFooterViewsToFloat() -> Bool {
        return allowFooterViewsToFloat
    }
}
