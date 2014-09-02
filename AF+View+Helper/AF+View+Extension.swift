//
//  AF+View+Extension.swift
//
//  Version 1.03
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    
    // MARK: Position

    func origin() -> CGPoint { return frame.origin }
    func origin(frameOrigin: CGPoint) { frame.origin = frameOrigin }
    
    func left() -> CGFloat { return frame.origin.x }
    func left(frameX: CGFloat) { frame.origin.x = frameX }

    func right() -> CGFloat { return frame.origin.x + frame.size.width }
    func right(frameRight: CGFloat) { left(frameRight - width()) }

    func top() -> CGFloat { return frame.origin.y }
    func top(frameY: CGFloat) { frame.origin.y = frameY }

    func bottom() -> CGFloat { return top() + height() }
    func bottom(frameBottom: CGFloat) { top(frameBottom - height()) }
    
    
    // MARK: Size

    func size() -> CGSize { return frame.size }
    func size(frameSize: CGSize) { frame.size = frameSize }

    func width() -> CGFloat { return frame.size.width }
    func width(frameWidth: CGFloat) { frame.size.width = frameWidth }

    func height() -> CGFloat { return frame.size.height }
    func height(frameHeight: CGFloat) { frame.size.height = frameHeight }
       
      
    // MARK: Center
    
    func centerInSuperview()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.width()/2, y: superview!.height()/2)
    }
    
    func centerHorizontally()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.width()/2, y: center.y)
    }
    
    func centerVertically()
    {
        if superview == nil {
            return
        }
        center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height()/2))
    }
    
    
    // MARK: Border

    func borderColor() -> UIColor { return UIColor(CGColor: layer.borderColor) }
    func borderColor(borderColor: UIColor) { layer.borderColor = borderColor.CGColor }

    func borderWidth() -> CGFloat { return layer.borderWidth }
    func borderWidth(borderWidth: CGFloat) { layer.borderWidth = borderWidth }
            
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
            strokeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius()).CGPath
        }

        strokeLayer.frame = bounds
        layer.addSublayer(strokeLayer)
    }
    
    
    // MARK: Rounded Corners

    func cornerRadius() -> CGFloat { return layer.cornerRadius }
    func cornerRadius(cornerRadius: CGFloat) { layer.cornerRadius = cornerRadius }
        
    func roundCornersToCircle()
    {
        cornerRadius(width()/2)
    }
    func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat)
    {
        roundCornersToCircle()
        self.borderWidth(borderWidth)
        self.borderColor(borderColor)
    }
    
    func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?)
    {
        self.cornerRadius(cornerRadius)
        if borderWidth != nil {
            self.borderWidth(borderWidth!)
        }
        if borderColor != nil {
            self.borderColor(borderColor!)
        }
    }
    
    
    // MARK: Shadow

    func shadowColor() -> UIColor { return UIColor(CGColor: layer.shadowColor) }
    func shadowColor(shadowColor: UIColor) { layer.shadowColor = shadowColor.CGColor }

    func shadowOffset() -> CGSize { return layer.shadowOffset }
    func shadowOffset(shadowOffset: CGSize) { layer.shadowOffset = shadowOffset }

    func shadowOpacity() -> Float { return layer.shadowOpacity }
    func shadowOpacity(shadowOpacity: Float) { layer.shadowOpacity = shadowOpacity }

    func shadowRadius() -> CGFloat { return layer.shadowRadius }
    func shadowRadius(shadowRadius: CGFloat) { layer.shadowRadius = shadowRadius }
       
    
    
    func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false)
    {
        shadowColor(color)
        shadowOffset(offset)
        shadowOpacity(opacity)
        shadowRadius(radius)
        if isMasked {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius()).CGPath
            var path = CGPathCreateMutable()
            CGPathAddRect(path, nil, CGRectInset(bounds, -10, -10))
            CGPathAddPath(path, nil, UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius()).CGPath)
            var maskLayer = CAShapeLayer()
            maskLayer.path = path
            maskLayer.fillRule = kCAFillRuleEvenOdd
            layer.mask = maskLayer
        }
    }
    
    
    // MARK: AutoLayout fix for animating
    
    func prepForAnimation()
    {
        removeFromSuperview()
        setTranslatesAutoresizingMaskIntoConstraints(true)
        superview?.addSubview(self)
    }
    

}
