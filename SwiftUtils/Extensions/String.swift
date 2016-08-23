//
//  String.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/7/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

extension String {
    public init(aClass: AnyClass) {
        let name = NSStringFromClass(aClass).componentsSeparatedByString(".").last!
        self.init(name)
    }

    public subscript(index: Int) -> Character? {
        let range = startIndex.advancedBy(index)
        if range < startIndex || range > endIndex {
            return nil
        }
        return self[range]
    }

    public subscript(index: Int) -> String? {
        let range = startIndex.advancedBy(index)
        if let char: Character = self[range] {
            return String(char)
        }
        return nil
    }

    public subscript(range: Range<Int>) -> String? {
        let start = startIndex.advancedBy(range.startIndex, limit: endIndex)
        let end = startIndex.advancedBy(range.endIndex, limit: endIndex)
        if start < startIndex || end > endIndex {
            return nil
        }
        return self[start..<end]
    }

    public var length: Int {
        return self.characters.count
    }

    public var capitalized: String {
        return capitalizedString
    }

    // Regex
    public func matches(pattern: String, ignoreCase: Bool = false) -> [NSTextCheckingResult]? {
        if let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) {
            let range = NSRange(location: 0, length: length)
            return regex.matchesInString(self, options: [], range: range).map { $0 }
        }
        return nil
    }

    public func contains(pattern: String, ignoreCase: Bool = false) -> Bool? {
        if let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) {
            let range = NSRange(location: 0, length: self.characters.count)
            return regex.firstMatchInString(self, options: [], range: range) != nil
        }
        return nil
    }

    public func replace(pattern: String, withString replacementString: String, ignoreCase: Bool = false) -> String? {
        if let regex = NSRegularExpression.regex(pattern, ignoreCase: ignoreCase) {
            let range = NSRange(location: 0, length: self.characters.count)
            return regex.stringByReplacingMatchesInString(self, options: [], range: range, withTemplate: replacementString)
        }
        return nil
    }

    public func insert(index: Int, _ string: String) -> String {
        if index > length {
            return self + string
        } else if index < 0 {
            return string + self
        }
        return self[0 ..< index]! + string + self[index ..< length]!
    }

    public func trimmedLeft(characterSet set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        if let range = rangeOfCharacterFromSet(set.invertedSet) {
            return self[range.startIndex ..< endIndex]
        }
        return ""
    }

    public func trimmedRight(characterSet set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        if let range = rangeOfCharacterFromSet(set.invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
            return self[startIndex ..< range.endIndex]
        }
        return ""
    }

    public func trimmed(characterSet set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        return trimmedLeft(characterSet: set).trimmedRight(characterSet: set)
    }

    public func trimmedLeftCJK() -> String {
        var text = self
        while text.characters.first == Character("\n") || text.characters.first == Character(" ") {
            text = text.substringFromIndex(text.startIndex.advancedBy(1))
        }
        return text
    }

    public func trimmedRightCJK() -> String {
        var text = self
        while text.characters.last == Character("\n") || text.characters.last == Character(" ") {
            text = text.substringToIndex(text.endIndex.advancedBy(-1))
        }
        return text
    }

    public func trimmedCJK() -> String {
        return trimmedLeftCJK().trimmedRightCJK()
    }

    public static func random(length len: Int = 0, charset: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        let len = len < 1 ? len : Int.random(max: 16)
        var result = String()
        let max = charset.length - 1
        for _ in 0 ..< len {
            result += String(charset[Int.random(min: 0, max: max)]!)
        }
        return result
    }

    public var intValue: Int {
        return Int(self) ?? 0
    }

    public var doubleValue: Double {
        return Double(self) ?? 0.0
    }

    public var floatValue: Float {
        return Float(self) ?? 0.0
    }

    public var boolValue: Bool {
        return (self as NSString).boolValue
    }

    public func replaceKeysByValues(values: [String: AnyObject]) -> String {
        let str: NSMutableString = NSMutableString(string: self)
        let range = NSRange(location: 0, length: str.length)
        for (key, value) in values {
            str.replaceOccurrencesOfString(key, withString: "\(value)", options: [.CaseInsensitiveSearch, .LiteralSearch], range: range)
        }
        return str as NSString as String
    }

    public func stringByAppendingPathComponent(str: String) -> String {
        var s1: String! = self
        while s1.hasSuffix("/") {
            s1 = s1[0...s1.length - 2]
        }
        var s2: String! = str
        while s2.hasPrefix("/") {
            s2 = s2[1...length - 1]
        }
        while s2.hasSuffix("/") {
            s2 = s2[0...s2.length - 2]
        }
        return "\(s1)/\(s2)"
    }

    /// The file-system path components of the receiver. (read-only)
    public var pathComponents: [String] {
        return (self as NSString).pathComponents
    }

    // The last path component of the receiver. (read-only)
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }

    // The path extension, if any, of the string as interpreted as a path. (read-only)
    public var pathExtension: String {
        return (self as NSString).pathExtension
    }

    // Initializes an NSURL object with a provided URL string. (read-only)
    public var url: NSURL? {
        return NSURL(string: self)
    }

    // The host, conforming to RFC 1808. (read-only)
    public var host: String {
        if let url = url, host = url.host {
            return host
        }
        return ""
    }

    // Returns a localized string, using the main bundle.
    public func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    // MARK: Validation
    public struct Regex {
        static let Number = "^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"
        static let Name = "[a-zA-Z\\s]+"
        static let Email1 = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        static let Email2 = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        static let Password = "[a-zA-Z0-9_]+"
        static let URL = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    }

    public func validate(regex: String) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex)
        return pre.evaluateWithObject(self)
    }
}

// MARK: Character
extension Character {
    public var intValue: Int {
        return (String(self) as NSString).integerValue
    }
}

// MARK: NSMutableAttributedString
extension NSMutableAttributedString {
    public func appendString(string: String, attributes: [String: AnyObject]) {
        let attStr = NSAttributedString(string: string, attributes: attributes)
        appendAttributedString(attStr)
    }
}

// MARK: NSMutableParagraphStyle
extension NSMutableParagraphStyle {
    public class func defaultStyle() -> NSMutableParagraphStyle! {
        let style = NSMutableParagraphStyle()
        let defaultStyle = NSParagraphStyle.defaultParagraphStyle()
        style.lineSpacing = defaultStyle.lineSpacing
        style.paragraphSpacing = defaultStyle.paragraphSpacing
        style.alignment = defaultStyle.alignment
        style.firstLineHeadIndent = defaultStyle.firstLineHeadIndent
        style.headIndent = defaultStyle.headIndent
        style.tailIndent = defaultStyle.tailIndent
        style.lineBreakMode = defaultStyle.lineBreakMode
        style.minimumLineHeight = defaultStyle.minimumLineHeight
        style.maximumLineHeight = defaultStyle.maximumLineHeight
        style.baseWritingDirection = defaultStyle.baseWritingDirection
        style.lineHeightMultiple = defaultStyle.lineHeightMultiple
        style.paragraphSpacingBefore = defaultStyle.paragraphSpacingBefore
        style.hyphenationFactor = defaultStyle.hyphenationFactor
        style.tabStops = defaultStyle.tabStops
        style.defaultTabInterval = defaultStyle.defaultTabInterval
        return style
    }
}
