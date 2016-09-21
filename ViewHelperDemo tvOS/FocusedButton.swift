//
//  FocusedButton.swift
//  VIiewHelper
//
//  Created by Melvin Rivera on 9/21/16.
//  Copyright © 2016 All Forces. All rights reserved.
//

import UIKit

@IBDesignable class FocusedButton: UIButton {
    
    @IBInspectable var focusedBackground:UIColor = UIColor(red:0.999, green:1, blue:1, alpha:1)
    @IBInspectable var unfocusedBackground:UIColor = UIColor(red:0.999, green:1, blue:1, alpha:1)
    @IBInspectable var highlightedBackground:UIColor = UIColor(red:0.999, green:1, blue:1, alpha:1)
    @IBInspectable var selectedBackground:UIColor = UIColor(red:0.635, green:0.635, blue:0.635, alpha:1)
    @IBInspectable var disabledBackground:UIColor = UIColor(red:0.953, green:0.953, blue:0.953, alpha:1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        
    }
    
    required  init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        layer.cornerRadius = 5
        
    }
    
    
    func buttonColors(focusedBackground:UIColor, unfocusedBackground:UIColor, highlightedBackground:UIColor, selectedBackground:UIColor, disabledBackground:UIColor) {
        self.focusedBackground = focusedBackground
        self.unfocusedBackground = unfocusedBackground
        self.highlightedBackground = highlightedBackground
        self.selectedBackground = selectedBackground
        self.disabledBackground = disabledBackground
        backgroundColor = unfocusedBackground
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator .addCoordinatedAnimations({ 
            self.updateDisplay()
            }, completion: nil)
    }
    
    func updateDisplay() {
        if self.isFocused {
            self.backgroundColor = self.focusedBackground
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            _ = self.shadow(UIColor.black,
                            offset: CGSize(width: 0, height: 28),
                            radius: 10,
                            opacity: 0.25,
                            isMasked: false)
            self.clipsToBounds = false
        }  else if self.isHighlighted {
            self.backgroundColor = self.highlightedBackground
            _ = self.shadow(UIColor.black,
                            offset: CGSize(width: 0, height: 14),
                            radius: 5,
                            opacity: 0.25,
                            isMasked: false)
            self.clipsToBounds = false
        }  else if self.isSelected {
            self.backgroundColor = self.selectedBackground
            self.transform =  CGAffineTransform.identity
            _ = self.shadow(UIColor.black,
                            offset: CGSize(width: 0, height: 7),
                            radius: 6,
                            opacity: 0.25,
                            isMasked: false)
            self.clipsToBounds = false
        }  else if !self.isEnabled {
            self.backgroundColor = self.disabledBackground
            _ = self.shadow(UIColor.black,
                            offset: CGSize(width: 0, height: 27),
                            radius: 10,
                            opacity: 0.25,
                            isMasked: true)
            self.clipsToBounds = true
        } else {
            self.transform = CGAffineTransform.identity
            self.backgroundColor = self.unfocusedBackground
            _ = self.shadow(UIColor.black,
                            offset: CGSize(width: 0, height: 7),
                            radius: 6,
                            opacity: 0.25,
                            isMasked: false)
            self.clipsToBounds = false
        }
    }

}
