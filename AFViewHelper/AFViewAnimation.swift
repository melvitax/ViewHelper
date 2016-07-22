//
//  AFViewAnimation.swift
//
//  AFViewExtension: Version 4.1.0
//
//  Created by Melvin Rivera on 11/23/15.
//  https://github.com/melvitax/AFViewHelper
//

import Foundation
import UIKit

/**
 A preset animation behavior.
 */
enum AnimationType {
    case SlideLeft, SlideRight, SlideDown, SlideUp, SqueezeLeft, SqueezeRight, SqueezeDown, SqueezeUp, FadeIn, FadeOut, FadeOutIn, FadeInLeft, FadeInRight, FadeInDown, FadeInUp, ZoomIn, ZoomOut, Fall, Shake, Pop, FlipX, FlipY, Morph, Squeeze, Flash, Wobble, Swing
    static let allValues = [Shake, Pop, Morph, Squeeze, Wobble, Swing, FlipX, FlipY, Fall, SqueezeLeft, SqueezeRight, SqueezeDown, SqueezeUp, SlideLeft, SlideRight, SlideDown, SlideUp,  FadeIn, FadeOut, FadeOutIn, FadeInLeft, FadeInRight, FadeInDown, FadeInUp, ZoomIn, ZoomOut, Flash]
}

/**
 Easing curve to be used in animation.
 */
enum AnimationEasingCurve {
    case EaseIn, EaseOut, EaseInOut, Linear, EaseInSine, EaseOutSine, EaseInOutSine, EaseInQuad, EaseOutQuad, EaseInOutQuad, EaseInCubic, EaseOutCubic, EaseInOutCubic, EaseInQuart, EaseOutQuart, EaseInOutQuart, EaseInQuint, EaseOutQuint, EaseInOutQuint, EaseInExpo, EaseOutExpo, EaseInOutExpo, EaseInCirc, EaseOutCirc, EaseInOutCirc, EaseInBack, EaseOutBack, EaseInOutBack, Spring
    static let allValues = [EaseIn, EaseOut, EaseInOut, Linear, EaseInSine, EaseOutSine, EaseInOutSine, EaseInQuad, EaseOutQuad, EaseInOutQuad, EaseInCubic, EaseOutCubic, EaseInOutCubic, EaseInQuart, EaseOutQuart, EaseInOutQuart, EaseInQuint, EaseOutQuint, EaseInOutQuint, EaseInExpo, EaseOutExpo, EaseInOutExpo, EaseInCirc, EaseOutCirc, EaseInOutCirc, EaseInBack, EaseOutBack, EaseInOutBack, Spring]
    var timingFunction:CAMediaTimingFunction {
        switch self {
        case .EaseIn: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        case .EaseOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        case .EaseInOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        case .Linear: return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        case .EaseInSine: return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
        case .EaseOutSine: return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
        case .EaseInOutSine: return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        case .EaseInQuad: return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
        case .EaseOutQuad: return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
        case .EaseInOutQuad: return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        case .EaseInCubic: return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
        case .EaseOutCubic: return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
        case .EaseInOutCubic: return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
        case .EaseInQuart: return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
        case .EaseOutQuart: return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        case .EaseInOutQuart: return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        case .EaseInQuint: return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
        case .EaseOutQuint: return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
        case .EaseInOutQuint: return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
        case .EaseInExpo: return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
        case .EaseOutExpo: return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        case .EaseInOutExpo: return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
        case .EaseInCirc: return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
        case .EaseOutCirc: return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
        case .EaseInOutCirc: return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
        case .EaseInBack: return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
        case .EaseOutBack: return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
        case .EaseInOutBack: return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
        case .Spring: return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(1/3), 1, 1)
        }
    }
    var animationOption:UIViewAnimationOptions {
        switch self {
        case .EaseIn: return UIViewAnimationOptions.CurveEaseIn
        case .EaseOut: return UIViewAnimationOptions.CurveEaseOut
        case .EaseInOut: return UIViewAnimationOptions.CurveEaseInOut
        default: return UIViewAnimationOptions.CurveLinear
        }
    }
}

