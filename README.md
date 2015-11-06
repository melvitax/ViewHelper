# AFViewHelper

[![Version](https://img.shields.io/cocoapods/v/AFViewHelper.svg?style=flat)](http://cocoapods.org/pods/AFViewHelper)
[![License](https://img.shields.io/cocoapods/l/AFViewHelper.svg?style=flat)](http://cocoapods.org/pods/AFViewHelper)
[![Platform](https://img.shields.io/cocoapods/p/AFViewHelper.svg?style=flat)](http://cocoapods.org/pods/AFViewHelper)


Convenience UIVIew Extension for Swift 2.0


![Sample Project Screenshot](https://raw.githubusercontent.com/melvitax/AFViewHelper/master/Screenshot.png?raw=true "Sample Project Screenshot")

## AFViewHelper at a Glance

### Auto Layout 

```swift
let box = UIView(autoLayout:true)
view.addSubview(box)
box.backgroundColor = UIColor.redColor()
box.width(100)
box.height(100)
box.center(to: view)
view.layoutIfNeeded()
```

### Chainable functions

100 pixel view pinned to the center of another view

```swift
view.width(100).height(100).center(to: view)
```

### Compression & Hugging

```swift
view.horizontalCompressionPriority(UILayoutPriorityDefaultHigh)
view.horizontalHuggingPriority(UILayoutPriorityDefaultLow)
```

### NSLayoutConstraints

You can have access to the NSLayoutConstraints by using pin() or applyAttribute.

```swift
// Pinning to an item
let widthConstraint = view.pin(.Width, to: view, attribute: .Height, constant: 0, multiplier: 0.5, relation: .LessThanOrEqual)
```

```swift
// Applying an attribute
let widthConstraint =  view.applyAttribute(.Width, constant: 100, multiplier: 0.5, relation: .Equal)
```

## UIView Extension

### Prepping for Auto Layout 

If a view is already in place with frames, prepForAutoLayout() will remove it from view, enable Auto Layout and place back in view.

```swift
view.prepForAutoLayout()
```

### Prepping for Animation

If a view uses auto layout but you need to animate it using frames, prepForAnimation() will remove from view, disable auto layout and place back in view.

```swift
view.prepForAnimation()
```

### Instantiate 

Instantiates a new UIView with Auto Layout
 
```swift
convenience init(autoLayout: Bool = true)
```

### Position

#### Origin

Returns the frame's origin
 
```swift
origin() -> CGPoint
```

Pins the frame's top and left sides using Auto Layout or frames

```swift
origin(constant: CGPoint) -> UIView 
```
Pins left and top sides to another view using Auto Layout

```swift
origin(to to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1) -> UIView
```
#### Left

Returns the min x point

```swift
left() -> CGFloat 
```

Pins the left side using Auto Layout or frames

```swift
left(constant: CGFloat) -> UIView
```

Pins left side to another view using Auto Layout

```swift
left(to to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Leading

Returns the leading side value

```swift
leading() -> CGFloat
```

Pins the leading side using Auto Layout or frames

```swift
leading(constant: CGFloat) -> UIView
```

Pins the leading side to another view using Auto Layout

```swift
leading(to to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```
#### Right

Returns the max x point

```swift
right() -> CGFloat
```

Pins the right side using Auto Layout or frames

```swift
right(constant: CGFloat) -> UIView 
```

Pins the right side to another view using Auto Layout

```swift
right(to to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```
#### Trailing

Returns the trailing side value

```swift
trailing() -> CGFloat
```

Pins the trailing side using Auto Layout or frames

```swift
trailing(constant: CGFloat) -> UIView 
```

Pins the trailing side to another view using Auto Layout

```swift
trailing(to to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Top

Returns the top side value

```swift
top() -> CGFloat 
```

Pins the top side using Auto Layout or frames

```swift
top(constant: CGFloat) -> UIView
```

Pins the trailing side to another view using Auto Layout

```swift
top(to to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Bottom

Returns the bottom side value

```swift
bottom() -> CGFloat
```

Pins the bottom side using Auto Layout or frames

```swift
bottom(constant: CGFloat) -> UIView 
```

Pins the bottom side to another view using Auto Layout

```swift
bottom(to to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView 
```

#### Center

Pins the center to it's superview using Auto Layout or frames

```swift
center(constant: CGPoint = CGPoint(x: 0, y: 0)) -> UIView
```

Pins the center point to another view using Auto Layout

```swift
center(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView 
```

#### Center X

Returns the center X

```swift
centerX() -> CGFloat
```

Pins the center X using Auto Layout or frames

```swift
centerX(constant: CGFloat = 0) -> UIView 
```

Pins the center X to another view using Auto Layout

```swift
centerX(to to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Center Y

Returns the center Y

```swift
centerY() -> CGFloat
```

Pins the center Y using Auto Layout or frames

```swift
centerY(constant: CGFloat = 0) -> UIView
```

Pins the center Y to another view using Auto Layout

```swift
centerY(to to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

### Compression and Hugging Priority

#### Compression Priority

Returns the Compression Resistance Priority for Horizontal Axis using Auto Layout

```swift
horizontalCompressionPriority() -> UILayoutPriority
```

Sets the Compression Resistance Priority for Horizontal Axis using Auto Layout

```swift
horizontalCompressionPriority(priority: UILayoutPriority) -> UIView  
```

Returns the Compression Resistance Priority for Vertical Axis using Auto Layout

```swift
verticalCompressionPriority() -> UILayoutPriority
```

Sets the Compression Resistance Priority for Vertical Axis using Auto Layout

```swift
verticalCompressionPriority(priority: UILayoutPriority) -> UIView
```

#### Hugging Priority

Returns the Content Hugging Priority for Horizontal Axis using Auto Layout

```swift
func horizontalHuggingPriority() -> UILayoutPriority
```

Sets the Content Hugging Priority for Horizontal Axis using Auto Layout

```swift
horizontalHuggingPriority(priority: UILayoutPriority) -> UIView
```

Returns the Content Hugging Priority for Vertical Axis using Auto Layout

```swift
verticalHuggingPriority() -> UILayoutPriority
```

Sets the Content Hugging Priority for Vertical Axis using Auto Layout

```swift
verticalHuggingPriority(priority: UILayoutPriority) -> UIView
```

### Size

#### Size

Returns the frame size

```swift
size() -> CGSize
```

Sets the frame size using Auto Layout or frames

```swift
size(constant: CGSize) -> UIView
```

Pins the size to another view using Auto Layout

```swift
size(to to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView
```

#### Width

Returns the frame width

```swift
width() -> CGFloat 
```

Sets the frame width using Auto Layout or frames

```swift
width(constant: CGFloat) -> UIView
```

Pins the width to another view using Auto Layout

```swift
width(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Height

Returns the frame height

```swift
height() -> CGFloat
```

Sets the frame height using Auto Layout or frames

```swift
eight(constant: CGFloat) -> UIView
```

Pins the height to another view using Auto Layout

```swift
height(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Minimum Size

Returns the minimum size using Auto Layout

```swift
minSize() -> CGSize?
```

Sets the minimum size using Auto Layout

```swift
minSize(constant:CGSize) -> UIView
```

Pins the minimum size to another view using Auto Layout

```swift
minSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1)
```

#### Minimum Width

Returns the minimum width using Auto Layout

```swift
minWidth() -> CGFloat?
```

Sets the minimum width using Auto Layout

```swift
minWidth(constant:CGFloat) -> UIView
```

Pins the minimum width to another view using Auto Layout

```swift
minWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Minimum Height

Returns the minimum height using Auto Layout

```swift
minHeight() -> CGFloat?
```

Sets the minimum height using Auto Layout

```swift
minHeight(constant:CGFloat) -> UIView 
```

Pins the minimum height to another view using Auto Layout

```swift
minHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Maximum Size

Returns the maximun size using Auto Layout

```swift
maxSize() -> CGSize?
```

Sets the maximun size using Auto Layout

```swift
maxSize(constant:CGSize) -> UIView
```

Pins the maximun size to another view using Auto Layout

```swift
maxSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView
```

#### Maximum Width

Returns the maximun width using Auto Layout

```swift
maxWidth() -> CGFloat?
```

Sets the maximun width using Auto Layout

```swift
maxWidth(constant:CGFloat) -> UIView
```

Pins the maximun width to another view using Auto Layout

```swift
maxWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

#### Maximum Height

Returns the maximun height using Auto Layout

```swift
maxHeight() -> CGFloat?
```

Sets the maximun height using Auto Layout

```swift
maxHeight(constant:CGFloat) -> UIView
```

Pins the maximun height to another view using Auto Layout

```swift
maxHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView
```

### Smallest and Largest Size

Returns the length of the smallest side

```swift
smallestSideLength() -> CGFloat
```

Returns the length of the largest side

```swift
largestSideLength() -> CGFloat
```

### AutoLayout state

Prepares the view for a frame based animation by removing the view, enabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview

```swift
prepForAnimation()
```

Prepares the view for Auto Layout by removing the view, disabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview

```swift
prepForAutoLayout()
```

### Pin and Apply

Pins an attribute to another view

```swift
pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint? 
```

Applies an attribute to the view

```swift
applyAttribute(attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier: CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint
```

### Removing Constraints

Removes all attached constraints recursevely

```swift
removeAttachedConstraintsRecursevely() -> UIView
```

Removes a constraint recursevely

```swift
removeConstraintRecursevely(constraint:NSLayoutConstraint) -> UIView
```

### Direction

Returns true if layout direction is left to right

```swift
layoutDirectionIsLeftToRight() -> Bool
```

## UIView Effects Extension

### Border

Returns layer border color

```swift
borderColor() -> UIColor
```

Sets layer border color

```swift
borderColor(borderColor: UIColor) -> UIView 
```

Returns layer border width

```swift
borderWidth() -> CGFloat 
```

Sets the layer border width

```swift
borderWidth(borderWidth: CGFloat) -> UIView 
```

Sets layer border with a dash pattern

```swift
borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?) -> UIView 
```

### Rounded Corners

Returns layer corner radius

```swift
cornerRadius() -> CGFloat
```

Sets layer corner radius

```swift
cornerRadius(cornerRadius: CGFloat) -> UIView 
```

Creates a circle by rounding the corners to half the size of the width, sets border color and width

```swift
roundCornersToCircle(borderColor: UIColor?, borderWidth: CGFloat?) -> UIView 
```

Creates a circle by rounding the corners to hald the size of the width

```swift
roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?) -> UIView
```

### Shadow

The shadow color of the layer

```swift
shadowColor:UIColor
```

The shadow offset of the layer

```swift
shadowOffset:CGSize
```

The shadow opacity of the layer

```swift
shadowOpacity:Float
```

The shadow radius of the layer

```swift
shadowRadius:CGFloat 
```

Sets shadow of the layer including the color, offset, radius, opacity and mask.

```swift
shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false) -> UIView
```

### Gradient

Sets a gradient color layer

```swift
setGradient(colors: [UIColor], isHorizontal:Bool = false) -> UIView
```

Animates colors of a gradient layer

```swift
animateGradientToColors(colors: [UIColor], duration: CFTimeInterval = 3) -> UIView
```

Sets a gradient layer mask

```swift
setGradientMask(alphas:[CGFloat], isHorizontal:Bool = false) -> UIView
```


## UIViewController Extension

### Direction

Returns true if layout direction is left to right

```swift
layoutDirectionIsLeftToRight() -> Bool
```

Returns true if horizontal size class is compact

```swift 
horizontalSizeClassIsCompact() -> Bool
```

Returns true if vertical size class is compact

```swift
verticalSizeClassIsCompact() -> Bool
```
