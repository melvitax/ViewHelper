//
//  ViewAnimation.swift
//  ViewHelper: Version 4.2.4
//  Created by Melvin Rivera on 11/23/15.
//  https://github.com/melvitax/ViewHelper
//

import Foundation
import UIKit

/**
 A preset animation behavior.
 */
public enum AnimationType {
    case slideLeft, slideRight, slideDown, slideUp, squeezeLeft, squeezeRight, squeezeDown, squeezeUp, fadeIn, fadeOut, fadeOutIn, fadeInLeft, fadeInRight, fadeInDown, fadeInUp, zoomIn, zoomOut, fall, shake, pop, flipX, flipY, morph, squeeze, flash, wobble, swing
    static let allValues = [shake, pop, morph, squeeze, wobble, swing, flipX, flipY, fall, squeezeLeft, squeezeRight, squeezeDown, squeezeUp, slideLeft, slideRight, slideDown, slideUp,  fadeIn, fadeOut, fadeOutIn, fadeInLeft, fadeInRight, fadeInDown, fadeInUp, zoomIn, zoomOut, flash]
    var description: String {
        get {
            return String(describing: self)
        }
    }
}

/**
 Easing curve to be used in animation.
 */
public enum AnimationEasingCurve {
    case easeIn, easeOut, easeInOut, linear, easeInSine, easeOutSine, easeInOutSine, easeInQuad, easeOutQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, easeInQuint, easeOutQuint, easeInOutQuint, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc, easeInBack, easeOutBack, easeInOutBack, spring
    static let allValues = [easeIn, easeOut, easeInOut, linear, easeInSine, easeOutSine, easeInOutSine, easeInQuad, easeOutQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, easeInQuint, easeOutQuint, easeInOutQuint, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc, easeInBack, easeOutBack, easeInOutBack, spring]
    var timingFunction:CAMediaTimingFunction {
        switch self {
        case .easeIn: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        case .easeOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        case .easeInOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        case .linear: return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        case .easeInSine: return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
        case .easeOutSine: return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
        case .easeInOutSine: return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        case .easeInQuad: return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
        case .easeOutQuad: return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
        case .easeInOutQuad: return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        case .easeInCubic: return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
        case .easeOutCubic: return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
        case .easeInOutCubic: return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
        case .easeInQuart: return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
        case .easeOutQuart: return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        case .easeInOutQuart: return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        case .easeInQuint: return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
        case .easeOutQuint: return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
        case .easeInOutQuint: return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
        case .easeInExpo: return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
        case .easeOutExpo: return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        case .easeInOutExpo: return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
        case .easeInCirc: return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
        case .easeOutCirc: return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
        case .easeInOutCirc: return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
        case .easeInBack: return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
        case .easeOutBack: return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
        case .easeInOutBack: return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
        case .spring: return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(1/3), 1, 1)
        }
    }
    var animationOption:UIViewAnimationOptions {
        switch self {
        case .easeIn: return UIViewAnimationOptions.curveEaseIn
        case .easeOut: return UIViewAnimationOptions.curveEaseOut
        case .easeInOut: return UIViewAnimationOptions()
        default: return UIViewAnimationOptions.curveLinear
        }
    }
    var description: String {
        get {
            return String(describing: self)
        }
    }
}

public extension UIView {
    
    typealias AnimationCompletionHandler = () -> Void
    
    /**
     Animates using a predermined animation type and provides optional properties for customization.
     
     - Parameter animationType: The Animation type to use.
     - Parameter curve: The animation easing curve.
     - Parameter duration: The duration of the animation.
     - Parameter delay: The delay before animation begins.
     - Parameter force: The force of the movement.
     - Parameter damping: The damping of the force.
     - Parameter velocity: The velocity of the movement.
     - Parameter distance: The distance that it travels, like in the case of SlideLeft
     - Parameter fromRotation: The starting rotation.
     - Parameter fromScale: The starting scale.
     - Parameter fromX: The starting x offset.
     - Parameter fromY: The starting y offset.
     - Parameter completion: The completion handler that runs after animation is complete.
     */
    