extension UIView {
    
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
    
    func animate(animationType:AnimationType, curve:AnimationEasingCurve, duration:CGFloat = 1, delay:CGFloat = 0, force:CGFloat = 1, damping:CGFloat = 0.7, velocity:CGFloat = 0.7, distance:CGFloat = 300.0, fromRotation:CGFloat = 0, fromScale:CGFloat = 1, fromX:CGFloat = 0, fromY:CGFloat = 0, completion: AnimationCompletionHandler? = nil)
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
        case .SlideLeft:
            x = distance*force
        case .SlideRight:
            x = -distance*force
        case .SlideDown:
            y = -distance*force
        case .SlideUp:
            y = distance*force
        case .SqueezeLeft:
            x = distance
            scaleX = 3*force
        case .SqueezeRight:
            x = -distance
            scaleX = 3*force
        case .SqueezeDown:
            y = -distance
            scaleY = 3*force
        case .SqueezeUp:
            y = distance
            scaleY = 3*force
        case .FadeIn:
            opacity = 0
        case .FadeOut:
            animateFromInitialState = false
            opacity = 0
        case .FadeOutIn:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.autoreverses = true
            layer.addAnimation(animation, forKey: "fade")
        case .FadeInLeft:
            opacity = 0
            x = distance*force
        case .FadeInRight:
            x = -distance*force
            opacity = 0
        case .FadeInDown:
            y = -distance*force
            opacity = 0
        case .FadeInUp:
            y = distance*force
            opacity = 0
        case .ZoomIn:
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .ZoomOut:
            animateFromInitialState = false
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .Fall:
            animateFromInitialState = false
            rotate = 15 * CGFloat(M_PI/180)
            y = distance*force
        case .Shake:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 30*force, -30*force, 30*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "shake")
        case .Pop:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "pop")
        case .FlipX:
            rotate = 0
            scaleX = 1
            scaleY = 1
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.addAnimation(animation, forKey: "3d")
        case .FlipY:
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.addAnimation(animation, forKey: "3d")
        case .Morph:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case .Squeeze:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.5, 1, 0.5, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case .Flash:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = CFTimeInterval(duration)
            animation.repeatCount = repeatCount * 2.0
            animation.autoreverses = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "flash")
        case .Wobble:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "wobble")
            
            let x = CAKeyframeAnimation()
            x.keyPath = "position.x"
            x.values = [0, 30*force, -30*force, 30*force, 0]
            x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            x.timingFunction = curve.timingFunction
            x.duration = CFTimeInterval(duration)
            x.additive = true
            x.repeatCount = repeatCount
            x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(x, forKey: "x")
        case .Swing:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "swing")
        }
        
        if animateFromInitialState {
            let translate = CGAffineTransformMakeTranslation(x, y)
            let scale = CGAffineTransformMakeScale(scaleX, scaleY)
            let rotate = CGAffineTransformMakeRotation(rotate)
            let translateAndScale = CGAffineTransformConcat(translate, scale)
            self.transform = CGAffineTransformConcat(rotate, translateAndScale)
            alpha = opacity
        }
        
        UIView.animateWithDuration( NSTimeInterval(duration),
                                    delay: NSTimeInterval(delay),
                                    usingSpringWithDamping: damping,
                                    initialSpringVelocity: velocity,
                                    options: [curve.animationOption, UIViewAnimationOptions.AllowUserInteraction],
                                    animations: { [weak self] in
                                        if let _self = self {
                                            if animateFromInitialState {
                                                _self.transform = CGAffineTransformIdentity
                                                _self.alpha = 1
                                            } else {
                                                let translate = CGAffineTransformMakeTranslation(x, y)
                                                let scale = CGAffineTransformMakeScale(scaleX, scaleY)
                                                let rotate = CGAffineTransformMakeRotation(rotate)
                                                let translateAndScale = CGAffineTransformConcat(translate, scale)
                                                _self.transform = CGAffineTransformConcat(rotate, translateAndScale)
                                                _self.alpha = opacity
                                            }
                                        }
            }, completion: { finished in
                completion?()
        })
    }
}