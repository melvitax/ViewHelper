//
//  ViewController.swift
//  Swift Demo UIView+AF+Additions
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    let redCircle = UIView(autoLayout:true)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
        
        // Dashed Box
        var dashedBox = UIView(autoLayout:true)
        view.addSubview(dashedBox)
        let width = view.smallestSideLength() * 0.8
        dashedBox.width(width)
        dashedBox.pinHeightToWidth()
        dashedBox.centerInSuperview(constant: CGSizeMake(0, 100))
        dashedBox.backgroundColor = UIColor(white: 1, alpha: 1)
        dashedBox.layoutIfNeeded()
        dashedBox.borderWithDashPattern([4, 6], borderWidth: 8, borderColor: UIColor.whiteColor(), cornerRadius: 6)
        dashedBox.shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 2, isMasked: false)
       
        // Red Circle
        view.addSubview(redCircle)
        redCircle.backgroundColor = UIColor.redColor()
        redCircle.pinSizeTo(dashedBox, constant: -50)
        redCircle.centerInSuperview(constant: CGSize(width: 0, height: -50))
        redCircle.layoutIfNeeded()
        redCircle.roundCornersToCircle(borderColor: UIColor.whiteColor(), borderWidth: 12)
        redCircle.clipsToBounds = true
        
       
        // Top Left Square
        var topLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(topLeftSquare)
        topLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topLeftSquare.pin(.Left, to: redCircle, attribute: .Left)
        topLeftSquare.pin(.Top, to: redCircle, attribute: .Top)
        topLeftSquare.pin(.Width, to: redCircle, attribute: .Width, constant: -10, multiplier: 0.5)
        topLeftSquare.pinHeightToWidth()
        topLeftSquare.layoutIfNeeded()
 
        // Top Right Square
        var topRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(topRightSquare)
        topRightSquare.pin(.Left, to: redCircle, attribute: .Left)
        topRightSquare.pin(.Top, to: redCircle, attribute: .Top)
        topRightSquare.pinSizeTo(topLeftSquare)
        topRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topRightSquare.layoutIfNeeded()
 
        
        // Bottom Left Square
        var bottomLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomLeftSquare)
        bottomLeftSquare.pin(.Left, to: redCircle, attribute: .Left)
        bottomLeftSquare.pin(.Bottom, to: redCircle, attribute: .Bottom)
        bottomLeftSquare.pinSizeTo(topLeftSquare)
        bottomLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomLeftSquare.layoutIfNeeded()
        
        
        // Bottom Right Square
        var bottomRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomRightSquare)
        bottomRightSquare.pin(.Right, to: redCircle, attribute: .Right)
        bottomRightSquare.pin(.Bottom, to: redCircle, attribute: .Bottom)
        bottomRightSquare.pinSizeTo(topLeftSquare)
        bottomRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomRightSquare.layoutIfNeeded()
        
        
        // Center Circle
        var centerCircle = UIView(autoLayout:true)
        redCircle.addSubview(centerCircle)
        centerCircle.pinSizeTo(topLeftSquare)
        centerCircle.centerInSuperview()
        centerCircle.backgroundColor = UIColor(white: 1, alpha: 0.7)
        centerCircle.layoutIfNeeded()
        centerCircle.roundCornersToCircle()

        
        // Center Circle Shadow
        var redCircleShadow = UIView(autoLayout:true)
        view.insertSubview(redCircleShadow, belowSubview: redCircle)
        redCircleShadow.pinSizeTo(topLeftSquare)
        redCircleShadow.pinCenterTo(redCircle)
        redCircleShadow.backgroundColor = UIColor.blackColor()
        redCircleShadow.layoutIfNeeded()
        redCircleShadow.cornerRadius(redCircleShadow.width()/2)
        redCircleShadow.shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 1, isMasked: false)
        
        
        // Dots X
        let dotsViewX =  UIView(autoLayout:true)
        view.addSubview(dotsViewX)
        dotsViewX.left(0)
        dotsViewX.pin(.CenterY, to: view, attribute: .CenterY)
        dotsViewX.pin(.Width, to: view, attribute: .Width)
        dotsViewX.height(10)
        var dots = [UIView]()
        for i in 1..<11 {
            var dot = UIView(autoLayout:true)
            dot.backgroundColor = UIColor.darkGrayColor()
            dotsViewX.addSubview(dot)
            dot.cornerRadius(5)
            dot.clipsToBounds = true
            dot.layoutIfNeeded()
            dot.tag = i
            dots.append(dot)
        }
        dotsViewX.spaceSubviewsEvenly(dots, size: CGSize(width: 10, height: 10))
        
        // Dots Y
        let dotsViewY =  UIView(autoLayout:true)
        view.addSubview(dotsViewY)
        dotsViewY.top(0)
        dotsViewY.pin(.CenterX, to: view, attribute: .CenterX)
        dotsViewY.pin(.Height, to: view, attribute: .Height)
        dotsViewY.width(10)
        dots = [UIView]()
        for i in 1..<11 {
            var dot = UIView(autoLayout:true)
            dot.backgroundColor = UIColor.darkGrayColor()
            dotsViewY.addSubview(dot)
            dot.cornerRadius(5)
            dot.clipsToBounds = true
            dot.layoutIfNeeded()
            dot.tag = i
            dots.append(dot)
        }
        dotsViewY.spaceSubviewsEvenly(dots, size: CGSize(width: 10, height: 10), axis: .Vertical)
       
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
  
        let transitionToWide = size.width > size.height
  
        coordinator.animateAlongsideTransition({
            context in
            // Create a transition and match the context's duration
            let transition = CATransition()
            transition.duration = context.transitionDuration()
            
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            //self.redCircle.layer.addAnimation(transition, forKey: "cornerRadius")
            //self.redCircle.roundCornersToCircle()
            }, completion: nil)
    }


}

