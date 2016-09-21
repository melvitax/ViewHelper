//
//  ViewController.swift
//
//  Created by Melvin Rivera on 7/2/14.
//  Copyright (c) 2014 All Forces. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedAnimation: Int = 0
    var selectedEasing: Int = 0
    
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var scaleLabel: UILabel!
    
    @IBOutlet weak var rotateSlider: UISlider!
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var dampingLabel: UILabel!
    
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var velocityLabel: UILabel!
    
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var xLabel: UILabel!
    
    @IBOutlet weak var ySlider: UISlider!
    @IBOutlet weak var yLabel: UILabel!
    
    
    @IBOutlet weak var mainBox: AFInspectableView!
    @IBOutlet weak var bigCircle: AFInspectableView!
    @IBOutlet weak var smallCircle: AFInspectableView!
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Top Left Square
        let topLeftSquare = UIView(autoLayout:true)
        bigCircle.addSubview(topLeftSquare)
        topLeftSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
        topLeftSquare
            .left(to: bigCircle)
            .top(to: bigCircle)
            .width(to: bigCircle, attribute: .width, constant: 0, multiplier: 0.48)
            .height(to: topLeftSquare, attribute: .width)
            .layoutIfNeeded()
        
        // Top Right Square
        let topRightSquare = UIView(autoLayout:true)
        bigCircle.addSubview(topRightSquare)
        topRightSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
        topRightSquare
            .right(to: bigCircle)
            .top(to: bigCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        // Bottom Left Square
        let bottomLeftSquare = UIView(autoLayout:true)
        bigCircle.addSubview(bottomLeftSquare)
        bottomLeftSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
        bottomLeftSquare
            .left(to: bigCircle)
            .bottom(to: bigCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        
        // Bottom Right Square
        let bottomRightSquare = UIView(autoLayout:true)
        bigCircle.addSubview(bottomRightSquare)
        bottomRightSquare.backgroundColor = UIColor(white:0.1, alpha: 1)
        bottomRightSquare
            .right(to: bigCircle)
            .bottom(to: bigCircle)
            .size(to: topLeftSquare)
            .layoutIfNeeded()
        
        resetValues()
    }
    
    // MARK: View Layout
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        layoutView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        
        //view.layoutIfNeeded()
        coordinator.animate(alongsideTransition: {
            context in
            // Create a transition and match the context's duration
            let transition = CATransition()
            transition.duration = context.transitionDuration
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            self.bigCircle.layer.add(transition, forKey: "cornerRadius")
            self.bigCircle.cornerRadius = self.bigCircle.width()/2
            self.smallCircle.layer.add(transition, forKey: "cornerRadius")
            self.smallCircle.cornerRadius = self.smallCircle.width()/2
            }, completion: nil)
        
    }
    
    func layoutView()
    {
        view.layoutIfNeeded()
        bigCircle.cornerRadius = bigCircle.width()/2
        smallCircle.cornerRadius = smallCircle.width()/2
    }
    
    
    // MARK: UIPickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? AnimationType.allValues.count : AnimationEasingCurve.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? String(describing: AnimationType.allValues[row]) : String(describing: AnimationEasingCurve.allValues[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedAnimation = row
            animateView(nil)
        default:
            selectedEasing = row
            animateView()
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func resetValues(_ sender: AnyObject? = nil) {
        forceSlider.setValue(1, animated: true)
        durationSlider.setValue(0.5, animated: true)
        delaySlider.setValue(0, animated: true)
        scaleSlider.setValue(1, animated: true)
        rotateSlider.setValue(0, animated: true)
        dampingSlider.setValue(0.7, animated: true)
        velocitySlider.setValue(0.7, animated: true)
        xSlider.setValue(0, animated: true)
        ySlider.setValue(0, animated: true)
    }
    
    @IBAction func animateView(_ sender: AnyObject? = nil) {
        bigCircle.animate(AnimationType.allValues[selectedAnimation], curve: AnimationEasingCurve.allValues[selectedEasing], duration: CGFloat(durationSlider.value), delay: CGFloat(delaySlider.value), force: CGFloat(forceSlider.value), damping: CGFloat(dampingSlider.value),velocity: CGFloat(velocitySlider.value), fromRotation: CGFloat(rotateSlider.value), fromScale: CGFloat(scaleSlider.value), fromX: CGFloat(xSlider.value), fromY: CGFloat(ySlider.value))
    }
    
    @IBAction func forceSliderChanged(_ sender: AnyObject) {
        animateView()
        forceLabel.text = String(format: "Force: %.1f", forceSlider.value)
    }
    @IBAction func durationSliderChanged(_ sender: AnyObject) {
        animateView()
        durationLabel.text = String(format: "Duration: %.1f", durationSlider.value)
    }
    @IBAction func delaySliderChanged(_ sender: AnyObject) {
        animateView()
        delayLabel.text = String(format: "Delay: %.1f", delaySlider.value)
    }
    
    @IBAction func scaleSliderChanged(_ sender: AnyObject) {
        animateView()
        scaleLabel.text = String(format: "Scale: %.1f", scaleSlider.value)
    }
    @IBAction func rotateSliderChanged(_ sender: AnyObject) {
        animateView()
        rotateLabel.text =  String(format: "Rotate: %.1f", rotateSlider.value)
    }
    @IBAction func dampingSliderChanged(_ sender: AnyObject) {
        animateView()
        dampingLabel.text = String(format: "Damping: %.1f", dampingSlider.value)
    }
    
    @IBAction func velocitySliderChanged(_ sender: AnyObject) {
        animateView()
        velocityLabel.text = String(format: "Velocity: %.1f", velocitySlider.value)
    }
    @IBAction func xSliderChanged(_ sender: AnyObject) {
        animateView()
        xLabel.text =  String(format: "x: %.1f", xSlider.value)
    }
    @IBAction func ySliderChanged(_ sender: AnyObject) {
        animateView()
        yLabel.text = String(format: "y: %.1f", ySlider.value)
    }
    
    
}

