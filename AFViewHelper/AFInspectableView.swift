//
//  AF+Inspectable+View.swift
//
//  AFViewExtension: Version 4.1.0
//
//  Created by Melvin Rivera on 7/24/14.
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
            setupView()
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
    
    // MARK: Inspectable properties
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    
    // MARK: Internal functions
    
    private func setupView(){
        let colors = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        self.setNeedsDisplay()
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    
    // MARK: Overrides ******************************************
    
    override public class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    
}
