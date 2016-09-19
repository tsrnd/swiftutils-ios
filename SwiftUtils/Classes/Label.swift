//
//  Label.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/5/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

open class Label: UILabel {
    open var contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = contentInsets.inset(bounds)
        rect = super.textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        return contentInsets.inverse.inset(rect)
    }

    override open func drawText(in rect: CGRect) {
        super.drawText(in: contentInsets.inset(rect))
    }

    open override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += (contentInsets.left + contentInsets.right)
        size.height += (contentInsets.top + contentInsets.bottom)
        return size
    }
}
