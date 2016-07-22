//
//  AF+Inspectable+View.swift
//
//  AFViewExtension: Version 4.0.1
//
//  Created by Melvin Rivera on 7/24/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//  https://github.com/melvitax/AFViewHelper
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable public class AFInspectableView :UIView {

    
    // MARK: Border
    
    /**
    The layer border color
    */
    @IBInspectable override var borderColor: UIColor {
        get {
            return layer.borderColor == nil ? UIColor.clearColor() : UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
    
    /**
     The layer border width
     */
    @IBInspectable override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // MARK: Corner Radius
    
    /**
    The layer corner radius
    */
    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    // MARK: Shadow
    
    /**
    The shadow color of the layer
    */
    @IBInspectable override var shadowColor: UIColor {
        get {
            return layer.shadowColor == nil ? UIColor.clearColor() : UIColor(CGColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.CGColor
        }
    }
    
    
    /**
     The shadow offset of the layer
     */
    @IBInspectable override var shadowOffset:CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /**
     The shadow opacity of the layer
     
     - Returns: Float
     */
    @IBInspectable override var shadowOpacity:Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /**
     The shadow radius of the layer
     
     - Returns: CGFloat
     */
    @IBInspectable override var shadowRadius:CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }


}
