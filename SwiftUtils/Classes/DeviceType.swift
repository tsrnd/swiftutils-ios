//
//  DeviceType.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import UIKit

typealias JSObject = [String: AnyObject]
typealias JSArray  = [JSObject]

public enum ScreenType {
    case phone4
    case phone5
    case phone6
    case phone6p
    case pad
    case padPro

    public var size: CGSize {
        switch self {
        case .phone4:
            return CGSize(width:  320, height:  480)
        case .phone5:
            return CGSize(width:  320, height:  568)
        case .phone6:
            return CGSize(width:  375, height:  667)
        case .phone6p:
            return CGSize(width:  414, height:  736)
        case .pad:
            return CGSize(width:  768, height: 1024)
        case .padPro:
            return CGSize(width: 1024, height: 1366)
        }
    }
}

extension UIScreen {
    public var type: ScreenType {
        switch bounds.size {
        case ScreenType.phone4.size:
            return .phone4
        case ScreenType.phone5.size:
            return .phone5
        case ScreenType.phone6.size:
            return .phone6
        case ScreenType.phone6p.size:
            return .phone6p
        default:
            fatalError("not supported screen size")
        }
    }
}

extension UIDevice {
    public var isPhone: Bool {
        return userInterfaceIdiom == .phone
    }

    public var isPad: Bool {
        return userInterfaceIdiom == .pad
    }
}
