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
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
        
        self.view.pin(.Width, to: view, attribute: .Height, constant: 0, multiplier: 0.5, relation: .LessThanOrEqual)
        
        // Dashed Box
        let width = view.smallestSideLength() * 0.8
        let dashedBox = UIView(autoLayout:true)
        view.addSubview(dashedBox)
        dashedBox.backgroundColor = UIColor(white: 1, alpha: 0.5)
        dashedBox
            .width(width)
            .height(to: dashedBox, attribute: .Width)
            .center(to:view)
            .layoutIfNeeded()
        dashedBox
            .borderWithDashPattern([2, 6], borderWidth: 4, borderColor: UIColor.whiteColor(), cornerRadius: 6)
            .shadow(UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 2, isMasked: false)
        
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
        let topLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(topLeftSquare)
        topLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topLeftSquare
            .left(to: redCircle)
            .top(to: redCircle)
            .width(to: redCircle, attribute: .Width, constant: 0, multiplier: 0.48)
            .height(to: topLeftSquare, attribute: .Width)
            .layoutIfNeeded()

        // Top Right Square
        let topRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(topRightSquare)
        topRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        topRightSquare
            .right(to: redCircle)
            .top(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
 
        // Bottom Left Square
        let bottomLeftSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomLeftSquare)
        bottomLeftSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomLeftSquare
            .left(to: redCircle)
            .bottom(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        
        // Bottom Right Square
        let bottomRightSquare = UIView(autoLayout:true)
        redCircle.addSubview(bottomRightSquare)
        bottomRightSquare.backgroundColor = UIColor(white: 0, alpha: 0.3)
        bottomRightSquare
            .right(to: redCircle)
            .bottom(to: redCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        
        
        // Center Circle
        let centerCircle = UIView(autoLayout:true)
        redCircle.addSubview(centerCircle)
        centerCircle.backgroundColor = UIColor(white: 1, alpha: 0.7)
        centerCircle
            .size(to: redCircle, constant: CGSize(width: 0, height: 0), multiplier: 0.6)
            .center(to: view)
            .layoutIfNeeded()
        centerCircle.roundCornersToCircle()

        
        // Center Circle Shadow
        let redCircleShadow = UIView(autoLayout:true)
        view.insertSubview(redCircleShadow, belowSubview: redCircle)
        redCircleShadow.backgroundColor = UIColor.blackColor()
        redCircleShadow
            .size(to: redCircle)
            .center(to: redCircle)
            .layoutIfNeeded()
        redCircleShadow.cornerRadius(redCircleShadow.width()/2)
        redCircleShadow.shadow(UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 1, isMasked: false)
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        view.layoutIfNeeded()
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

