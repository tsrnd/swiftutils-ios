//
//  UIBarButtonItem.swift
//  SwiftUtils
//
//  Created by Thua Ha on 4/7/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(
        badge: String?,
        image: UIImage?,
        badgeTextColor : UIColor = UIColor.whiteColor(),
        badgeColor : UIColor = UIColor.redColor(),
        badgeFont : UIFont = UIFont.systemFontOfSize(UIFont.smallSystemFontSize()),
        target: AnyObject?,
        action: Selector
        )
    {
        let button = UIButton(type: .Custom)
        button.setBackgroundImage(image, forState: .Normal)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        button.sizeToFit()
        
        let badgeLabel = UILabel(badgeText: badge ?? "", textColor: badgeTextColor, color: badgeColor, font: badgeFont)
        button.addSubview(badgeLabel)
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .Top, relatedBy: .Equal, toItem: button, attribute: .Top, multiplier: 1, constant: 0))
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: button, attribute: .Trailing, multiplier: 1, constant: -5))
        if nil == badge {
            badgeLabel.hidden = true
        }
        badgeLabel.tag = UIBarButtonItem.badgeTag
        
        self.init(customView: button)
        
    }
    
    convenience init(
        badge: String?,
        title: String?,
        textColor : UIColor = UIColor.blackColor(),
        badgeTextColor : UIColor = UIColor.whiteColor(),
        badgeColor : UIColor = UIColor.redColor(),
        font: UIFont = UIFont.systemFontOfSize(UIFont.smallSystemFontSize()),
        badgeFont: UIFont = UIFont.systemFontOfSize(UIFont.smallSystemFontSize()),
        target: AnyObject?,
        action: Selector
        )
    {
        let button = UIButton(type: .Custom)
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.textColor = textColor
        button.titleLabel?.font = font
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        button.sizeToFit()
        
        let badgeLabel = UILabel(badgeText: badge ?? "", textColor: badgeTextColor, color: badgeColor, font: badgeFont)
        button.addSubview(badgeLabel)
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .Top, relatedBy: .Equal, toItem: button, attribute: .Top, multiplier: 1, constant: 0))
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: button, attribute: .Trailing, multiplier: 1, constant: -5))
        if nil == badge {
            badgeLabel.hidden = true
        }
        badgeLabel.tag = UIBarButtonItem.badgeTag
        
        self.init(customView: button)
        
    }
    
    var badgeLabel: UILabel? {
        return customView?.viewWithTag(UIBarButtonItem.badgeTag) as? UILabel
    }
    
    var badgedButton: UIButton? {
        return customView as? UIButton
    }
    
    var badgeString: String? {
        get { return badgeLabel?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) }
        set {
            if let badgeLabel = badgeLabel {
                badgeLabel.text = nil == newValue ? nil : "  \(newValue!)  "
                badgeLabel.hidden = nil == newValue
            }
        }
    }
    
    var badgedTitle: String? {
        get { return badgedButton?.titleForState(.Normal) }
        set { badgedButton?.setTitle(newValue, forState: .Normal); badgedButton?.sizeToFit() }
    }
    
    private static let badgeTag = 7373
}