    func animate(_ animationType:AnimationType, curve:AnimationEasingCurve, duration:CGFloat = 1, delay:CGFloat = 0, force:CGFloat = 1, damping:CGFloat = 0.7, velocity:CGFloat = 0.7, distance:CGFloat = 300.0, fromRotation:CGFloat = 0, fromScale:CGFloat = 1, fromX:CGFloat = 0, fromY:CGFloat = 0, completion: AnimationCompletionHandler? = nil)
    {
        var scaleX = fromScale
        var scaleY = fromScale
        var opacity:CGFloat = 0
        let repeatCount:Float = 1
        var rotate = fromRotation
        var x = fromX
        var y = fromY
        
        var animateFromInitialState = true
        
        alpha = 0.99
        
        switch animationType {
        case .slideLeft:
            x = distance*force
        case .slideRight:
            x = -distance*force
        case .slideDown:
            y = -distance*force
        case .slideUp:
            y = distance*force
        case .squeezeLeft:
            x = distance
            scaleX = 3*force
        case .squeezeRight:
            x = -distance
            scaleX = 3*force
        case .squeezeDown:
            y = -distance
            scaleY = 3*force
        case .squeezeUp:
            y = distance
            scaleY = 3*force
        case .fadeIn:
            opacity = 0
        case .fadeOut:
            animateFromInitialState = false
            opacity = 0
        case .fadeOutIn:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.autoreverses = true
            layer.add(animation, forKey: "fade")
        case .fadeInLeft:
            opacity = 0
            x = distance*force
        case .fadeInRight:
            x = -distance*force
            opacity = 0
        case .fadeInDown:
            y = -distance*force
            opacity = 0
        case .fadeInUp:
            y = distance*force
            opacity = 0
        case .zoomIn:
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .zoomOut:
            animateFromInitialState = false
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .fall:
            animateFromInitialState = false
            rotate = 15 * CGFloat(M_PI/180)
            y = distance*force
        case .shake:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 30*force, -30*force, 30*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.isAdditive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(animation, forKey: "shake")
        case .pop:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.isAdditive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(animation, forKey: "pop")
        case .flipX:
            rotate = 0
            scaleX = 1
            scaleY = 1
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(caTransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(caTransform3D:
                CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.add(animation, forKey: "3d")
        case .flipY:
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(caTransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(caTransform3D:
                CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.add(animation, forKey: "3d")
        case .morph:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(morphY, forKey: "morphY")
        case .squeeze:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.5, 1, 0.5, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(morphY, forKey: "morphY")
        case .flash:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = CFTimeInterval(duration)
            animation.repeatCount = repeatCount * 2.0
            animation.autoreverses = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(animation, forKey: "flash")
        case .wobble:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.isAdditive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(animation, forKey: "wobble")
            
            let x = CAKeyframeAnimation()
            x.keyPath = "position.x"
            x.values = [0, 30*force, -30*force, 30*force, 0]
            x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            x.timingFunction = curve.timingFunction
            x.duration = CFTimeInterval(duration)
            x.isAdditive = true
            x.repeatCount = repeatCount
            x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(x, forKey: "x")
        case .swing:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.isAdditive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.add(animation, forKey: "swing")
        }
        
        if animateFromInitialState {
            let translate = CGAffineTransform(translationX: x, y: y)
            let scale = CGAffineTransform(scaleX: scaleX, y: scaleY)
            let rotate = CGAffineTransform(rotationAngle: rotate)
            let translateAndScale = translate.concatenating(scale)
            self.transform = rotate.concatenating(translateAndScale)
            alpha = opacity
        }
        
        UIView.animate( withDuration: TimeInterval(duration),
                                    delay: TimeInterval(delay),
                                    usingSpringWithDamping: damping,
                                    initialSpringVelocity: velocity,
                                    options: [curve.animationOption, UIViewAnimationOptions.allowUserInteraction],
                                    animations: { [weak self] in
                                        if let _self = self {
                                            if animateFromInitialState {
                                                _self.transform = CGAffineTransform.identity
                                                _self.alpha = 1
                                            } else {
                                                let translate = CGAffineTransform(translationX: x, y: y)
                                                let scale = CGAffineTransform(scaleX: scaleX, y: scaleY)
                                                let rotate = CGAffineTransform(rotationAngle: rotate)
                                                let translateAndScale = translate.concatenating(scale)
                                                _self.transform = rotate.concatenating(translateAndScale)
                                                _self.alpha = opacity
                                            }
                                        }
            }, completion: { finished in
                completion?()
        })
    }
}
