AF-View-Helper 2.3
=============================

Convenience extension for UIVIew in Swift
Optimized for Swift 1.2


## Auto Layout


![Sample Project Screenshot](Screenshot.png?raw=true "Sample Project Screenshot")


Let's say you want a view to be 100x100 and centered, here's the code compared.

### The old frames way (Objective-C)
```Objective-C
UIView *box = [UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100);
box.backgroundColor = [UIColor redColor];
self.view.addSubview = box;
box.center = CGPointMake(self.view.width/2, self.view.height/2)
```

### The old frames way (Swift)
```swift
let box = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
box.backgroundColor = UIColor.redColor()
view.addSubview(box)
box.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
```

### Auto Layout (Swift)
```swift
let box = UIView()
view.addSubview(box)
box.backgroundColor = UIColor.redColor()
box.setTranslatesAutoresizingMaskIntoConstraints(false)
box.addConstraint(NSLayoutConstraint(item: box, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
box.addConstraint(NSLayoutConstraint(item: box, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
view.addConstraint(NSLayoutConstraint(item: box, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
view.addConstraint(NSLayoutConstraint(item: box, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0))
```

### Auto Layout With Helper (Swift)
```swift
let box = UIView(autoLayout:true)
view.addSubview(box)
box.backgroundColor = UIColor.redColor()
box.width(100).height(100).center(to: view)
```

###Basics###

***width()***
Gets you the frames's width

***width(100)***
Sets the width of the view via frame or constraints depending on whether or not translatesAutoresizingMaskIntoConstraints is set to true or false

