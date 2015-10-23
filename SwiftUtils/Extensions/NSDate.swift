//
//  NSDate.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

public class DateFormat {
  public static var DateTime24           = "yyyy-MM-dd HH:mm:ss"
  public static var DateTime12           = "yyyy-MM-dd hh:mm:ss a"
  public static var DateTime24NoSeconds  = "yyyy-MM-dd HH:mm"
  public static var DateTime12NoSeconds  = "yyyy-MM-dd hh:mm a"
  public static var Date                 = "yyyy-MM-dd"
  public static var Time24               = "HH:mm:ss"
  public static var Time12               = "hh:mm:ss a"
  public static var TimeNoSeconds24      = "HH:mm"
  public static var TimeNoSeconds12      = "hh:mm a"
  public static var UTC                  = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
  public static var UTCShort             = "yyyy-MM-dd'T'HH:mm:ss"
}

extension NSTimeInterval {
  public var hourMinute: String! {
    var mm = Int(trunc(self / 60))
    let hh = mm/60
    mm %= 60
    if hh < 1 {
      return "\(mm)m"
    } else {
      return "\(hh)h\(mm)m"
    }
  }
  
  public var clock: String {
    var duration = Int(self)
    let hour = duration / 3600
    duration %= 3600
    let mins = duration / 60
    duration %= 60
    let secs = duration
    let suffix = String(format: "%@%d:%@%d", mins > 9 ? "" : "0", mins, secs > 9 ? "" : "0", secs)
    let prefix = hour > 0 ? String(format: "%@%d:", hour > 9 ? "" : "0" , hour) : ""
    return String(format: "%@%@", prefix, suffix)
  }
}

extension NSDate {
  public static func dateFromString(str: String!, format: String!, localized: Bool) -> NSDate? {
    let fmt = NSDateFormatter.fromFormat(format)
    fmt.timeZone = localized ? NSTimeZone.localTimeZone() : NSTimeZone.UTCTimeZone()
    return fmt.dateFromString(str)
  }
  
  public func stringWithFormat(format: String!, localized: Bool) -> String! {
    let fmt = NSDateFormatter.fromFormat(format)
    fmt.timeZone = localized ? NSTimeZone.localTimeZone() : NSTimeZone.UTCTimeZone()
    return fmt.stringFromDate(self)
  }
  
  public func relativeDateString(info: [String : String]? = nil) -> String {
    var titles: [String : String] = [
      "year" : " year",
      "month" : " month",
      "week" : " week",
      "day" : "d",
      "hour" : "h",
      "minute" : "m",
      "yesterday" : "yesterday",
      "now" : "now"
    ]
    titles.updateValues(info)
    let units: NSCalendarUnit = [.Day, .WeekOfYear, .Month, .Year]
    let options = NSCalendarOptions()
    let now = NSDate()
    if timeIntervalSinceDate(now) > 0 {
      return ""
    }
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    let comps = NSCalendar.currentCalendar().components(units, fromDate: self, toDate: NSDate(), options: options)
    if comps.year > 0 {
      let s = comps.year == 1 ? "" : "s"
      return "\(comps.year)year\(s) ago"
    }
    else if comps.month > 0 {
      let s = comps.month == 1 ? "" : "s"
      return "\(comps.month)month\(s) ago"
    }
    else if (comps.weekOfYear > 0) {
      let s = comps.weekOfYear == 1 ? "" : "s"
      return "\(comps.weekOfYear)week\(s) ago"
    }
    else if (comps.day > 0) {
      if comps.day > 1 {
        let s = comps.day == 1 ? "" : "s"
        return "\(comps.day)d\(s) ago"
      }
      else {
        return "yesterday"
      }
    }
    else {
      if comps.hour > 0 {
        let s = comps.hour == 1 ? "" : "s"
        return "\(comps.hour)h\(s) ago"
      }
      else {
        if comps.minute > 0 {
          let s = comps.minute == 1 ? "" : "s"
          return "\(comps.minute)m\(s) ago"
        }
        else {
          return "now"
        }
      }
    }
  }
}

extension NSTimeZone {
  public static func UTCTimeZone() -> NSTimeZone {
    return NSTimeZone(abbreviation: "UTC")!
  }
}

var fmts = [String : NSDateFormatter]()
let lock = NSLock()
extension NSDateFormatter {
  public static func fromFormat(format: String!) -> NSDateFormatter! {
    lock.lock()
    var fmt: NSDateFormatter!
    if let existFmt = fmts[format] {
      fmt = existFmt
    } else {
      fmt = NSDateFormatter()
      fmt.dateFormat = format
      fmts[format] = fmt
    }
    lock.unlock()
    return fmt
  }
}