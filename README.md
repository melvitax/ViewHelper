AF-View-Additions 1.02
=============================

Convenience extension for UIVIew in Swift
Tested with Xcode 6 Beta 6

![Sample Project Screenshot](Screenshot.png?raw=true "Sample Project Screenshot")


### Position
```Swift
// convenience for: frame.origin
func origin() -> CGPoint
func origin(frameOrigin: CGPoint)

// convenience for: frame.origin.x
func left() -> CGFLoat
func left(frameX: CGFloat)

// convenience for: frame.origin.x + frame.size.width
func right() -> CGFloat
func right(frameRight: CGFloat)

// convenience for: frame.origin.y
func top() -> CGFloat
func top(frameY: CGFloat)

// convenience for: frame.origin.y + height
func bottom() -> CGFloat 
func bottom(frameBottom: CGFloat)

```

### Size
```Swift

// convenience for: frame.size
func size() -> CGSize
func size(frameSize: CGSize) 

// convenience for: frame.size.width
func width() -> CGFloat 
func width(frameWidth: CGFloat)

// convenience for: frame.size.height
func height() -> CGFloat
func height(frameHeight: CGFloat)

```

### Center
```Swift
func centerInSuperview()
func centerHorizontally()
func centerVertically()
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
