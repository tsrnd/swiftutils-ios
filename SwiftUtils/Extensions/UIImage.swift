//
//  UIImage.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/23/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

extension UIImage {
  public func scaleToSize(newSize: CGSize, aspectFill: Bool = false) -> UIImage {
    let scaleFactorWidth = newSize.width / size.width
    let scaleFactorHeight = newSize.height / size.height
    let scaleFactor = aspectFill ? max(scaleFactorWidth, scaleFactorHeight) : min(scaleFactorWidth, scaleFactorHeight)
    
    var scaledSize = size
    scaledSize.width *= scaleFactor
    scaledSize.height *= scaleFactor
    
    UIGraphicsBeginImageContextWithOptions(scaledSize, false, UIScreen.mainScreen().scale)
    let scaledImageRect = CGRect(x: 0.0, y: 0.0, width: scaledSize.width, height: scaledSize.height)
    drawInRect(scaledImageRect)
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage
  }
    
    func imageByApplyingAlpha(alpha : CGFloat) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0);
        
        let ctx = UIGraphicsGetCurrentContext();
        let area = CGRectMake(0, 0, self.size.width, self.size.height);
        
        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -area.size.height);
        
        CGContextSetBlendMode(ctx, CGBlendMode.Multiply);
        
        CGContextSetAlpha(ctx, alpha);
        
        CGContextDrawImage(ctx, area, self.CGImage);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return newImage;
    }

}
