//
//  ViewController.swift
//  ViewHelperDemo tvOS
//
//  Created by Melvin Rivera on 9/16/16.
//  Copyright © 2016 All Forces. All rights reserved.
//

import UIKit

let selectedAnimationKey = "selectedAnimation"
let selectedEasingCurveKey = "selectedEasingCurve"

class ViewController: UIViewController {
    
    var selectedAnimation: Int = 0
    var selectedEasingCurve: Int = 0
    
    @IBOutlet weak var mainBox: InspectableView!
    @IBOutlet weak var bigCircle: InspectableView!
    @IBOutlet weak var smallCircle: InspectableView!
    
    
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var rotateLabel: UILabel!
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var xPointLabel: UILabel!
    @IBOutlet weak var yPointLabel: UILabel!
    
    @IBOutlet weak var animation: UIButton!
    @IBOutlet weak var curve: UIButton!
    
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
    var xPoint = AnimationProperty(min: -1000, max: 1000, defaultValue: 0, step: 50)
    var yPoint = AnimationProperty(min: -1000, max: 1000, defaultValue: 0, step: 50)


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
        
        UserDefaults.standard.addObserver(self, forKeyPath: selectedAnimationKey, options: NSKeyValueObservingOptions.new, context: nil)
        UserDefaults.standard.addObserver(self, forKeyPath: selectedEasingCurveKey, options: NSKeyValueObservingOptions.new, context: nil)
        
        resetValues()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == selectedAnimationKey {
            updateAnimationUI()
        } else {
            updateEasingCurveUI()
        }
        animateView()
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
        
        selectedAnimation = 0
        selectedEasingCurve = 0
        UserDefaults.standard.set(selectedAnimation, forKey: selectedAnimationKey)
        UserDefaults.standard.set(selectedEasingCurve, forKey: selectedAnimationKey)
        UserDefaults.standard.synchronize()
        updateAnimationUI()
        updateEasingCurveUI()
        
    }
    
    @IBAction func animateView(_ sender: AnyObject? = nil) {
        bigCircle.animate(AnimationType.allValues[selectedAnimation],
                          curve: AnimationEasingCurve.allValues[selectedEasingCurve],
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
        force.currentValue = sender.titleLabel!.text == "+" ? force.currentValue + force.stepValue : force.currentValue - force.stepValue
        updateForceUI()
        animateView()
    }
    func updateForceUI() {
        forceLabel.text = String(format: "%.1f", force.currentValue)
    }
    
    @IBAction func durationAction(sender: UIButton) {
        duration.currentValue = sender.titleLabel!.text == "+" ? duration.currentValue + duration.stepValue : duration.currentValue - duration.stepValue
        updateDurationUI()
        animateView()
    }
    func updateDurationUI() {
        durationLabel.text = String(format: "%.1f", duration.currentValue)
    }
   
    @IBAction func delayAction(sender: UIButton) {
        delay.currentValue = sender.titleLabel!.text == "+" ? delay.currentValue + delay.stepValue : delay.currentValue - delay.stepValue
        updateDelayUI()
        animateView()
    }
    func updateDelayUI() {
        delayLabel.text = String(format: "%.1f", delay.currentValue)
    }
    
    @IBAction func scaleAction(sender: UIButton) {
        scale.currentValue = sender.titleLabel!.text == "+" ? scale.currentValue + scale.stepValue : scale.currentValue - scale.stepValue
        updateScaleUI()
        animateView()
    }
    func updateScaleUI() {
        scaleLabel.text = String(format: "%.1f", scale.currentValue)
    }
    
    @IBAction func rotateAction(sender: UIButton) {
        rotate.currentValue = sender.titleLabel!.text == "+" ? rotate.currentValue + rotate.stepValue : rotate.currentValue - rotate.stepValue
        updateRotateUI()
        animateView()
    }
    func updateRotateUI() {
        rotateLabel.text = String(format: "%.1f", rotate.currentValue)
    }

    @IBAction func dampingAction(sender: UIButton) {
        damping.currentValue = sender.titleLabel!.text == "+" ? damping.currentValue + damping.stepValue : damping.currentValue - damping.stepValue
        updateDampingUI()
        animateView()
    }
    func updateDampingUI() {
        dampingLabel.text = String(format: "%.1f", damping.currentValue)
    }
    
    @IBAction func velocityAction(sender: UIButton) {
        velocity.currentValue = sender.titleLabel!.text == "+" ? velocity.currentValue + velocity.stepValue : velocity.currentValue - velocity.stepValue
        updateVelocityUI()
        animateView()
    }
    func updateVelocityUI() {
        velocityLabel.text = String(format: "%.1f", velocity.currentValue)
    }
    
    @IBAction func xAction(sender: UIButton) {
        xPoint.currentValue = sender.titleLabel!.text == "+" ? xPoint.currentValue + xPoint.stepValue : xPoint.currentValue - xPoint.stepValue
        updateXPointUI()
        animateView()
    }
    func updateXPointUI() {
        xPointLabel.text = String(format: "%.1f", xPoint.currentValue)
    }
    
    @IBAction func yAction(sender: UIButton) {
        yPoint.currentValue = sender.titleLabel!.text == "+" ? yPoint.currentValue + yPoint.stepValue : yPoint.currentValue - yPoint.stepValue
        updateYPointUI()
        animateView()
    }
    func updateYPointUI() {
        yPointLabel.text = String(format: "%.1f", yPoint.currentValue)
    }
    
    func updateAnimationUI() {
        selectedAnimation = UserDefaults.standard.integer(forKey: selectedAnimationKey)
        animation.setTitle("Animation: \(AnimationType.allValues[selectedAnimation]) ⋯", for: .normal)
    }
    
    func updateEasingCurveUI() {
        selectedEasingCurve = UserDefaults.standard.integer(forKey: selectedEasingCurveKey)
        curve.setTitle("Curve: \(AnimationEasingCurve.allValues[selectedEasingCurve]) ⋯", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! TableViewController
        if segue.identifier == "Animation" {
            controller.items = AnimationType.allValues.map { $0.description }
            controller.selected = selectedAnimation
            controller.title = selectedAnimationKey
        } else {
            controller.items = AnimationEasingCurve.allValues.map { $0.description }
            controller.selected = selectedEasingCurve
            controller.title = selectedEasingCurveKey
        }
        
    }
    
    func updateUIFromTableViewControllerAction(){
        
    }

    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("here")
        let controller = segue.source as! TableViewController
        if controller.title == selectedAnimationKey {
            selectedAnimation = controller.selected
            updateAnimationUI()
        } else {
            selectedEasingCurve = controller.selected
            updateEasingCurveUI()
        }
    }
    

}

