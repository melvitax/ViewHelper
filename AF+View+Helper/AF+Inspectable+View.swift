//
//  AF+Inspectable+View.swift
//
//  AF-View-Helper: Version 2.11
//
//  Created by Melvin Rivera on 7/24/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//  https://github.com/melvitax/AFViewHelper
//

import Foundation
import UIKit

@IBDesignable
class InspectableView :UIView {
   
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var layoutMargin: CGFloat = 0 {
        didSet {
            self.layoutMargins = UIEdgeInsets(top: layoutMargin, left: layoutMargin,
                bottom: layoutMargin, right: layoutMargin)
        }
    }
    
    @IBInspectable var shadow : UIColor = UIColor.clearColor() {
        didSet {
            layer.shadowColor = shadow.CGColor
        }
    }
    
    
    @IBInspectable var shadowOffset : CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius : CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
    }

}
