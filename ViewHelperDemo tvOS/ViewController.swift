//
//  ViewController.swift
//  ViewHelperDemo tvOS
//
//  Created by Melvin Rivera on 9/16/16.
//  Copyright © 2016 All Forces. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedAnimation: Int = 0
    var selectedEasing: Int = 0
    
    @IBOutlet weak var mainBox: AFInspectableView!
    @IBOutlet weak var bigCircle: AFInspectableView!
    @IBOutlet weak var smallCircle: AFInspectableView!
    
    
    @IBOutlet weak var forceProgress: UIProgressView!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var durationProgress: UIProgressView!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var delayProgress: UIProgressView!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var scaleProgress: UIProgressView!
    @IBOutlet weak var scaleLabel: UILabel!
    
    @IBOutlet weak var rotateProgress: UIProgressView!
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var dampingProgress: UIProgressView!
    @IBOutlet weak var dampingLabel: UILabel!
    
    @IBOutlet weak var velocityProgress: UIProgressView!
    @IBOutlet weak var velocityLabel: UILabel!
    
    @IBOutlet weak var xPointProgress: UIProgressView!
    @IBOutlet weak var xPointLabel: UILabel!
    
    @IBOutlet weak var yPointProgress: UIProgressView!
    @IBOutlet weak var yPointLabel: UILabel!
    
    @IBOutlet var stepperButtons: [FocusedButton]!
 
    
    struct AnimationProperty {
        var minValue:Float
        var maxValue:Float
        var defaultValue:Float
        var stepValue:Float
        init (min:Float, max:Float, defaultValue:Float, step:Float) {
            minValue = min
            maxValue = max
            self.defaultValue = defaultValue
            currentValue = defaultValue
            stepValue = step
        }
        var currentValue:Float {
            didSet {
                currentValue = max(min(currentValue, maxValue), minValue)
            }
        }
        var percentageValue:Float {
            get { return  (currentValue - minValue) / (maxValue - minValue) }
        }
    }
    
    
    var force = AnimationProperty(min: 1, max: 5, defaultValue: 1, step: 1)
    var duration = AnimationProperty(min: 0.5, max: 5, defaultValue: 0.5, step: 0.5)
    var delay = AnimationProperty(min: 0, max: 5, defaultValue: 0, step: 0.5)
    var scale = AnimationProperty(min: 1, max: 5, defaultValue: 1, step: 1)
    var rotate = AnimationProperty(min: 0, max: 5, defaultValue: 0, step: 1)
    var damping = AnimationProperty(min: 0, max: 1, defaultValue: 0.7, step: 0.1)
    var velocity = AnimationProperty(min: 0, max: 1, defaultValue: 0.7, step: 0.1)
    var xPoint = AnimationProperty(min: 0, max: 300, defaultValue: 0, step: 20)
    var yPoint = AnimationProperty(min: 0, max: 300, defaultValue: 0, step: 20)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
 
        Setting up some views by code to demnstrate how to add a view with constraints.
         */
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
        
        for button in stepperButtons {
            button.buttonColors(focused: UIColor.lightGray, unfocused: UIColor.white)
        }
        
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        layoutView()
    }
    
    func layoutView()
    {
        view.layoutIfNeeded()
        bigCircle.cornerRadius = bigCircle.width()/2
        smallCircle.cornerRadius = smallCircle.width()/2
    }


    
    @IBAction func resetValues(_ sender: AnyObject? = nil) {
        
        force.currentValue = force.defaultValue
        updateForceUI()
        
        duration.currentValue = duration.defaultValue
        updateDurationUI()
        
        delay.currentValue = delay.defaultValue
        updateDelayUI()
        
        scale.currentValue = scale.defaultValue
        updateScaleUI()
        
        rotate.currentValue = rotate.defaultValue
        updateRotateUI()
        
        damping.currentValue = damping.defaultValue
        updateDampingUI()
        
        velocity.currentValue = velocity.defaultValue
        updateVelocityUI()
        
        xPoint.currentValue = xPoint.defaultValue
        updateXPointUI()
        
        yPoint.currentValue = yPoint.defaultValue
        updateYPointUI()
        
    }
    
    @IBAction func animateView(_ sender: AnyObject? = nil) {
        bigCircle.animate(AnimationType.allValues[selectedAnimation],
                          curve: AnimationEasingCurve.allValues[selectedEasing],
                          duration: CGFloat(duration.currentValue),
                          delay: CGFloat(delay.currentValue),
                          force: CGFloat(force.currentValue),
                          damping: CGFloat(damping.currentValue),
                          velocity: CGFloat(velocity.currentValue),
                          fromRotation: CGFloat(rotate.currentValue),
                          fromScale: CGFloat(scale.currentValue),
                          fromX: CGFloat(xPoint.currentValue),
                          fromY: CGFloat(yPoint.currentValue))
    }
    
    @IBAction func forceAction(sender: UIButton) {
        force.currentValue = sender.titleLabel!.text == "▶" ? force.currentValue + force.stepValue : force.currentValue - force.stepValue
        updateForceUI()
        animateView()
        
    }
    func updateForceUI() {
        forceProgress.setProgress(force.percentageValue, animated: true)
        forceLabel.text = String(format: "Force: %.1f", force.currentValue)
    }
    
    @IBAction func durationAction(sender: UIButton) {
        duration.currentValue = sender.titleLabel!.text == "▶" ? duration.currentValue + duration.stepValue : duration.currentValue - duration.stepValue
        updateDurationUI()
        animateView()
    }
    func updateDurationUI() {
        durationProgress.setProgress(duration.percentageValue, animated: true)
        durationLabel.text = String(format: "Duration: %.1f", duration.currentValue)
    }
   
    @IBAction func delayAction(sender: UIButton) {
        delay.currentValue = sender.titleLabel!.text == "▶" ? delay.currentValue + delay.stepValue : delay.currentValue - delay.stepValue
        updateDelayUI()
        animateView()
    }
    func updateDelayUI() {
        delayProgress.setProgress(delay.percentageValue, animated: true)
        delayLabel.text = String(format: "Delay: %.1f", delay.currentValue)
    }
    
    @IBAction func scaleAction(sender: UIButton) {
        scale.currentValue = sender.titleLabel!.text == "▶" ? scale.currentValue + scale.stepValue : scale.currentValue - scale.stepValue
        updateScaleUI()
        animateView()
    }
    func updateScaleUI() {
        scaleProgress.setProgress(scale.percentageValue, animated: true)
        scaleLabel.text = String(format: "Scale: %.1f", scale.currentValue)
    }
    
    @IBAction func rotateAction(sender: UIButton) {
        rotate.currentValue = sender.titleLabel!.text == "▶" ? rotate.currentValue + rotate.stepValue : rotate.currentValue - rotate.stepValue
        updateRotateUI()
        animateView()
    }
    func updateRotateUI() {
        rotateProgress.setProgress(rotate.percentageValue, animated: true)
        rotateLabel.text = String(format: "Rotate: %.1f", rotate.currentValue)
    }

    @IBAction func dampingAction(sender: UIButton) {
        damping.currentValue = sender.titleLabel!.text == "▶" ? damping.currentValue + damping.stepValue : damping.currentValue - damping.stepValue
        updateDampingUI()
        animateView()
    }
    func updateDampingUI() {
        dampingProgress.setProgress(damping.percentageValue, animated: true)
        dampingLabel.text = String(format: "Damping: %.1f", damping.currentValue)
    }
    
    @IBAction func velocityAction(sender: UIButton) {
        velocity.currentValue = sender.titleLabel!.text == "▶" ? velocity.currentValue + velocity.stepValue : velocity.currentValue - velocity.stepValue
        updateVelocityUI()
        animateView()
    }
    func updateVelocityUI() {
        velocityProgress.setProgress(velocity.percentageValue, animated: true)
        velocityLabel.text = String(format: "Velocity: %.1f", velocity.currentValue)
    }
    
    @IBAction func xAction(sender: UIButton) {
        xPoint.currentValue = sender.titleLabel!.text == "▶" ? xPoint.currentValue + xPoint.stepValue : xPoint.currentValue - xPoint.stepValue
        updateXPointUI()
        animateView()
    }
    func updateXPointUI() {
        xPointProgress.setProgress(xPoint.percentageValue, animated: true)
        xPointLabel.text = String(format: "X: %.1f", xPoint.currentValue)
    }
    
    @IBAction func yAction(sender: UIButton) {
        yPoint.currentValue = sender.titleLabel!.text == "▶" ? yPoint.currentValue + yPoint.stepValue : yPoint.currentValue - yPoint.stepValue
        updateYPointUI()
        animateView()
    }
    func updateYPointUI() {
        yPointProgress.setProgress(yPoint.percentageValue, animated: true)
        yPointLabel.text = String(format: "Y: %.1f", yPoint.currentValue)
    }
    
    
     // MARK: TableView
    
    
    
    
    /*
 

 
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
 }*/

}

