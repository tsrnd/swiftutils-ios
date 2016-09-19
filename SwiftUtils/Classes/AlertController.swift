//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

public enum AlertLevel: Int {
    case low
    case normal
    case high
    case require
}

open class AlertController: UIAlertController {
    open var level: AlertLevel = .high

    open func addAction(title: String?, style: UIAlertActionStyle = UIAlertActionStyle.default, handler: (() -> Void)? = nil) {
        var actionHandler: ((UIAlertAction) -> Void)?
        if let handler = handler {
            actionHandler = { (action: UIAlertAction) -> Void in
                handler()
            }
        }
        let action = UIAlertAction(title: title, style: style, handler: actionHandler)
        addAction(action)
    }

    open func present(animated: Bool = true, completion: (() -> Void)? = nil) {
        guard
            let delegate = UIApplication.shared.delegate,
            let window = delegate.window,
            let root = window?.rootViewController
        else {
            assertionFailure("Main window has no root controller to present \(self).")
            return
        }
        present(from: root, animated: animated, completion: completion)
    }

    open func present(from: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        assert(from.isViewLoaded, "\(from) view is not loaded.")

        guard let popup = from.presentedViewController else {
            from.present(self, animated: animated, completion: completion)
            return
        }

        guard let vc = popup as? AlertController else {
            if level >= type(of: popup).level {
                popup.dismiss(animated: animated, completion: { () -> Void in
                    self.present(from: from, animated: animated, completion: completion)
                })
            }
            return
        }

        if level > vc.level {
            vc.dismiss(animated: animated, completion: { () -> Void in
                self.present(
                    from: from,
                    animated: animated,
                    completion: completion
                )
            })
        }
    }

    open class func alert(
        message: String,
        title: String = Bundle.main.name.localized(),
        level: AlertLevel = .normal,
        handler: (() -> Void)? = nil
    ) -> AlertController {
        let alert = AlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        return alert
    }

    open class func alert(
        error: NSError,
        title: String = Bundle.main.name.localized(),
        level: AlertLevel = .normal,
        handler: (() -> Void)? = nil
    ) -> AlertController {
        let alert = AlertController.alert(
            message: error.localizedDescription.localized(),
            title: title,
            level: level,
            handler: handler
        )
        alert.addAction(title: "OK".localized(), style: .cancel, handler: handler)
        return alert
    }
}

extension UIViewController {
    open class var level: AlertLevel { return .normal }
}

public func == (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

public func > (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue > rhs.rawValue
}

public func >= (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

public func < (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <= (lhs: AlertLevel, rhs: AlertLevel) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}
