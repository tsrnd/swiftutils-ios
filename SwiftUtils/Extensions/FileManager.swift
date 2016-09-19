//
//  FileManager.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/23/15.
//  Copyright © 2015 DaoNV. All rights reserved.
//

import Foundation

extension FileManager {
    public var homeDir: String! {
        return NSHomeDirectory()
    }

    public var homeUrl: URL! {
        return URL(fileURLWithPath: homeDir, isDirectory: true)
    }

    public var docDir: String! {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }

    public var docUrl: URL! {
        return URL(fileURLWithPath: docDir, isDirectory: true)
    }

    public var libraryDir: String! {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
    }

    public var libraryUrl: URL! {
        return URL(fileURLWithPath: libraryDir, isDirectory: true)
    }

    public var appSupportDir: String! {
        return NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first
    }

    public var appSupportUrl: URL! {
        return URL(fileURLWithPath: appSupportDir, isDirectory: true)
    }

    public var tmpDir: String {
        return NSTemporaryDirectory()
    }

    public var tmpUrl: URL {
        return URL(fileURLWithPath: tmpDir, isDirectory: true)
    }

    public func addSkipBackupAttribute(toItemAtPath path: String) {
        let sysRep = (path as NSString).fileSystemRepresentation
        setxattr(sysRep, "com.apple.MobileBackup", nil, 1, 0, 0)
    }

    public func skipBackup() {
        addSkipBackupAttribute(toItemAtPath: docDir)
        addSkipBackupAttribute(toItemAtPath: libraryDir)
    }
}
