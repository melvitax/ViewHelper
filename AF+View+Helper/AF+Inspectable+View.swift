//
//  AF+Inspectable+View.swift
//
//  AF-View-Helper: Version 2.3
//
//  Created by Melvin Rivera on 7/24/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//  https://github.com/melvitax/AFViewHelper
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable public class InspectableView :UIView {

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBInspectable public var roundCorners : CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = roundCorners
        }
    }
    
    @IBInspectable public var strokeColor : UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = strokeColor.CGColor
        }
    }
    
    @IBInspectable public var strokeWidth : CGFloat = 0.0 {
        didSet {
            layer.borderWidth = strokeWidth
        }
    }
    
    @IBInspectable public var layoutMargin: CGFloat = 0 {
        didSet {
            self.layoutMargins = UIEdgeInsets(top: layoutMargin, left: layoutMargin,
                bottom: layoutMargin, right: layoutMargin)
        }
    }
    
    @IBInspectable public var shadow : UIColor = UIColor.clearColor() {
        didSet {
            layer.shadowColor = shadow.CGColor
        }
    }
    
    
    @IBInspectable public var sOffset : CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = sOffset
        }
    }
    
    @IBInspectable public var sOpacity : Float = 0.0 {
        didSet {
            layer.shadowOpacity = sOpacity
        }
    }
    
    @IBInspectable public var sRadius : CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = sRadius
        }
    }
    
    @IBInspectable var gradientStart: UIColor = UIColor.whiteColor() {
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var gradientEnd: UIColor = UIColor.blackColor() {
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var gradientIsHorizontal: Bool = false {
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var gradientCornerRadius: CGFloat = 0.0 {
        didSet{
            setupGradient()
        }
    }
    
    private func setupGradient(){
        
        let colors:Array = [gradientStart.CGColor, gradientEnd.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = gradientCornerRadius
        
        gradientLayer.endPoint = (gradientIsHorizontal) ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)
        
        self.setNeedsDisplay()
        
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    

}
