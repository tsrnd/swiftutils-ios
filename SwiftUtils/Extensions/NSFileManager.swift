//
//  NSFileManager.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/23/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import Foundation

extension NSFileManager {
  public static var homeDir: String! {
    return NSHomeDirectory()
  }

  public static var homeUrl: NSURL! {
    return NSURL(fileURLWithPath: homeDir, isDirectory: true)
  }

  public static var docDir: String! {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
  }

  public static var docUrl: NSURL! {
    return NSURL(fileURLWithPath: docDir, isDirectory: true)
  }

  public static var libraryDir: String! {
    return NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first
  }

  public static var libraryUrl: NSURL! {
    return NSURL(fileURLWithPath: libraryDir, isDirectory: true)
  }

  public static var appSupportDir: String! {
    return NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true).first
  }

  public static var appSupportUrl: NSURL! {
    return NSURL(fileURLWithPath: appSupportDir, isDirectory: true)
  }

  public static var tmpDir: String {
    return NSTemporaryDirectory()
  }

  public static var tmpUrl: NSURL {
    return NSURL(fileURLWithPath: tmpDir, isDirectory: true)
  }

  public static func skipBackup(path: String) -> Bool {
    let fm = defaultManager()
    var isDir: ObjCBool = true
    if fm.fileExistsAtPath(path, isDirectory: &isDir) {
      if isDir {
        var success = true
        do {
          let urls = try fm.contentsOfDirectoryAtPath(path)
          for url in urls {
            success = success && skipBackup(url)
          }
          return success
        } catch { }
      } else {
        do {
          let url = NSURL(fileURLWithPath: path)
          try url.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
          return true
        } catch { }
      }
    }
    return false
  }

  public static func skipBackup() {
    skipBackup(docDir)
    skipBackup(libraryDir)
  }
}
