//
//  ViewController.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/31/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
  public var statusBarHidden = false {
    didSet {
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  public var statusBarStyle = UIStatusBarStyle.Default {
    didSet {
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  public var statusBarUpdateAnimation = UIStatusBarAnimation.None
  
  public var naviBarHidden = false {
    didSet {
      setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  public var naviBarStyle = UIBarStyle.Default
  
  var viewWillAppearAnimated = true
  var viewDidAppearAnimated = false
  var isViewAppear = false
  
  override init(nibName: String?, bundle: NSBundle?) {
    super.init(nibName: nibName, bundle: bundle)
    _init()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    _init()
  }
  
  func _init() {
    automaticallyAdjustsScrollViewInsets = false
  }
  
  public override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    viewWillAppearAnimated = animated
    setNeedsStatusBarAppearanceUpdate()
    navigationController?.setNavigationBarHidden(naviBarHidden, animated: animated)
  }
  
  public override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    viewDidAppearAnimated = animated
    isViewAppear = true
  }
  
  public override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    isViewAppear = false
  }
  
  public override func prefersStatusBarHidden() -> Bool {
    return statusBarHidden
  }
  
  public override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return statusBarStyle
  }
  
  public override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
    if viewWillAppearAnimated {
      return statusBarUpdateAnimation
    } else {
      return .None
    }
  }
}
