//
//  AFViewControllerAutoLayout.swift
//  AFViewExtension: Version 4.0.0
//
//  Created by Melvin Rivera on 11/5/15.
//  Copyright © 2015 All Forces. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
     Returns true if layout direction is left to right
     */
    func layoutDirectionIsLeftToRight() -> Bool {
        return (UIApplication.sharedApplication().userInterfaceLayoutDirection == .LeftToRight)
    }
    
    /**
     Returns true if horizontal size class is compact
     */
    func horizontalSizeClassIsCompact() -> Bool
    {
        return traitCollection.horizontalSizeClass == .Compact;
    }
    
    /**
     Returns true if vertical size class is compact
     */
    func verticalSizeClassIsCompact() -> Bool
    {
        return traitCollection.verticalSizeClass == .Compact;
    }
    
}