***width(to:view, attribute: .Width, constant: 0, multiplier: 1 {
    constraint in
}***
Pins the width to an attribute of another object with AutoLayout constraints. Most parameters in this function have defaults so ***width(to:view)*** can be used instead if that's all you need. The constraints are returned in the closure but the function itself returns self so that functions can be chained.

***constant***
Used in ***width(100)*** is used as the new value. Used in ***width(to:view, attribute: .Width, constant: 0)*** is usef as an offset value.

***multiplier***
The multiplier when relating to another object. For example ***box.width(to:view, attribute: .Width, constant: 0, multiplier: 0.5)*** sets the width of box to 50% of the width of the  view.

***which one to use?*** 
Use ***width(100)*** when you need to assign a static value. Use *** width(to:view....)*** when you need the value(static or percentage) to be relational to another object. i.e. view1 left can be 10 points left of the centerY of view2 and 50% the width of the superview. Use ***pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint?*** when you need more complex relationship rules.

***Satisfying Constraints***
Auto Layout requires at least two vertical rules and two horizontal rules. Think of othe old way of doing frames as having left and width horizontal rules and top and height vertical rules. AutoLayout takes this further by allowing these rules to be set in relation to other objects and have them change dynamically as the bounds change.

Learn more about AutoLayout at [developer.apple.com](https://developer.apple.com/library/IOs/documentation/UserExperience/Conceptual/AutolayoutPG/Introduction/Introduction.html)


### Origin

Gets the frame's top left origin
 
```swift
func origin() -> CGPoint
```
Pins the top and left to it's superview

```swift
func origin(constant: CGPoint) -> UIView 
```
Pins top and left to another object using  constant and multiplier

```swift
func origin(#to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView 
```

### Left

Gets the frame's left position

```swift
func left() -> CGFloat 
```

Pins the left to it's superview

```swift
func left(constant: CGFloat) -> UIView 
```

Pins left to another object using constant and multiplier

```swift
func left(#to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Leading

Gets the frame's leading position

```swift
func leading() -> CGFloat 
```

Pins the leading to it's superview

```swift
func leading(constant: CGFloat) -> UIView 
```

Pins leading to another object using constant and multiplier

```swift
func leading(#to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Right

Gets the frame's right position

```swift
func right() -> CGFloat 
```

Pins the right to it's superview

```swift
func right(constant: CGFloat) -> UIView
```

Pins right to another object using constant and multiplier

```swift
func right(#to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Trailing

Gets the frame's trailing position

```swift
func trailing() -> CGFloat 
```

Pins the trailing to it's superview

```swift
func trailing(constant: CGFloat) -> UIView 
```

Pins trailing to another object using constant and multiplier

```swift
func trailing(#to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Top

Gets the frame's top position

```swift
func top() -> CGFloat 
```

Pins the top to it's superview

```swift
func top(constant: CGFloat) -> UIView 
```

Pins top to another object using constant and multiplier

```swift
func top(#to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Bottom

Gets the frame's bottom position

```swift
func bottom() -> CGFloat 
```

Pins the bottom to it's superview

```swift
func bottom(constant: CGFloat) -> UIView
```

Pins bottom to another object using constant and multiplier

```swift
func bottom(#to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Content Compression Resistance Priority

Gets the horizontal content compression resistance priority

```swift
func priorityX() -> Float 
```

Sets the horizontal content compression resistance priority

```swift
func priorityX(priority: Float) -> UIView 
```

Gets the vertical content compression resistance priority

```swift
func priorityY() -> Float 
```

Sets the vertical content compression resistance priority

```swift
func priorityY(priority: Float) -> UIView 
```

### Content Hugging Priority

Gets the horizontal content hugging priority

```swift
func huggingX() -> Float 
```

Sets the horizontal content hugging priority

```swift
func huggingX(priority: Float) -> UIView 
```

Gets the vertical content hugging priority

```swift
func huggingY() -> Float 
```

Sets the vertical content hugging priority

```swift
func huggingY(priority: Float) -> UIView
```


### Size

Gets the frame's size

```swift
func size() -> CGSize 
```

Sets the size constraints

```swift
func size(constant: CGSize) -> UIView 
```

Pins the size to an object using a constant and multipler

```swift
func size(#to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```

### Width

Gets the frame's width

```swift
func width() -> CGFloat 
```

Sets the width constraints

```swift
func width(constant: CGFloat) -> UIView 
```

Pins the width to an object using a constant and multipler

```swift
func width(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Height

Gets the frame's height

```swift
func height() -> CGFloat
```

Sets the height constraints

```swift
func height(constant: CGFloat) -> UIView 
```

Pins the height to an object using a constant and multipler

```swift
func height(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Minimum Size

Gets the minimum size

```swift
func minSize() -> CGSize?
```

Sets the minimum width and height constraints

```swift
func minSize(constant:CGSize) -> UIView 
```

Pins the minimum width and height constraints to an object using a constant and multiplier

```swift
func minSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```

### Minimum Width

Gets the minimum width

```swift
func minWidth() -> CGFloat? 
```

Sets the minimum width constraints

```swift
func minWidth(constant:CGFloat) -> UIView 
```

Pins the minimum width constraints to an object using a constant and multiplier

```swift
func minWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Minimum Height

Gets the minimum height

```swift
func minHeight() -> CGFloat?
```

Sets the minimum height constraints

```swift
func minHeight(constant:CGFloat) -> UIView
```

Pins the minimum height constraints to an object using a constant and multiplier

```swift
func minHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Maximum Size

Gets the maximum size

```swift
func maxSize() -> CGSize?
```

Sets the maximum width and height constraints

```swift
func maxSize(constant:CGSize) -> UIView
```

Pins the maximum width and height constraints to an object using a constant and multiplier

```swift
func maxSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```


### Maximum Width

Gets the maximum width

```swift
func maxWidth() -> CGFloat?
```

Sets the maximum width constraints

```swift
func maxWidth(constant:CGFloat) -> UIView 
```

Pins the maximum width constraints to an object using a constant and multiplier

```swift
func maxWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Maximum Height

Gets the maximum height

```swift
func maxHeight() -> CGFloat? 
```

Sets the maximum height constraints

```swift
func maxHeight(constant:CGFloat) -> UIView 
```

Pins the maximum width constraints to an object using a constant and multiplier

```swift
func maxHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Smallest And Largest Side

Gets the size of the smallest side

```swift
func smallestSideLength() -> CGFloat
```

Gets the size of the largest side

```swift
func largestSideLength() -> CGFloat
```


### Center

Pins center to another view using constant and multiplier

```swift
func center(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView 
```


### Center X

Gets horizontal center

```swift
func centerX() -> CGFloat 
```

Pins horzontal center to superview

```swift
func centerX(constant: CGFloat = 0) -> UIView 
```

Pins horzontal center to another view using attribute, constant and multiplier

```swift
func centerX(#to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Center Y

Gets horizontal center

```swift
func centerY() -> CGFloat 
```

Pins vertical center to superview

```swift
func centerY(constant: CGFloat = 0) -> UIView 
```

Pins vertical center to another view using attribute, constant and multiplier

```swift
func centerY(#to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Pin

Pins an attribute to an attribute of another item

```swift
func pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint?
```

### Space subviews

Space subviews evenly and inserts dynamically sized spacers in between

```swift
func spaceSubviewsEvenly(views:[UIView], size: CGSize, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
```

Spaces subviews next to each other using VisualFormat

```swift
func spaceSubviews(views:[UIView], spacing:CGFloat = 0, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
```

Align subviews along an axis

```swift
func alignSubviews(views:[UIView], axis:UILayoutConstraintAxis, closure: ConstraintsBlock = nil) -> UIView
```

### Removing Constraints

Removes constraints recusevely

```swift
func removeConstraintsFromViewAndRelatedView(#constraints:[NSLayoutConstraint]) -> UIView
```

### Border

Gets the border color

```swift
func borderColor() -> UIColor
```

Sets the border color

```swift
func borderColor(borderColor: UIColor) -> UIView 
```

Gets the border width

```swift
func borderWidth()
```

Gets the border width

```swift
func borderWidth(borderWidth: CGFloat) -> UIView
``` 

Sets border with dash pattern

```swift
func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?) -> UIView
```


### Rounded Corner

Gets the corner radius

```swift
func cornerRadius() -> CGFloat
```

Sets the corner radius

```swift
func cornerRadius(cornerRadius: CGFloat) -> UIView 
```

Sets the corner radius as a circle

```swift
func roundCornersToCircle() -> UIView
```

Sets the corner radius as a circle with border
```swift
func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat) -> UIView
```

Sets the corner radius with border
```swift
func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?) -> UIView
```

### Shadow

Gets the shadow color
```swift
func shadowColor() -> UIColor 
```

Sets the shadow color

```swift
func shadowColor(shadowColor: UIColor) -> UIView
```
Gets the shadow offset

```swift
func shadowOffset() -> CGSize
```

Sets the shadow offset

```swift
func shadowOffset(shadowOffset: CGSize) -> UIView
```

Gets the shadow oppacity

```swift
func shadowOpacity() -> Float
```

Sets the shadow oppacity

```swift
func shadowOpacity(shadowOpacity: Float) -> UIView
```

Gets the shadow radius

```swift
func shadowRadius() -> CGFloat
```

Sets the shadow radius

```swift
func shadowRadius(shadowRadius: CGFloat) -> UIView 
```

Sets all shadow properties in one call

```swift
func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false) -> UIView 
```

### Autolayout

Sets setTranslatesAutoresizingMaskIntoConstraints to true

```swift
func prepForAnimation()
```
