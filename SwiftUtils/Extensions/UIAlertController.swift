//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

public class AlertController: UIAlertController {
  public func present(from from: UIViewController? = nil) {
    if let from = from {
      if from.presentedViewController == nil {
        from.presentViewController(self, animated: true, completion: nil)
      }
    } else if let root = UIApplication.sharedApplication().delegate?.window??.rootViewController {
      if root.presentedViewController == nil {
        root.presentViewController(self, animated: true, completion: nil)
      }
    }
  }
  
  public func dismiss(completion: (() -> Void)? = nil) {
    dismissViewControllerAnimated(true, completion: completion)
  }
}

public func alert(title title: String? = SwiftUtils.Constants.kAppName.localized, msg: String, from vc: UIViewController? = nil, handler:(() -> Void)? = nil) -> UIAlertController {
  let alert = AlertController(title: title?.localized, message: msg.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  alert.present(from: vc)
  return alert
}

public func alert(error: NSError, from vc: UIViewController? = nil, handler:(() -> Void)? = nil) -> UIAlertController {
  let alert = AlertController(title: SwiftUtils.Constants.kAppName.localized, message: error.localizedDescription.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  alert.present(from: vc)
  return alert
}