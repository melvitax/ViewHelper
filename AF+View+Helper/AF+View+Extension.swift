//
//  AF+View+Extension.swift
//
//  Version 2.0
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import UIKit
import QuartzCore


extension UIView {
    
    // MARK: Init
    
    convenience init(autoLayout: Bool)
    {
        self.init(frame:CGRectZero)
        self.setTranslatesAutoresizingMaskIntoConstraints(!(autoLayout))
    }
    
    
    // MARK: Position

    func origin() -> CGPoint { return frame.origin }
    func origin(constant: CGPoint) -> [NSLayoutConstraint]? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin = constant
            return nil
        } else {
            var constraints = [NSLayoutConstraint]()
            if let left = left(constant.x) {
                constraints.append(left)
            }
            if let top = top(constant.y) {
                constraints.append(top)
            }
            return constraints
        }
    }

    
    func left() -> CGFloat { return frame.origin.x }
    func left(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin.x = constant
            return nil
        } else {
            return pin(.Left, to: superview!, attribute: .Left, constant: constant)
        }
    }
    
    func leading() -> CGFloat {
        if layoutDirectionIsLeftToRight() {
            return left()
        } else {
            return right()
        }
    }
    func leading(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            if layoutDirectionIsLeftToRight() {
                left(constant)
            } else {
                right(constant)
            }
            return nil
        } else {
            return pin(.Leading, to: superview!, attribute: .Leading, constant: constant)
        }
    }

    func right() -> CGFloat { return frame.origin.x + frame.size.width }
    func right(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            left(constant - width())
            return nil
        } else {
            return pin(.Right, to: superview!, attribute: .Right, constant: constant)
        }
    }
    
    func trailing() -> CGFloat {
        if layoutDirectionIsLeftToRight() {
            return right()
        } else {
            return left()
        }
    }
    func trailing(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            if layoutDirectionIsLeftToRight() {
                right(constant)
            } else {
                left(constant)
            }
            return nil
        } else {
            return pin(.Trailing, to: superview!, attribute: .Trailing, constant: constant)
        }
    }

    func top() -> CGFloat { return frame.origin.y }
    func top(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin.y = constant
            return nil
        } else {
            return pin(.Top, to: superview!, attribute: .Top, constant: constant)
        }
    }

    func bottom() -> CGFloat { return top() + height() }
    func bottom(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            top(constant - height())
            return nil
        } else {
            return pin(.Bottom, to: superview!, attribute: .Bottom, constant: constant)
        }
    }
    
    // MARK: Content
    func horizontalCompression() -> Float { return contentCompressionResistancePriorityForAxis(.Horizontal) }
    func horizontalCompression(priority: Float) {
        setContentCompressionResistancePriority(priority, forAxis: .Horizontal)
    }
    
    func verticalCompression() -> Float { return contentCompressionResistancePriorityForAxis(.Vertical) }
    func verticalCompression(priority: Float) {
        setContentCompressionResistancePriority(priority, forAxis: .Horizontal)
    }
    
    func horizontalHugging() -> Float { return contentHuggingPriorityForAxis(.Horizontal) }
    func horizontalHugging(priority: Float) {
        setContentHuggingPriority(priority, forAxis: .Horizontal)
    }
    
    func verticalHugging() -> Float { return contentHuggingPriorityForAxis(.Vertical) }
    func verticalHugging(priority: Float) {
        setContentHuggingPriority(priority, forAxis: .Vertical)
    }
    
    
    // MARK: Size

    func size() -> CGSize { return frame.size }
    func size(constant: CGSize) -> [NSLayoutConstraint]? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size = constant
            return nil
        } else {
            var constraints = [NSLayoutConstraint]()
            if let width = width(constant.width) {
                constraints.append(width)
            }
            if let height = height(constant.height) {
                constraints.append(height)
            }
            return constraints
        }
    }
    
    func width() -> CGFloat { return frame.size.width }
    func width(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size.width = constant
            return nil
        } else {
            return applyAttribute(.Width, constant: constant)
        }
    }

    func height() -> CGFloat { return frame.size.height }
    func height(constant: CGFloat) -> NSLayoutConstraint? {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size.height = constant
            return nil
        } else {
            return applyAttribute(.Height, constant: constant)
        }
    }
    
    func setMinimumSize(size:CGSize) -> [NSLayoutConstraint]?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        var constraints = [NSLayoutConstraint]()
        if let width = setMinimumWidth(size.width) {
            constraints.append(width)
        }
        if let height = setMinimumHeight(size.height) {
            constraints.append(height)
        }
        return constraints
    }
    
    func setMinimumWidth(constant:CGFloat) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        return applyAttribute(.Width, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
    }
    
    func setMinimumHeight(constant:CGFloat) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        return applyAttribute(.Height, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
    }
    
    func setMaximumSize(size:CGSize) -> [NSLayoutConstraint]?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        var constraints = [NSLayoutConstraint]()
        if let width = setMaximumWidth(size.width) {
            constraints.append(width)
        }
        if let height = setMaximumHeight(size.height) {
            constraints.append(height)
        }
        return constraints
    }
    
    func setMaximumWidth(constant:CGFloat) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        return applyAttribute(.Width, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
    }
    
    func setMaximumHeight(constant:CGFloat) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() == true {
            return nil
        }
        return applyAttribute(.Height, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
    }
    
    func smallestSideLength() -> CGFloat
    {
        return min(width(), height())
    }
    
    func largestSideLength() -> CGFloat
    {
        return max(width(), height())
    }

      
    // MARK: Center
    
    func centerInSuperview(constant:CGSize = CGSize(width: 0, height: 0)) -> [NSLayoutConstraint]?
    {
        if translatesAutoresizingMaskIntoConstraints() {
            center = CGPoint(x: superview!.width()/2, y: superview!.height()/2)
            return nil
        } else {
            var constraints = [NSLayoutConstraint]()
            if let x = pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant.width) {
                constraints.append(x)
            }
            if let y = pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant.width) {
                constraints.append(y)
            }
            return constraints
        }
    }
    
    func centerHorizontally(constant: CGFloat = 0) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() {
            center = CGPoint(x: superview!.width()/2 + constant , y: center.y)
            return nil
        } else {
            return pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant)
        }
    }
    
    func centerVertically(constant: CGFloat = 0) -> NSLayoutConstraint?
    {
        if translatesAutoresizingMaskIntoConstraints() {
            center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height()/2) + constant)
            return nil
        } else {
            return pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant)
        }
    }
        
    
    // MARK: AutoLayout fix for animating
    
    func prepForAnimation()
    {
        removeFromSuperview()
        setTranslatesAutoresizingMaskIntoConstraints(true)
        superview?.addSubview(self)
    }
    
    
    // MARK: Pin
    
    func pin(pinAttribute:NSLayoutAttribute, to peerItem:AnyObject? = nil, attribute toAttribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint?
    {
        if self.superview == nil {
            println("WARNING: No superview found for pinning")
            return nil
        }
        var superview: UIView?
        if (peerItem != nil) {
            superview = peerItem!.isKindOfClass(UIView) ? commonSuperviewWithView(peerItem! as UIView)! : self.superview
        } else {
            superview = self.superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: pinAttribute, relatedBy: relation, toItem: peerItem, attribute: toAttribute, multiplier: multiplier, constant: constant)
        superview?.addConstraint(constraint)
        return constraint
    }
    
    func pinSizeTo(peerItem:AnyObject, constant:CGFloat = 0, multiplier:CGFloat = 1) -> [NSLayoutConstraint]?
    {
        var constraints = [NSLayoutConstraint]()
        if let width = pin(.Width, to: peerItem, attribute: .Width, constant: constant, multiplier: multiplier) {
            constraints.append(width)
        }
        if let height = pin(.Height, to: peerItem, attribute: .Height, constant: constant, multiplier: multiplier) {
            constraints.append(height)
        }
        return constraints
    }
    
    func pinCenterTo(peerItem:AnyObject, constant:CGFloat = 0, multiplier:CGFloat = 1) -> [NSLayoutConstraint]?
    {
        var constraints = [NSLayoutConstraint]()
        if let x = pin(.CenterX, to: peerItem, attribute: .CenterX, constant: constant, multiplier: multiplier) {
            constraints.append(x)
        }
        if let y = pin(.CenterY, to: peerItem, attribute: .CenterY, constant: constant, multiplier: multiplier) {
            constraints.append(y)
        }
        return constraints
    }
    
    func pinHeightToWidth() -> NSLayoutConstraint?
    {
        return pin(.Height, to: self, attribute: .Width)
    }
    
    func pinWidthToHeight() -> NSLayoutConstraint?
    {
        return pin(.Width, to: self, attribute: .Height)
    }
    
    
    // MARK: Space Subviews

    func spaceSubviewsEvenly(views:[UIView], size: CGSize, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY) -> [NSLayoutConstraint]?
    {
        if (views.count < 2) || (superview == nil) {
            return nil
        }
        
        var spacerLength: CGFloat
        if axis == .Horizontal {
            spacerLength = (superview!.width() - (size.width * CGFloat(views.count)) ) / ( CGFloat(views.count) - 1.0 )
        } else {
            spacerLength = (superview!.height() - (size.height * CGFloat(views.count)) ) / ( CGFloat(views.count) - 1.0 )
        }
        
        var constraints = [NSLayoutConstraint]()
        var prev:UIView?
        
        for idx in 0..<views.count {
            
            // view
            let view = views[idx]
            if prev == nil {
                if let top = view.top(0) {
                    constraints.append(top)
                }
                if let left = view.left(0) {
                    constraints.append(left)
                }
            } else {
                if let center = (axis == .Horizontal) ? view.pin(.CenterY, to: prev!, attribute: .CenterY) : view.pin(.CenterX, to: prev!, attribute: .CenterX) {
                    constraints.append(center)
                }
                if let pin = (axis == .Horizontal) ? view.pin(.Left, to: prev!, attribute: .Right) :  view.pin(.Top, to: prev!, attribute: .Bottom) {
                    constraints.append(pin)
                }
                if idx == views.count - 1 {
                    if let right = (axis == .Horizontal) ? view.right(0) : view.bottom(0) {
                        constraints.append(right)
                    }
                }
            }
            if let size = view.size(size) {
                constraints += size
            }
           
            // spacer
            if idx < views.count - 1 {
                var spacer = UIView(autoLayout:true)
                superview!.addSubview(spacer)
                if let centerY = (axis == .Horizontal) ? spacer.pin(.CenterY, to: view, attribute: .CenterY) : spacer.pin(.CenterX, to: view, attribute: .CenterX) {
                    constraints.append(centerY)
                }
                if let pin = (axis == .Horizontal) ? spacer.pin(.Left, to: view, attribute: .Right) : spacer.pin(.Top, to: view, attribute: .Bottom) {
                    constraints.append(pin)
                }
                if let side = (axis == .Horizontal) ? spacer.pin(.Height, to: view, attribute: .Height) : spacer.pin(.Width, to: view, attribute: .Width) {
                    constraints.append(side)
                }
                spacer.horizontalCompression(10)
                
                if prev == nil {
                    if let length = (axis == .Horizontal) ? spacer.width(spacerLength) : spacer.height(spacerLength) {
                        constraints.append(length)
                    }
                } else {
                    if let length = (axis == .Horizontal) ? spacer.pin(.Width, to: prev!, attribute: .Width) : spacer.pin(.Height, to: prev!, attribute: .Height) {
                        constraints.append(length)
                    }
                }
                prev = spacer
                spacer.layoutIfNeeded()
            }
            view.layoutIfNeeded()
        }
       return constraints
    }
    
    func spaceSubviews(views:[UIView], spacing:CGFloat = 0, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY) -> [NSLayoutConstraint]?
    {
        if views.count < 2 {
            return nil
        }
        
        let direction = axis == .Horizontal ? "H:" : "V:"
        let attribute: NSLayoutAttribute = axis == .Horizontal ? .Width : .Height
        
        var constraints = [NSLayoutConstraint]()
        
        var firstView = views[0]
        var previousView:UIView?
        var vfl = ""
        var relatedViews:[String:UIView]
        
        for view in views {
            
            relatedViews = [String:UIView]()
            
            relatedViews["view"] = view
            
            if previousView == nil {
                vfl = "\(direction)|[view]"
            } else {
                vfl = "\(direction)[previousView(view)]-spacing-[view]"
                relatedViews["previousView"] = previousView
            }
            constraints += NSLayoutConstraint.constraintsWithVisualFormat(vfl, options: options, metrics: ["spacing":spacing], views: relatedViews as NSDictionary) as [NSLayoutConstraint]
            previousView = view
        }
        self.addConstraints(constraints)
        return constraints
    }
    
    func alignSubviews(views:[UIView], axis:UILayoutConstraintAxis) -> [NSLayoutConstraint]
    {
        var constraints = [NSLayoutConstraint]()
        
        let attributeForView: NSLayoutAttribute = axis == .Horizontal ? .CenterX : .CenterY
        let attributeToPin: NSLayoutAttribute = axis == .Horizontal ? .Right : .Bottom
        let fractionPerView:CGFloat = 1.0 / CGFloat(views.count) + 1.0
        
        for (idx, view) in enumerate(views) {
            let multiplier:CGFloat = CGFloat(fractionPerView) * (CGFloat(idx) + 1.0)
            constraints.append(NSLayoutConstraint(item: view, attribute: attributeForView, relatedBy: .Equal, toItem: self, attribute: attributeToPin, multiplier: multiplier, constant: 0.0))
        }
        self.addConstraints(constraints)
        return constraints
    }
    
    
    // MARK: Removing Constraints
        
    func removeConstraintsFromViewAndRelatedView(#constraints:[NSLayoutConstraint])
    {
        for constraint in constraints {
            let firstView = constraint.firstItem as UIView
            if constraint.secondItem != nil {
                var commonSuperview = firstView.commonSuperviewWithView(constraint.secondItem as UIView)
                var constraintFound = false
                while constraintFound == false {
                    for constraintToCheck in commonSuperview!.constraints() {
                        constraintFound = true
                    }
                    if constraintFound == true {
                        commonSuperview!.removeConstraint(constraint)
                        return
                    }
                    commonSuperview = commonSuperview?.superview
                }
            } else {
                constraint.firstItem.removeConstraint(constraint)
            }
        }
    }
    
    
    // MARK: Private
    
    private func commonSuperviewWithView(view:UIView) -> UIView?
    {
        var commonSuperview: UIView? = nil
        var checkView: UIView? = self
        do {
            if view.isDescendantOfView(checkView!) {
                commonSuperview = checkView!
            }
            checkView = checkView!.superview
        } while (checkView) != nil
        return commonSuperview
    }
    
    
    private func applyAttribute(attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier: CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: multiplier, constant: constant)
        addConstraint(constraint)
        return constraint
    }
    
    private func layoutDirectionIsLeftToRight() -> Bool {
        return (UIApplication.sharedApplication().userInterfaceLayoutDirection == .LeftToRight)
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
    
    
}
