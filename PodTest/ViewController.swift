//
//  ViewController.swift
//  PodTest
//
//  Created by DaoNV on 9/21/16.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit
import SwiftUtils

class ViewController: UIViewController {
    var didShowPopup = false

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard didShowPopup == false else { return }
        didShowPopup = true
        let popup = PopupController()
        present(popup, animated: true) {
            NSLog("1")
            let vc = AlertController(title: "OK", message: "Huh?", preferredStyle: .alert)
            vc.level = .high
            vc.addAction("OK", style: .cancel, handler: nil)
            vc.present(from: self, animated: true, completion: {
                NSLog("2")
            })
        }
    }
}

class PopupController: UIViewController, AlertLevelProtocol {
    var level: AlertLevel = .normal

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }
}
