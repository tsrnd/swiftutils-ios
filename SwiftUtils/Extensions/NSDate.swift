//
//  NSDate.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

private var _defaultCalendar = NSCalendar.currentCalendar()

extension NSCalendar {
    public static func setDefaultCalendar(defaultCalendar: NSCalendar) {
        _defaultCalendar = defaultCalendar
    }

    public static func defaultCalendar() -> NSCalendar {
        return _defaultCalendar
    }
}

extension NSTimeZone {
    public class var UTC: NSTimeZone {
        return NSTimeZone(abbreviation: "UTC")!
    }
}

private var _defaultLocale = NSLocale.currentLocale()

extension NSLocale {
    public static func setDefaultLocale(defaultLocale: NSLocale) {
        _defaultLocale = defaultLocale
    }

    public static func defaultLocale() -> NSLocale {
        return _defaultLocale
    }
}

extension NSDateComponents {
    public convenience init(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, sec: Int = 0, nsec: Int = 0) {
        self.init()
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = sec
        self.nanosecond = nsec
        self.calendar = NSCalendar.defaultCalendar()
        self.timeZone = NSTimeZone.defaultTimeZone()
    }

    public convenience init(hour: Int, minute: Int, sec: Int = 0, nsec: Int = 0) {
        self.init()
        self.year = 0
        self.month = 0
        self.day = 0
        self.hour = hour
        self.minute = minute
        self.second = sec
        self.nanosecond = nsec
        self.calendar = NSCalendar.defaultCalendar()
        self.timeZone = NSTimeZone.defaultTimeZone()
    }
}
