AF-View-Helper 2.1
=============================

Convenience extension for UIVIew in Swift
Tested with Xcode 6.1


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
```Swift
let box = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
box.backgroundColor = UIColor.redColor()
view.addSubview(box)
box.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
```

### Auto Layout (Swift)
```Swift
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
```Swift
let box = UIView(autoLayout:true)
view.addSubview(box)
box.backgroundColor = UIColor.redColor()
box.width(100).height(100).center(to: view)
```

In general, this code follows the following format.

***width()***
Gets you the frames's width

***width(100)***
Will set the width of the view via frame or constraints depending on weather or not translatesAutoresizingMaskIntoConstraints is set to true or false

***width(to:view, attribute: .Width, constant: 0, multiplier: 1 {
    constraint in
}***
pins the width to an attribute of another object. Most parameters have defaults so you can just do 
***width(to:view)*** if that's al you need. The constraints are returned in the closure.

***constant***
Used in ***width(100)*** it is just the new value. Used in ***width(to:view, attribute: .Width, constant: 0)*** it is an offset value.

***multiplier***
The multiplier when relating to another object. For example ***box.width(to:view, attribute: .Width, constant: 0, multiplier: 0.5)*** sets the width of box to 50% of the width of the  view.

***Basics***
Auto Layout requires at least two vertical rules and two horizontal rules. Think of othe old way of doing frames as having left and width horizontal rules and top and height vertical rules. AutoLayout takes it a further by allowing these rules to be set in relation to other objects, not just it's superview. 

Learn more about AutoLayout at [developer.apple.com](https://developer.apple.com/library/IOs/documentation/UserExperience/Conceptual/AutolayoutPG/Introduction/Introduction.html)


### Origin

Gets the frame's top left origin
 
```Swift
func origin() -> CGPoint
```
Pins the top and left to it's superview

```Swift
func origin(constant: CGPoint) -> UIView 
```
Pins top and left to another object using  constant and multiplier

```Swift
func origin(#to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView 
```

### Left

Gets the frame's left position

```Swift
func left() -> CGFloat 
```

Pins the left to it's superview

```Swift
func left(constant: CGFloat) -> UIView 
```

Pins left to another object using constant and multiplier

```Swift
func left(#to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Leading

Gets the frame's leading position

```Swift
func leading() -> CGFloat 
```

Pins the leading to it's superview

```Swift
func leading(constant: CGFloat) -> UIView 
```

Pins leading to another object using constant and multiplier

```Swift
func leading(#to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Right

Gets the frame's right position

```Swift
func right() -> CGFloat 
```

Pins the right to it's superview

```Swift
func right(constant: CGFloat) -> UIView
```

Pins right to another object using constant and multiplier

```Swift
func right(#to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Trailing

Gets the frame's trailing position

```Swift
func trailing() -> CGFloat 
```

Pins the trailing to it's superview

```Swift
func trailing(constant: CGFloat) -> UIView 
```

Pins trailing to another object using constant and multiplier

```Swift
func trailing(#to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Top

Gets the frame's top position

```Swift
func top() -> CGFloat 
```

Pins the top to it's superview

```Swift
func top(constant: CGFloat) -> UIView 
```

Pins top to another object using constant and multiplier

```Swift
func top(#to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```

### Bottom

Gets the frame's bottom position

```Swift
func bottom() -> CGFloat 
```

Pins the bottom to it's superview

```Swift
func bottom(constant: CGFloat) -> UIView
```

Pins bottom to another object using constant and multiplier

```Swift
func bottom(#to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Content Compression Resistance Priority

Gets the horizontal content compression resistance priority

```Swift
func priorityX() -> Float 
```

Sets the horizontal content compression resistance priority

```Swift
func priorityX(priority: Float) -> UIView 
```

Gets the vertical content compression resistance priority

```Swift
func priorityY() -> Float 
```

Sets the vertical content compression resistance priority

```Swift
func priorityY(priority: Float) -> UIView 
```

### Content Hugging Priority

Gets the horizontal content hugging priority

```Swift
func huggingX() -> Float 
```

Sets the horizontal content hugging priority

```Swift
func huggingX(priority: Float) -> UIView 
```

Gets the vertical content hugging priority

```Swift
func huggingY() -> Float 
```

Sets the vertical content hugging priority

```Swift
func huggingY(priority: Float) -> UIView
```


### Size

Gets the frame's size

```Swift
func size() -> CGSize 
```

Sets the size constraints

```Swift
func size(constant: CGSize) -> UIView 
```

Pins the size to an object using a constant and multipler

```Swift
func size(#to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```

### Width

Gets the frame's width

```Swift
func width() -> CGFloat 
```

Sets the width constraints

```Swift
func width(constant: CGFloat) -> UIView 
```

Pins the width to an object using a constant and multipler

```Swift
func width(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Height

Gets the frame's height

```Swift
func height() -> CGFloat
```

Sets the height constraints

```Swift
func height(constant: CGFloat) -> UIView 
```

Pins the height to an object using a constant and multipler

```Swift
func height(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Minimum Size

Gets the minimum size

```Swift
func minSize() -> CGSize?
```

Sets the minimum width and height constraints

```Swift
func minSize(constant:CGSize) -> UIView 
```

Pins the minimum width and height constraints to an object using a constant and multiplier

```Swift
func minSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```

### Minimum Width

Gets the minimum width

```Swift
func minWidth() -> CGFloat? 
```

Sets the minimum width constraints

```Swift
func minWidth(constant:CGFloat) -> UIView 
```

Pins the minimum width constraints to an object using a constant and multiplier

```Swift
func minWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Minimum Height

Gets the minimum height

```Swift
func minHeight() -> CGFloat?
```

Sets the minimum height constraints

```Swift
func minHeight(constant:CGFloat) -> UIView
```

Pins the minimum height constraints to an object using a constant and multiplier

```Swift
func minHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Maximum Size

Gets the maximum size

```Swift
func maxSize() -> CGSize?
```

Sets the maximum width and height constraints

```Swift
func maxSize(constant:CGSize) -> UIView
```

Pins the maximum width and height constraints to an object using a constant and multiplier

```Swift
func maxSize(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView
```


### Maximum Width

Gets the maximum width

```Swift
func maxWidth() -> CGFloat?
```

Sets the maximum width constraints

```Swift
func maxWidth(constant:CGFloat) -> UIView 
```

Pins the maximum width constraints to an object using a constant and multiplier

```Swift
func maxWidth(#to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```

### Maximum Height

Gets the maximum height

```Swift
func maxHeight() -> CGFloat? 
```

Sets the maximum height constraints

```Swift
func maxHeight(constant:CGFloat) -> UIView 
```

Pins the maximum width constraints to an object using a constant and multiplier

```Swift
func maxHeight(#to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Smallest And Largest Side

Gets the size of the smallest side

```Swift
func smallestSideLength() -> CGFloat
```

Gets the size of the largest side

```Swift
func largestSideLength() -> CGFloat
```


### Center

Pins center to another view using constant and multiplier

```Swift
func center(#to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1, closure: ConstraintsBlock = nil) -> UIView 
```


### Center X

Gets horizontal center

```Swift
func centerX() -> CGFloat 
```

Pins horzontal center to superview

```Swift
func centerX(constant: CGFloat = 0) -> UIView 
```

Pins horzontal center to another view using attribute, constant and multiplier

```Swift
func centerX(#to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView 
```


### Center Y

Gets horizontal center

```Swift
func centerY() -> CGFloat 
```

Pins vertical center to superview

```Swift
func centerY(constant: CGFloat = 0) -> UIView 
```

Pins vertical center to another view using attribute, constant and multiplier

```Swift
func centerY(#to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1, closure: ConstraintBlock = nil) -> UIView
```


### Pin

Pins an attribute to an attribute of another item

```Swift
func pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint?
```

### Space subviews

Space subviews evenly and inserts dynamically sized spacers in between

```Swift
func spaceSubviewsEvenly(views:[UIView], size: CGSize, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
```

Spaces subviews next to each other using VisualFormat

```Swift
func spaceSubviews(views:[UIView], spacing:CGFloat = 0, axis:UILayoutConstraintAxis = .Horizontal, options:NSLayoutFormatOptions = .AlignAllCenterY, closure: ConstraintsBlock = nil) -> UIView
```

Align subviews along an axis

```Swift
func alignSubviews(views:[UIView], axis:UILayoutConstraintAxis, closure: ConstraintsBlock = nil) -> UIView
```

### Removing Constraints

Removes constraints recusevely

```Swift
func removeConstraintsFromViewAndRelatedView(#constraints:[NSLayoutConstraint]) -> UIView
```

### Border

Gets the border color

```Swift
func borderColor() -> UIColor
```

Sets the border color

```Swift
func borderColor(borderColor: UIColor) -> UIView 
```

Gets the border width

```Swift
func borderWidth()
```

Gets the border width

```Swift
func borderWidth(borderWidth: CGFloat) -> UIView
``` 

Sets border with dash pattern

```Swift
func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?) -> UIView
```


### Rounded Corner

Gets the corner radius

```Swift
func cornerRadius() -> CGFloat
```

Sets the corner radius

```Swift
func cornerRadius(cornerRadius: CGFloat) -> UIView 
```

Sets the corner radius as a circle

```Swift
func roundCornersToCircle() -> UIView
```

Sets the corner radius as a circle with border
```Swift
func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat) -> UIView
```

Sets the corner radius with border
```Swift
func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?) -> UIView
```

### Shadow

Gets the shadow color
```Swift
func shadowColor() -> UIColor 
```

Sets the shadow color

```Swift
func shadowColor(shadowColor: UIColor) -> UIView
```
Gets the shadow offset

```Swift
func shadowOffset() -> CGSize
```

Sets the shadow offset

```Swift
func shadowOffset(shadowOffset: CGSize) -> UIView
```

Gets the shadow oppacity

```Swift
func shadowOpacity() -> Float
```

Sets the shadow oppacity

```Swift
func shadowOpacity(shadowOpacity: Float) -> UIView
```

Gets the shadow radius

```Swift
func shadowRadius() -> CGFloat
```

Sets the shadow radius

```Swift
func shadowRadius(shadowRadius: CGFloat) -> UIView 
```

Sets all shadow properties in one call

```Swift
func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false) -> UIView 
```

### Autolayout

Sets setTranslatesAutoresizingMaskIntoConstraints to true

```Swift
func prepForAnimation()
```
