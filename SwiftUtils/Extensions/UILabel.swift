//
//  UILabel.swift
//  SwiftUtils
//
//  Created by Thua Ha on 4/7/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(
        badgeText: String,
        textColor: UIColor = UIColor.blackColor(),
        color: UIColor = UIColor.whiteColor(),
        font: UIFont = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        )
    {
        self.init()
        text = "  \(badgeText)  "
        self.textColor = textColor
        backgroundColor = color

        self.font = font
    
        
        layer.cornerRadius = font.pointSize * CGFloat(0.6)
        clipsToBounds = true
        
        translatesAutoresizingMaskIntoConstraints = false

    }
    
}
