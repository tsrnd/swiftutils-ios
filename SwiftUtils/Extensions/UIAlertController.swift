//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

let kAppName: String = {
  let info = NSBundle.mainBundle().infoDictionary!
  let display = info["CFBundleDisplayName"] as? String
  let name = info["CFBundleName"] as? String
  return display ?? name ?? "ALERT"
}()

public func alert(title title: String? = kAppName, msg: String, from: UIViewController? = nil, handler:(() -> Void)? = nil) {
  let alert = UIAlertController(title: title?.localized, message: msg.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  let root = from ?? UIApplication.sharedApplication().delegate?.window??.rootViewController
  root?.presentViewController(alert, animated: true, completion: nil)
}

public func alert(error: NSError?, from: UIViewController? = nil, handler:(() -> Void)? = nil) {
  if let error = error {
    let alert = UIAlertController(title: kAppName.localized, message: error.localizedDescription.localized, preferredStyle: UIAlertControllerStyle.Alert)
    let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
      if let handler = handler {
        handler()
      }
    }
    alert.addAction(ok)
    let root = from ?? UIApplication.sharedApplication().delegate?.window??.rootViewController
    root?.presentViewController(alert, animated: true, completion: nil)
  }
}