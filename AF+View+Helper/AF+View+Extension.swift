//
//  AF+View+Extension.swift
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    
    //#pragma mark - Position
    
    var left: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    
    var right: CGFloat {
        get { return frame.origin.x + frame.size.width }
        set { left = newValue - width }
    }
    
    var top: CGFloat {
        get { return frame.origin.y }
        set {frame.origin.y = newValue }
    }
    
    var bottom: CGFloat {
        get { return top + height }
        set { top = newValue - height }
    }
    
    //#pragma mark - Size
    
    var width: CGFloat {
        get { return frame.size.width }
        set { frame.size.width = newValue }
    }
    
    var height: CGFloat {
        get { return frame.size.height }
        set { frame.size.height = newValue }
    }
    
    
    //#pragma mark - Center
    
    func centerInSuperview()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.width/2, y: superview!.height/2)
    }
    
    func centerHorizontally()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.width/2, y: center.y)
    }
    
    func centerVertically()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height/2))
    }
    
    
    //#pragma mark - Border
    
    var borderColor: UIColor {
        get { return UIColor(CGColor: layer.borderColor) }
        set { layer.borderColor = newValue.CGColor }
    }
    
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?)
    {
        let strokeLayer = CAShapeLayer()
        strokeLayer.strokeColor = borderColor.CGColor
        strokeLayer.fillColor = nil
        strokeLayer.lineWidth = borderWidth
        strokeLayer.lineDashPattern = lineDashPattern
        if cornerRadius != nil {
            strokeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius!).CGPath
        } else {
            strokeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).CGPath
        }
        strokeLayer.frame = bounds
        layer.addSublayer(strokeLayer)
    }
    
    
    //#pragma mark - Rounded Corners
    
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    func roundCornersToCircle()
    {
        cornerRadius = width/2
    }
    func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat)
    {
        roundCornersToCircle()
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
    
    func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?)
    {
        self.cornerRadius = cornerRadius
        if borderWidth != nil {
            self.borderWidth = borderWidth!
        }
        if borderColor != nil {
            self.borderColor = borderColor!
        }
    }
    
    
    //#pragma mark - Shadow
    
    var shadowColor: UIColor {
        get { return UIColor(CGColor: layer.shadowColor) }
        set { layer.shadowColor = newValue.CGColor }
    }
    
    var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    var shadowRadius: CGFloat {
        get {return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false)
    {
        shadowColor = color
        shadowOffset = offset
        shadowOpacity = opacity
        shadowRadius = radius
        if isMasked {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath
            var path = CGPathCreateMutable()
            CGPathAddRect(path, nil, CGRectInset(bounds, -10, -10))
            CGPathAddPath(path, nil, UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath)
            var maskLayer = CAShapeLayer()
            maskLayer.path = path
            maskLayer.fillRule = kCAFillRuleEvenOdd
            layer.mask = maskLayer
        }
    }
    
    
    //#pragma mark - AutoLayout fix for animating
    
    func prepForAnimation()
    {
        removeFromSuperview()
        setTranslatesAutoresizingMaskIntoConstraints(true)
        superview?.addSubview(self)
    }
    

}
