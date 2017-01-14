//
//  ViewControllerAutoLayout.swift
//  ViewHelper: Version 4.2.2
//  Created by Melvin Rivera on 11/5/15.
//  https://github.com/melvitax/ViewHelper
//

import Foundation
import UIKit

extension UIViewController {
    
    
    /**
     Returns true if horizontal size class is compact
     */
    func horizontalSizeClassIsCompact() -> Bool
    {
        return traitCollection.horizontalSizeClass == .compact;
    }
    
    /**
     Returns true if vertical size class is compact
     */
    func verticalSizeClassIsCompact() -> Bool
    {
        return traitCollection.verticalSizeClass == .compact;
    }
    
}

