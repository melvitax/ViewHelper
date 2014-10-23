//
//  AF+View+Extension.swift
//
//  AF-View-Helper: Version 2.11
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//  https://github.com/melvitax/AFViewHelper
//

import UIKit
import QuartzCore

typealias ConstraintBlock = ((constraint: NSLayoutConstraint) -> ())?
typealias ConstraintsBlock = ((constraints: [NSLayoutConstraint]) -> ())?

extension UIView {
    
    // MARK: Init
    
    convenience init(autoLayout: Bool)
    {
        self.init(frame:CGRectZero)
        self.setTranslatesAutoresizingMaskIntoConstraints(!(autoLayout))
    }
    
    
    // MARK: Position
    
    func origin() -> CGPoint { return frame.origin }
    func origin(constant: CGPoint) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin = constant
            return self
        } else {
            return origin(to: superview!, constant: constant)
        }
    }
    func origin(#to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            var constraints = [NSLayoutConstraint]()
            if let left = pin(.Left, to: to, attribute: .Left, constant: constant.x, multiplier: multiplier) {
                constraints.append(left)
            }
            if let top = pin(.Top, to: to, attribute: .Top, constant: constant.y, multiplier: multiplier) {
                constraints.append(top)
            }
            closure?(constraints: constraints)
        }
        return self
    }
    
    func left() -> CGFloat { return frame.origin.x }
    func left(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin.x = constant
            return self
        } else {
            return left(to: superview!, attribute: .Left, constant: constant)
        }
    }
    func left(#to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Left, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }
    
    func leading() -> CGFloat { return layoutDirectionIsLeftToRight() ? left() : right() }
    func leading(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            return layoutDirectionIsLeftToRight() ? left(constant) : right(constant)
        } else {
            return leading(to: superview!, attribute: .Leading, constant: constant)
        }
    }
    func leading(#to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Leading, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }

    func right() -> CGFloat { return frame.origin.x + frame.size.width }
    func right(constant: CGFloat) -> UIView  {
        if translatesAutoresizingMaskIntoConstraints() {
            return left(constant - width())
        } else {
            return right(to: superview!, attribute: .Right, constant: constant)
        }
    }
    func right(#to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Right, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }
    
    func trailing() -> CGFloat { return layoutDirectionIsLeftToRight() ? right() : left() }
    func trailing(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            return layoutDirectionIsLeftToRight() ? right(constant) : left(constant)
        } else {
            return trailing(to: superview!, attribute: .Trailing, constant: constant)
        }
    }
    func trailing(#to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Trailing, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }

    func top() -> CGFloat { return frame.origin.y }
    func top(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.origin.y = constant
            return self
        } else {
            return top(to: superview!, attribute: .Top, constant: constant)
        }
    }
    func top(#to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Top, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }

    func bottom() -> CGFloat { return top() + height() }
    func bottom(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            return top(constant - height())
        } else {
            return bottom(to: superview!, attribute: .Bottom, constant: constant)
        }
    }
    func bottom(#to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Bottom, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }
    
    // MARK: Content (1-100)
    
    func priorityX() -> Float { return contentCompressionResistancePriorityForAxis(.Horizontal) }
    func priorityX(priority: Float) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            setContentCompressionResistancePriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    func priorityY() -> Float { return contentCompressionResistancePriorityForAxis(.Vertical) }
    func priorityY(priority: Float) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            setContentCompressionResistancePriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    func huggingX() -> Float { return contentHuggingPriorityForAxis(.Horizontal) }
    func huggingX(priority: Float) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            setContentHuggingPriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    func huggingY() -> Float { return contentHuggingPriorityForAxis(.Vertical) }
    func huggingY(priority: Float) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            setContentHuggingPriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    
    // MARK: Size

    func size() -> CGSize { return frame.size }
    func size(constant: CGSize) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size = constant
        } else {
            applyAttribute(.Width, constant: constant.width)
            applyAttribute(.Height, constant: constant.height)
        }
        return self
    }
    func size(#to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier) {
                constraints.append(width)
            }
            if let height = pin(.Height, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier) {
                constraints.append(height)
            }
            closure?(constraints: constraints)
        }
        return self
    }
    
    func width() -> CGFloat { return frame.size.width }
    func width(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size.width = constant
        } else {
            applyAttribute(.Width, constant: constant)
        }
        return self
    }
    func width(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }
    
    func height() -> CGFloat { return frame.size.height }
    func height(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            frame.size.height = constant
        } else {
            applyAttribute(.Height, constant: constant)
        }
        return self
    }
    func height(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let constraint = pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: constraint)
            }
        }
        return self
    }
    
    func minSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let minWidth = minWidth() {
                if let minHeight = minHeight() {
                    return CGSize(width: minWidth, height: minHeight)
                }
            }
        }
        return nil
    }
    func minSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .GreaterThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    func minSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(height)
            }
            closure?(constraints: constraints)
        }
        return self
    }
    
    func minWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints() {
            for constrain in constraints() {
                if constrain.firstAttribute == .Width && constrain.firstItem as NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    func minWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    func minWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let width = pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                closure?(constraint: width)
            }
        }
        return self
    }
    
    func minHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints() {
            for constrain in constraints() {
                if constrain.firstAttribute == .Height && constrain.firstItem as NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    func minHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    func minHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let height = pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                closure?(constraint: height)
            }
        }
        return self
    }
    
    func maxSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let maxWidth = maxWidth() {
                if let maxHeight = maxHeight() {
                    return CGSize(width: maxWidth, height: maxHeight)
                }
            }
        }
        return nil
    }
    func maxSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .LessThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    func maxSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(height)
            }
            closure?(constraints: constraints)
        }
        return self
    }
    
    func maxWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints() {
            for constrain in constraints() {
                if constrain.firstAttribute == .Width && constrain.firstItem as NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    func maxWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    func maxWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let width = pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual) {
                closure?(constraint: width)
            }
        }
        return self
    }
    
    func maxHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints() {
            for constrain in constraints() {
                if constrain.firstAttribute == .Height && constrain.firstItem as NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    func maxHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    func maxHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let height = pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual) {
                closure?(constraint: height)
            }
        }
        return self
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
    
    func center(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView  {
        if !translatesAutoresizingMaskIntoConstraints() {
            var constraints = [NSLayoutConstraint]()
            if let centerX = pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant.width, multiplier: multiplier) {
                constraints.append(centerX)
            }
            if let centerY = pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant.height, multiplier: multiplier) {
                constraints.append(centerY)
            }
            closure?(constraints: constraints)
        }
        return self
    }
    
    func centerX() -> CGFloat { return center.x }
    func centerX(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            center = CGPoint(x: superview!.width()/2 + constant , y: center.y)
        } else {
            pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant)
        }
        return self
    }
    func centerX(#to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let centerX = pin(.CenterX, to: to, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: centerX)
            }
        }
        return self
    }
    
    func centerY() -> CGFloat { return center.y }
    func centerY(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints() {
            center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height()/2) + constant)
        } else {
            pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant)
        }
        return self
    }
    func centerY(#to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints() {
            if let centerY = pin(.CenterY, to: superview!, attribute: attribute, constant: constant, multiplier: multiplier) {
                closure?(constraint: centerY)
            }
        }
        return self
    }
        
    
    // MARK: AutoLayout fix for animating
    
    func prepForAnimation()
    {
        removeFromSuperview()
        setTranslatesAutoresizingMaskIntoConstraints(true)
        superview?.addSubview(self)
    }
    
    
    // MARK: Pin
    
    func pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint? {
        if self.superview == nil {
            println("WARNING: No superview found for pinning")
            return nil
        }
        var superview: UIView!
        if (to != nil) {
            superview = to is UIView ? commonSuperviewWithView(to! as UIView)! : self.superview
        } else {
            superview = self.superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: pinAttribute, relatedBy: relation, toItem: to, attribute: attribute, multiplier: multiplier, constant: constant)
        superview?.addConstraint(constraint)
        return constraint
    }
    
    
    // MARK: Space Subviews

    func spaceSubviewsEvenly(views:[UIView], size: CGSize, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
    {
        if (views.count < 2) {
            return self
        }
        
        var spacerLength: CGFloat
        if axis == .Horizontal {
            spacerLength = (width() - (size.width * CGFloat(views.count)) ) / ( CGFloat(views.count) - 1.0 )
        } else {
            spacerLength = (height() - (size.height * CGFloat(views.count)) ) / ( CGFloat(views.count) - 1.0 )
        }
        
        var constraints = [NSLayoutConstraint]()
        var firstSpacer:UIView?
        var prevSpacer:UIView?
        
        for idx in 0..<views.count {
            
            // Views
            let view = views[idx]
            
            if prevSpacer == nil {
                // First View, since there are no last space views yet
                if let top = view.pin(.Top, to: self, attribute: .Top) {
                    constraints.append(top)
                }
                if let left = view.pin(.Left, to: self, attribute: .Left) {
                    constraints.append(left)
                }
            } else {
                if let center = (axis == .Horizontal) ? view.pin(.CenterY, to: prevSpacer!, attribute: .CenterY) : view.pin(.CenterX, to: prevSpacer!, attribute: .CenterX) {
                    constraints.append(center)
                }
                if let side = (axis == .Horizontal) ? view.pin(.Left, to: prevSpacer!, attribute: .Right) : view.pin(.Top, to: prevSpacer!, attribute: .Bottom) {
                    constraints.append(side)
                }
                // Last View
                if idx == views.count - 1 {
                    if let end = (axis == .Horizontal) ? view.pin(.Right, to: self, attribute: .Right) : view.pin(.Bottom, to: self, attribute: .Bottom) {
                        constraints.append(end)
                    }
                }
            }
            
            view.priorityX(950).priorityY(950)
            
            constraints.append(view.applyAttribute(.Width, constant: size.width))
            constraints.append(view.applyAttribute(.Height, constant: size.height))
            
            view.layoutIfNeeded()
            
            // spacer
            if idx < views.count - 1 {
                var spacer = UIView(autoLayout:true)
                superview!.addSubview(spacer)
                
                if let center = (axis == .Horizontal) ? spacer.pin(.CenterY, to: view, attribute: .CenterY) : spacer.pin(.CenterX, to: view, attribute: .CenterX) {
                    constraints.append(center)
                }
                if let side = (axis == .Horizontal) ? spacer.pin(.Left, to: view, attribute: .Right) : spacer.pin(.Top, to: view, attribute: .Bottom) {
                    constraints.append(side)
                }
                if let size = (axis == .Horizontal) ? spacer.pin(.Height, to: view, attribute: .Height) : spacer.pin(.Width, to: view, attribute: .Width) {
                    constraints.append(size)
                }
                
                if prevSpacer == nil {
                    // First Spacer
                    let length = spacer.applyAttribute((axis == .Horizontal) ? .Width : .Height, constant: spacerLength)
                    constraints.append(length)
                    firstSpacer = spacer
                } else {
                    if let length = (axis == .Horizontal) ? spacer.pin(.Width, to: prevSpacer!, attribute: .Width) : spacer.pin(.Height, to: prevSpacer!, attribute: .Height) {
                        constraints.append(length)
                    }
                }
                
                prevSpacer = spacer
                spacer.priorityX(10).priorityY(10)
                spacer.layoutIfNeeded()
            }
            view.layoutIfNeeded()
        }
        closure?(constraints: constraints)
        return self
    }
    
    func spaceSubviews(views:[UIView], spacing:CGFloat = 0, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
    {
        if views.count < 2 {
            return self
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
        closure?(constraints: constraints)
        return self
    }
    
    func alignSubviews(views:[UIView], axis:UILayoutConstraintAxis, closure: ConstraintsBlock = nil) -> UIView
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
        closure?(constraints: constraints)
        return self
    }
    
    
    // MARK: Removing Constraints
        
    func removeConstraintsFromViewAndRelatedView(#constraints:[NSLayoutConstraint]) -> UIView
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
                        return self
                    }
                    commonSuperview = commonSuperview?.superview
                }
            } else {
                constraint.firstItem.removeConstraint(constraint)
            }
        }
        return self
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
    
    
    private func applyAttribute(attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier: CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint  {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: multiplier, constant: constant)
        addConstraint(constraint)
        return constraint
    }
    
    private func layoutDirectionIsLeftToRight() -> Bool {
        return (UIApplication.sharedApplication().userInterfaceLayoutDirection == .LeftToRight)
    }
    
    // MARK: Border
    
    func borderColor() -> UIColor { return UIColor(CGColor: layer.borderColor) }
    func borderColor(borderColor: UIColor) -> UIView {
        layer.borderColor = borderColor.CGColor
        return self
    }
    
    func borderWidth() -> CGFloat { return layer.borderWidth }
    func borderWidth(borderWidth: CGFloat) -> UIView {
        layer.borderWidth = borderWidth
        return self
    }
    
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
    
    func cornerRadius() -> CGFloat { return layer.cornerRadius }
    func cornerRadius(cornerRadius: CGFloat) -> UIView {
        layer.cornerRadius = cornerRadius
        return self
    }
    
    func roundCornersToCircle() -> UIView {
        cornerRadius(width()/2)
        return self
    }
    
    func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat) -> UIView {
        roundCornersToCircle()
        self.borderWidth(borderWidth)
        self.borderColor(borderColor)
        return self
    }
    
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
    
    func shadowColor() -> UIColor { return UIColor(CGColor: layer.shadowColor) }
    func shadowColor(shadowColor: UIColor) -> UIView {
        layer.shadowColor = shadowColor.CGColor
        return self
    }
    
    func shadowOffset() -> CGSize { return layer.shadowOffset }
    func shadowOffset(shadowOffset: CGSize) -> UIView {
        layer.shadowOffset = shadowOffset
        return self
    }
    
    func shadowOpacity() -> Float { return layer.shadowOpacity }
    func shadowOpacity(shadowOpacity: Float) -> UIView {
        layer.shadowOpacity = shadowOpacity
        return self
    }
    
    func shadowRadius() -> CGFloat { return layer.shadowRadius }
    func shadowRadius(shadowRadius: CGFloat) -> UIView {
        layer.shadowRadius = shadowRadius
        return self
    }
    
    func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false) -> UIView {
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
        return self
    }

    
}
