AF-View-Additions 2.0
=============================

Convenience extension for UIVIew in Swift
Tested with Xcode 6.01

## About Auto Layout

Version 2.0 introduces lots of new convenience methods for dealing with AutoLayout. Check out the sample code to understand how to use it. The basic rule to remember is to have at least two vertical rules and two horizontal rules. Think of othe old way of doing frames as having left and width horizontal rules and top and height vertical rules. AutoLayout takes it a further by allowing these rules to be set in relation to other objects, not just it's superview. 

Learn more about AutoLayout at [developer.apple.com](https://developer.apple.com/library/IOs/documentation/UserExperience/Conceptual/AutolayoutPG/Introduction/Introduction.html)


![Sample Project Screenshot](Screenshot.png?raw=true "Sample Project Screenshot")


### Position
```Swift

// Pins top to the top left of the superview or frame.origin 
func origin() -> CGPoint 
func origin(constant: CGPoint) -> [NSLayoutConstraint]?


// Pints left to superview's left or frame.origin.x
func left() -> CGFloat 
func left(constant: CGFloat) -> NSLayoutConstraint?

// Pins leading to superview's leading or frame.origin.x
func leading() -> CGFloat 
func leading(constant: CGFloat) -> NSLayoutConstraint?

// Pins right to superview's right or frame.origin.x
func right() -> CGFloat
func right(frameRight: CGFloat)

// Pins trailing to superview's trailing or frame.origin.x
func trailing() -> CGFloat
func trailing(frameRight: CGFloat)

// Pins top to superview's top or frame.origin.y
func top() -> CGFloat 
func top(constant: CGFloat) -> NSLayoutConstraint?

// Pins bottom to superview's bottom or frame.origin.y
func bottom() -> CGFloat 
func bottom(constant: CGFloat) -> NSLayoutConstraint?

```

### Content
```Swift

// Content Compression Resistance Priority
func horizontalCompression() -> Float 
func horizontalCompression(priority: Float)
func verticalCompression() -> Float
func verticalCompression(priority: Float)

// Content Hugging Priority
func horizontalHugging() -> Float 
func horizontalHugging(priority: Float) 
func verticalHugging() -> Float 
func verticalHugging(priority: Float)


```


### Size
```Swift

// Pins size to itself or frame.size
func size() -> CGSize { return frame.size }
func size(constant: CGSize) -> [NSLayoutConstraint]?

// Pins width to self or frame.size.width
func width() -> CGFloat 
func width(constant: CGFloat) -> NSLayoutConstraint?

// Pins height to self or frame.size.height
func height() -> CGFloat
func height(constant: CGFloat) -> NSLayoutConstraint?

// Pins minimum to self
func setMinimumSize(size:CGSize) -> [NSLayoutConstraint]?
func setMinimumWidth(constant:CGFloat) -> NSLayoutConstraint?
func setMinimumHeight(constant:CGFloat) -> NSLayoutConstraint?
// Pins maximun to self
func setMaximumSize(size:CGSize) -> [NSLayoutConstraint]?
func setMaximumWidth(constant:CGFloat) -> NSLayoutConstraint?
func setMaximumHeight(constant:CGFloat) -> NSLayoutConstraint?
// Returns smallest side length
func smallestSideLength() -> CGFloat
// Returns largest side length
func largestSideLength() -> CGFloat
```

### Center
```Swift
// Centers in superview
func centerInSuperview(constant:CGSize = CGSize(width: 0, height: 0)) -> [NSLayoutConstraint]?
// Centers horizontally in superview
func centerHorizontally(constant: CGFloat = 0) -> NSLayoutConstraint?
// Centers vertically in superview
func centerVertically(constant: CGFloat = 0) -> NSLayoutConstraint?
```

### Pin
```Swift
// Pins an attribute to an attribute of another item
func pin(pinAttribute:NSLayoutAttribute, to peerItem:AnyObject? = nil, attribute toAttribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint?
// Pins Center to another item
func pinCenterTo(peerItem:AnyObject, constant:CGFloat = 0, multiplier:CGFloat = 1) -> [NSLayoutConstraint]?
// Pins size to another item
func pinSizeTo(peerItem:AnyObject, constant:CGFloat = 0, multiplier:CGFloat = 1) -> [NSLayoutConstraint]?
// Pins the height to the width
func pinHeightToWidth() -> NSLayoutConstraint?
// Pins the width to the height
func pinWidthToHeight() -> NSLayoutConstraint?
```

### Space subviews
```Swift
// Space subviews evenly and inserts dynamically sized spacers in between
func spaceSubviewsEvenly(views:[UIView], size: CGSize, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY) -> [NSLayoutConstraint]?
// Spaces subviews next to each other using VisualFormat
func spaceSubviews(views:[UIView], spacing:CGFloat = 0, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY) -> [NSLayoutConstraint]?
// Align subviews along an axis
func alignSubviews(views:[UIView], axis:UILayoutConstraintAxis) -> [NSLayoutConstraint]
```

### Removing Constraints
```Swift
// Removes constraints recusevely
func removeConstraintsFromViewAndRelatedView(#constraints:[NSLayoutConstraint])

```

### Border
```Swift

// convenience for: UIColor(CGColor: layer.borderColor)
func borderColor() -> UIColor
func borderColor(borderColor: UIColor)

// convenience for: layer.borderWidth
func borderWidth()
func borderWidth(borderWidth: CGFloat)

// applies a stroked border
func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?)

```

### Rounded Corner
```Swift


// convenience for: layer.cornerRadius
func cornerRadius() -> CGFloat
func cornerRadius(cornerRadius: CGFloat)

// rounds corners to circle
func roundCornersToCircle()

// rounds corners to circle with border
func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat)

// rounds corner to a radius amount with border
func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?)

```

### Shadow
```Swift

// convenience for: UIColor(CGColor: layer.shadowColor)
func shadowColor() -> UIColor 
func shadowColor(shadowColor: UIColor)

// convenience for: layer.shadowOffset
func shadowOffset() -> CGSize
func shadowOffset(shadowOffset: CGSize)

// convenience for: layer.shadowOpacity
func shadowOpacity() -> Float
func shadowOpacity(shadowOpacity: Float)

// convenience for: layer.shadowRadius
func shadowRadius() -> CGFloat
func shadowRadius(shadowRadius: CGFloat)

// sets all shadow properties in one call
func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false)



### Autolayout
```Swift
func prepForAnimation()
// sets setTranslatesAutoresizingMaskIntoConstraints to true
```
