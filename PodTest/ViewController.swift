//
//  ViewController.swift
//  PodTest
//
//  Created by DaoNV on 9/21/16.
//  Copyright © 2016 Astraler Technology. All rights reserved.
//

import UIKit
import SwiftUtils

class ViewController: UIViewController {
    var didShowPopup = false

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        guard didShowPopup == false else { return }
        didShowPopup = true
        let popup = PopupController()
        presentViewController(popup, animated: true) {
            NSLog("1")
            let vc = AlertController(title: "OK", message: "Huh?", preferredStyle: .Alert)
            vc.level = .High
            vc.addAction("OK", style: .Cancel, handler: nil)
            vc.present(from: self, animated: true, completion: {
                NSLog("2")
            })
        }
    }
}

class PopupController: UIViewController, AlertLevelProtocol {
    var level: AlertLevel = .Normal

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
    }
}
