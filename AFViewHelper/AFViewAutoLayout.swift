//
//  AFViewAutoLayout.swift
//  AFViewExtension: Version 4.0.1
//
//  Created by Melvin Rivera on 11/5/15.
//  Copyright © 2015 All Forces. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: Init
    
    /**
    Instantiates a new UIView with Auto Layout
    
    - Parameter autoLayout Enables Auto Layout.
    - Returns: self
    */
    convenience init(autoLayout: Bool = true)
    {
        self.init(frame:CGRectZero)
        self.translatesAutoresizingMaskIntoConstraints = !(autoLayout)
    }
    
    // MARK: Position
    
    /**
    Returns the frame's origin
    */
    
    func origin() -> CGPoint { return frame.origin }
    
    /**
     Sets the frame's top and left sides using Auto Layout or frames
     
     - Parameter constant: The CGPoint to ise as the origin
     - Returns: self
     */
    func origin(constant: CGPoint) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin = constant
            return self
        } else {
            return origin(to: superview!, constant: constant)
        }
    }
    /**
     Pins left and top sides to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self UIView
     */
    func origin(to to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1) -> UIView {
        var constraints = [NSLayoutConstraint]()
        if let left = pin(.Left, to: to, attribute: .Left, constant: constant.x, multiplier: multiplier) {
            constraints.append(left)
        }
        if let top = pin(.Top, to: to, attribute: .Top, constant: constant.y, multiplier: multiplier) {
            constraints.append(top)
        }
        return self
    }
    
    /**
     Returns the frame minimum x point
     */
    func left() -> CGFloat { return frame.origin.x }
    
    /**
     Sets the frame left side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func left(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin.x = constant
            return self
        } else {
            return left(to: superview!, attribute: .Left, constant: constant)
        }
    }
    
    /**
     Pins left side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func left(to to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Left, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame leading value
     */
    func leading() -> CGFloat { return layoutDirectionIsLeftToRight() ? left() : right() }
    
    /**
     Sets the frame leading side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func leading(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return layoutDirectionIsLeftToRight() ? left(constant) : right(constant)
        } else {
            return leading(to: superview!, attribute: .Leading, constant: constant)
        }
    }
    
    /**
     Pins the frame leading side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func leading(to to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Leading, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame max x point
     */
    func right() -> CGFloat { return frame.origin.x + frame.size.width }
    
    /**
     Sets the frame right side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func right(constant: CGFloat) -> UIView  {
        if translatesAutoresizingMaskIntoConstraints {
            return left(constant - width())
        } else {
            return right(to: superview!, attribute: .Right, constant: constant)
        }
    }
    /**
     Pins the frame right side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func right(to to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Right, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame trailing value
     */
    func trailing() -> CGFloat { return layoutDirectionIsLeftToRight() ? right() : left() }
    
    /**
     Sets the frame trailing side using Auto Layout or frames
     
     - Parameter constant: The value to use
     - Returns: self UIView
     */
    func trailing(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return layoutDirectionIsLeftToRight() ? right(constant) : left(constant)
        } else {
            return trailing(to: superview!, attribute: .Trailing, constant: constant)
        }
    }
    
    /**
     Pins the frame trailing side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func trailing(to to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Trailing, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame top value
     */
    func top() -> CGFloat { return frame.origin.y }
    
    /**
     Sets the frame top side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func top(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin.y = constant
            return self
        } else {
            return top(to: superview!, attribute: .Top, constant: constant)
        }
    }
    
    /**
     Pins the frame trailing side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func top(to to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Top, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame bottom value
     */
    func bottom() -> CGFloat { return top() + height() }
    
    /**
     Sets the frame bottom side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func bottom(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return top(constant - height())
        } else {
            return bottom(to: superview!, attribute: .Bottom, constant: constant)
        }
    }
    /**
     Pins the frame bottom side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func bottom(to to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Bottom, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Sets the center to it's superview using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func center(constant: CGPoint = CGPoint(x: 0, y: 0)) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = constant
        } else {
            centerX(constant.x)
            centerY(constant.y)
        }
        return self
    }
    
    /**
     Pins the center point to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func center(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView  {
        var constraints = [NSLayoutConstraint]()
        if let centerX = pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant.width, multiplier: multiplier) {
            constraints.append(centerX)
        }
        if let centerY = pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant.height, multiplier: multiplier) {
            constraints.append(centerY)
        }
        return self
    }
    
    /**
     Returns the center X
     */
    func centerX() -> CGFloat { return center.x }
    
    /**
     Sets the center X using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func centerX(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = CGPoint(x: superview!.width()/2 + constant , y: center.y)
        } else {
            pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant)
        }
        return self
    }
    
    /**
     Pins the center X to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func centerX(to to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.CenterX, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the center Y
     */
    func centerY() -> CGFloat { return center.y }
    
    /**
     Sets the center Y using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func centerY(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height()/2) + constant)
        } else {
            pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant)
        }
        return self
    }
    
    /**
     Pins the center Y to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func centerY(to to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.CenterY, to: superview!, attribute: attribute, constant: constant)
        return self
    }
    
    // MARK: Compression and Hugging Priority
    
    /**
    Returns the Compression Resistance Priority for Horizontal Axis using Auto Layout
    */
    func horizontalCompressionPriority() -> UILayoutPriority { return contentCompressionResistancePriorityForAxis(.Horizontal) }
    
    /**
     Sets the Compression Resistance Priority for Horizontal Axis using Auto Layout
     
     - Returns: self
     */
    func horizontalCompressionPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentCompressionResistancePriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    /**
     Returns the Compression Resistance Priority for Vertical Axis using Auto Layout
     */
    func verticalCompressionPriority() -> UILayoutPriority { return contentCompressionResistancePriorityForAxis(.Vertical) }
    
    /**
     Sets the Compression Resistance Priority for Vertical Axis using Auto Layout
     
     - Returns: self
     */
    func verticalCompressionPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentCompressionResistancePriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    /**
     Returns the Content Hugging Priority for Horizontal Axis using Auto Layout
     */
    func horizontalHuggingPriority() -> UILayoutPriority { return contentHuggingPriorityForAxis(.Horizontal) }
    
    /**
     Sets the Content Hugging Priority for Horizontal Axis using Auto Layout
     
     - Returns: self
     */
    func horizontalHuggingPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentHuggingPriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    /**
     Returns the Content Hugging Priority for Vertical Axis using Auto Layout
     */
    func verticalHuggingPriority() -> UILayoutPriority { return contentHuggingPriorityForAxis(.Vertical) }
    
    /**
     Sets the Content Hugging Priority for Vertical Axis using Auto Layout
     
     - Returns: self
     */
    func verticalHuggingPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentHuggingPriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    
    // MARK: Size
    
    /**
    Returns the frame size
    */
    func size() -> CGSize { return frame.size }
    
    /**
     Sets the frame size using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self UIView
     */
    func size(constant: CGSize) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size = constant
        } else {
            applyAttribute(.Width, constant: constant.width)
            applyAttribute(.Height, constant: constant.height)
        }
        return self
    }
    
    /**
     Pins the size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func size(to to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier) {
                constraints.append(width)
            }
            if let height = pin(.Height, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the frame width
     */
    func width() -> CGFloat { return frame.size.width }
    
    /**
     Sets the frame width using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func width(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size.width = constant
        } else {
            applyAttribute(.Width, constant: constant)
        }
        return self
    }
    
    /**
     Pins the width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func width(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        }
        return self
    }
    
    /**
     Returns the frame height
     */
    func height() -> CGFloat { return frame.size.height }
    
    /**
     Sets the frame height using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self UIView
     */
    func height(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size.height = constant
        } else {
            applyAttribute(.Height, constant: constant)
        }
        return self
    }
    
    /**
     Pins the height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func height(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        }
        return self
    }
    
    /**
     Returns the minimum size using Auto Layout
     */
    func minSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints {
            if let minWidth = minWidth() {
                if let minHeight = minHeight() {
                    return CGSize(width: minWidth, height: minHeight)
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum size using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .GreaterThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the minimum width using Auto Layout
     */
    func minWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Width && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum width using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the minimum height using Auto Layout
     */
    func minHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Height && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum height using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the maximun size using Auto Layout
     */
    func maxSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints {
            if let maxWidth = maxWidth() {
                if let maxHeight = maxHeight() {
                    return CGSize(width: maxWidth, height: maxHeight)
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun size using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .LessThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the maximun width using Auto Layout
     */
    func maxWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Width && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun width using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the maximun height using Auto Layout
     */
    func maxHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Height && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun height using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the length of the smallest side
     */
    func smallestSideLength() -> CGFloat
    {
        return min(width(), height())
    }
    
    /**
     Returns the length of the largest side
     */
    func largestSideLength() -> CGFloat
    {
        return max(width(), height())
    }
    
    
    // MARK: AutoLayout state
    
    /**
    Prepares the view for a frame based animation by removing the view, enabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview
    */
    func prepForAnimation()
    {
        if superview != nil {
            let aSuperview = superview!
            removeFromSuperview()
            translatesAutoresizingMaskIntoConstraints = true
            aSuperview.addSubview(self)
        }
    }
    
    /**
     Prepares the view for Auto Layout by removing the view, disabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview
     */
    func prepForAutoLayout()
    {
        if superview != nil {
            let aSuperview = superview!
            removeFromSuperview()
            translatesAutoresizingMaskIntoConstraints = false
            aSuperview.addSubview(self)
        }
    }
    
    
    // MARK: Pin and Apply
    
    /**
    Pins an attribute to another view
    
    - Parameter pinAttribute: The View's attribut to pin
    - Parameter to: The view to pin to
    - Parameter attribute: The Attribute to pin to
    - Parameter constant: The offset to use after multiplication is done.
    - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
    - Parameter relation: The Relation to use
    - Returns: NSLayoutConstraint
    */
    func pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint? {
            if !translatesAutoresizingMaskIntoConstraints {
            if self.superview == nil {
                print("WARNING: No superview found for pinning")
                return nil
            }
            var superview: UIView!
            if (to != nil) {
                superview = to is UIView ? commonSuperviewWithView(to! as! UIView)! : self.superview
            } else {
                superview = self.superview
            }
            let constraint = NSLayoutConstraint(item: self, attribute: pinAttribute, relatedBy: relation, toItem: to, attribute: attribute, multiplier: multiplier, constant: constant)
            superview?.addConstraint(constraint)
            return constraint
        }
        return nil
    }
    
    /**
     Applies an attribute to the view
     
     - Parameter attribute:  Attribute to apply
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Parameter relation: The Relation to use
     - Returns: NSLayoutConstraint
     */
    func applyAttribute(attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier: CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint  {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: multiplier, constant: constant)
        addConstraint(constraint)
        return constraint
    }
    
    // MARK: Removing Constraints
    
    /**
    Removes all attached constraints recursevely
    
    - Returns: self
    */
    func removeAttachedConstraintsRecursevely() -> UIView
    {
        for constraint in constraints {
            print("constraint \(constraint)")
            removeConstraintRecursevely(constraint )
        }
        for constraint in superview!.constraints {
            let firstView = constraint.firstItem as! UIView
            if let _ = constraint.secondItem as? UIView {
                if firstView == self {
                    firstView.removeConstraintRecursevely(constraint )
                }
            }
        }
        return self
    }
    
    /**
     Removes a constraint recursevely
     
     - Returns: self
     */
    func removeConstraintRecursevely(constraint:NSLayoutConstraint) -> UIView
    {
        let firstView = constraint.firstItem as! UIView
        if constraint.secondItem != nil {
            var commonSuperview = firstView.commonSuperviewWithView(constraint.secondItem as! UIView)
            var constraintFound = false
            while constraintFound == false {
                for _ in commonSuperview!.constraints {
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
        return self
    }
    
    
    // MARK: Direction
    
    /**
    Returns true if layout direction is left to right
    */
    func layoutDirectionIsLeftToRight() -> Bool {
        return (UIApplication.sharedApplication().userInterfaceLayoutDirection == .LeftToRight)
    }
    

    
    // MARK: Private
    
    /**
    Finds the nearest common superview
    
    - Returns: UIVIew?
    */
    private func commonSuperviewWithView(view:UIView) -> UIView?
    {
        var commonSuperview: UIView? = nil
        var checkView: UIView? = self
        repeat {
            if view.isDescendantOfView(checkView!) {
                commonSuperview = checkView!
            }
            checkView = checkView!.superview
        } while (checkView) != nil
        return commonSuperview
    }

}