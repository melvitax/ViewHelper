//
//  ViewController.swift
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    let redCircle = UIView(autoLayout:true)
    @IBOutlet weak var inspectableView: InspectableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
        
        // Dashed Box
        let width = view.smallestSideLength() * 0.8
        var dashedBox = UIView(autoLayout:true)
        view.addSubview(dashedBox)
        dashedBox.backgroundColor = UIColor(white: 1, alpha: 0.5)
        dashedBox
            .width(width)
            .height(to: dashedBox, attribute: .Width)
            .center(to:view)
            .layoutIfNeeded()
        dashedBox
            .borderWithDashPattern([2, 6], borderWidth: 4, borderColor: UIColor.whiteColor(), cornerRadius: 6)
            .shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 2, isMasked: false)
        
        // Red Circle
        view.addSubview(redCircle)
        redCircle.backgroundColor = UIColor.redColor()
        redCircle
            .size(to: dashedBox, constant: CGSize(width: -50, height: -50))
            .center(to: view)
            .layoutIfNeeded()
        redCircle.roundCornersToCircle(borderColor: UIColor.whiteColor(), borderWidth: 12)
        redCircle.clipsToBounds = true

        // Top Left Square
        var topLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(topLeftSquare)
        topLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topLeftSquare
            .left(to: redCircle)
            .top(to: redCircle)
            .width(to: redCircle, attribute: .Width, constant: 0, multiplier: 0.48)
            .height(to: topLeftSquare, attribute: .Width)
            .layoutIfNeeded()

        // Top Right Square
        var topRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(topRightSquare)
        topRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topRightSquare
            .right(to: redCircle)
            .top(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
 
        // Bottom Left Square
        var bottomLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomLeftSquare)
        bottomLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomLeftSquare
            .left(to: redCircle)
            .bottom(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        
        // Bottom Right Square
        var bottomRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomRightSquare)
        bottomRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomRightSquare
            .right(to: redCircle)
            .bottom(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        
        
        // Center Circle
        var centerCircle = UIView(autoLayout:true)
        redCircle.addSubview(centerCircle)
        centerCircle.backgroundColor = UIColor(white: 1, alpha: 0.7)
        centerCircle
            .size(to: redCircle, constant: CGSize(width: 0, height: 0), multiplier: 0.6)
            .center(to: view)
            .layoutIfNeeded()
        centerCircle.roundCornersToCircle()

        
        // Center Circle Shadow
        var redCircleShadow = UIView(autoLayout:true)
        view.insertSubview(redCircleShadow, belowSubview: redCircle)
        redCircleShadow.backgroundColor = UIColor.blackColor()
        redCircleShadow
            .size(to: redCircle)
            .center(to: redCircle)
            .layoutIfNeeded()
        redCircleShadow.cornerRadius(redCircleShadow.width()/2)
        redCircleShadow.shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 1, isMasked: false)
        
        
        // Dots X
        let dotsViewX =  UIView(autoLayout:true)
        view.addSubview(dotsViewX)
        dotsViewX
            .left(0)
            .centerY(to: view)
            .width(to: view)
            .height(10)
            .layoutIfNeeded()
        var dots = [UIView]()
        for i in 1..<11 {
            var dot = UIView(autoLayout:true)
            dot.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
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
        dotsViewY
            .top(0)
            .centerX(to: view)
            .height(to: view)
            .width(10)
            .layoutIfNeeded()
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

