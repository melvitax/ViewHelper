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
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
    
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
    
        
        // Red Circle
        var redCircle = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 180))
        redCircle.backgroundColor = UIColor.redColor()
        redCircle.roundCornersToCircle(borderColor: UIColor.whiteColor(), borderWidth: 12)
        redCircle.clipsToBounds = true
        view.addSubview(redCircle)
        redCircle.centerVertically()
        redCircle.top(redCircle.top() - 100)
        
        // Block 1
        var block1 = UIView(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
        block1.backgroundColor = UIColor(white: 0, alpha: 0.3)
        redCircle.addSubview(block1)
       
        // Block 2
        var block2 = UIView(frame: CGRect(x: block1.right() + 20, y: block1.top(), width: block1.width(), height: block1.height()))
        block2.backgroundColor = UIColor(white: 0, alpha: 0.3)
        redCircle.addSubview(block2)
        
        // Block 3
        var block3 = UIView(frame: CGRect(x: block1.left(), y: block1.bottom() + 20, width: block1.width(), height: block1.height()))
        block3.backgroundColor = UIColor(white: 0, alpha: 0.3)
        redCircle.addSubview(block3)
        
        // Block 4
        var block4 = UIView(frame: CGRect(x: block2.left(), y: block3.top(), width: block1.width(), height: block1.height()))
        block4.backgroundColor = UIColor(white: 0, alpha: 0.3)
        redCircle.addSubview(block4)

        
        var centerView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        centerView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        centerView.roundCornersToCircle()
        redCircle.addSubview(centerView)
        centerView.centerInSuperview()

        var redCircleShadow = UIView(frame: redCircle.frame)
        redCircleShadow.backgroundColor = UIColor.blackColor()
        redCircleShadow.cornerRadius(redCircleShadow.width()/2)
        redCircleShadow.shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 1, isMasked: false)
        view.insertSubview(redCircleShadow, belowSubview: redCircle)

        var dashedBox = UIView(frame: redCircle.frame)
        dashedBox.backgroundColor = UIColor(white: 1, alpha: 1)
        dashedBox.center.y += 200
        dashedBox.borderWithDashPattern([4, 6], borderWidth: 8, borderColor: UIColor.whiteColor(), cornerRadius: 6)
        dashedBox.shadow(color: UIColor.blackColor(), offset: CGSize(width: 0, height: 0), radius: 6, opacity: 2, isMasked: false)
        view.addSubview(dashedBox)

        
    }

}

