//
//  AFViewExtension.swift
//
//  AFViewExtension: Version 3.0.0
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//  https://github.com/melvitax/AFViewHelper
//

import UIKit
import QuartzCore



extension UIView {
    
    // MARK: Border
    
    /**
    Returns layer border color
    
    :returns: UIColor
    */
    func borderColor() -> UIColor { return UIColor(CGColor: layer.borderColor!) }
    
    /**
     Sets layer border color
     
     :returns: self UIView
     */
    func borderColor(borderColor: UIColor) -> UIView {
        layer.borderColor = borderColor.CGColor
        return self
    }
    
    /**
     Returns layer border width
     
     :returns: CGFloat
     */
    func borderWidth() -> CGFloat { return layer.borderWidth }
    
    /**
     Sets the layer border width
     
     :returns: self UIView
     */
    func borderWidth(borderWidth: CGFloat) -> UIView {
        layer.borderWidth = borderWidth
        return self
    }
    
    /**
     Sets layer border with a dash pattern
     
     :param: lineDashPattern: [Int]
     :param: borderWidth: CGFloat
     :param: borderColor: UIColor
     :param: cornerRadius: CGFloat?
     :returns: self UIView
     */
    func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?) -> UIView {
        let strokeLayer = CAShapeLayer()
        strokeLayer.strokeColor = borderColor.CGColor
        strokeLayer.fillColor = nil
        strokeLayer.lineWidth = borderWidth
        strokeLayer.lineDashPattern = lineDashPattern
        if cornerRadius != nil {
            strokeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius!).CGPath
        } else {
            strokeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius()).CGPath
        }
        
        strokeLayer.frame = bounds
        layer.addSublayer(strokeLayer)
        return self
    }
    
    
    // MARK: Rounded Corners
    
    /**
    Returns layer corner radius
    
    :returns: CGFloat
    */
    func cornerRadius() -> CGFloat { return layer.cornerRadius }
    
    /**
     Sets layer corner radius
     
     :param: cornerRadius: CGFloat
     :returns: self UIView
     */
    func cornerRadius(cornerRadius: CGFloat) -> UIView {
        layer.cornerRadius = cornerRadius
        return self
    }
    
    /**
     Creates a circle by rounding the corners to half the size of the width, sets border color and width
     
     :param: borderColor borderColor: UIColor?
     :param: borderWidth: CGFloat?
     :returns: self UIView
     */
    func roundCornersToCircle(borderColor borderColor: UIColor = UIColor.clearColor(), borderWidth: CGFloat = 0) -> UIView {
        cornerRadius(width()/2)
        self.borderWidth(borderWidth)
        self.borderColor(borderColor)
        return self
    }
    
    /**
     Rounding the corners, sets border color and width
     
     :param: cornerRadius: CGFloat
     :param: borderColor: UIColor?
     :param: borderWidth: CGFloat?
     :returns: self UIView
     */
    func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?) -> UIView {
        self.cornerRadius(cornerRadius)
        if borderWidth != nil {
            self.borderWidth(borderWidth!)
        }
        if borderColor != nil {
            self.borderColor(borderColor!)
        }
        return self
    }
    
    
    // MARK: Shadow
    
    /**
    The shadow color of the layer
    
    :returns: UIColor
    */
    var shadowColor:UIColor {
        get {
            return UIColor(CGColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.CGColor
        }
    }
    
    /**
     The shadow offset of the layer
     
     :returns: CGSize
     */
    var shadowOffset:CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /**
     The shadow opacity of the layer
     
     :returns: Float
     */
    var shadowOpacity:Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /**
     The shadow radius of the layer
     
     :returns: CGFloat
     */
    var shadowRadius:CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /**
     Sets shadow of the layer including the color, offset, radius, opacity and mask.
     
     :param: color: UIColor
     :param: offset: CGSize
     :param: radius: CGFloat
     :param: opacity: Float
     :param: isMasked: Bool
     :returns: self UIView
     */
    func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false) -> UIView {
        shadowColor = color
        shadowOffset = offset
        shadowOpacity = opacity
        shadowRadius = radius
        if isMasked {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).CGPath
            let path = CGPathCreateMutable()
            CGPathAddRect(path, nil, CGRectInset(bounds, -10, -10))
            CGPathAddPath(path, nil, UIBezierPath(roundedRect: bounds, cornerRadius: radius).CGPath)
            let maskLayer = CAShapeLayer()
            maskLayer.path = path
            maskLayer.fillRule = kCAFillRuleEvenOdd
            layer.mask = maskLayer
        }
        return self
    }
    
    // MARK: Gradient
    
    /**
    Sets a gradient color layer
   
    :param: colors: [UIColor]
    :param: isHorizontal:Bool
    :returns: self UIView
    */
    func setGradient(colors: [UIColor], isHorizontal:Bool = false) -> UIView {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.startPoint = isHorizontal ? CGPoint(x: 0.5, y: 0) : CGPoint(x: 0.5, y: 1)
        gradientLayer.startPoint = isHorizontal ? CGPoint(x: 0.5, y: 1) : CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = colors
        return self
    }
    
    /**
     Animates colors of a gradient layer
     
     :param: colors: [UIColor]
     :param: duration: CFTimeInterval
     :returns: self UIView
     */
    func animateGradientToColors(colors: [UIColor], duration: CFTimeInterval = 3) -> UIView {
        let gradientLayer = layer as! CAGradientLayer
        let fromColors = gradientLayer.colors
        gradientLayer.colors = colors
        let a = CABasicAnimation(keyPath: "colors")
        a.fromValue = fromColors
        a.toValue = colors
        a.duration = duration
        a.removedOnCompletion = true
        a.fillMode = kCAFillModeForwards
        a.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        a.delegate = self
        layer.addAnimation(a, forKey: "Gradient Animation")
        return self
    }
    
    /**
     Sets a gradient layer mask
     
     :param: alphas:[CGFloat]
     :param: isHorizontal:Bool
     :returns: self UIView
     */
    func setGradientMask(alphas:[CGFloat], isHorizontal:Bool = false) -> UIView {
        let gradientLayer = (layer.mask is CAGradientLayer) ? layer.mask as! CAGradientLayer : CAGradientLayer()
        var colors = [CGColorRef]()
        for alpha in alphas {
            colors.append(UIColor(white: 1, alpha: alpha).CGColor)
        }
        gradientLayer.startPoint = isHorizontal ? CGPoint(x: 1, y: 0.5) : CGPoint(x: 0.5, y: 1)
        gradientLayer.startPoint = isHorizontal ? CGPoint(x: 0, y: 0.5) : CGPoint(x: 0.5, y: 0)
        gradientLayer.colors = colors
        layer.mask = gradientLayer
        return self
    }

    
    
}
