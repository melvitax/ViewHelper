UIView-AF-Additions
=============================

Convenience extension for UIVIew in Swift
Tested with IOS 8 Beta 5

![Sample Project Screenshot](Screenshot.png?raw=true "Sample Project Screenshot")


### Position
```Swift
var left: CGFLoat
// convenience for: frame.origin.x
var right: CGFLoat
// convenience for: frame.origin.x + frame.size.width
var top: CGFLoat
// convenience for: frame.origin.y
var bottom: CGFLoat
// convenience for: frame.origin.y + height
```

### Size
```Swift
var width: CGFLoat
// convenience for: frame.size.width
var height: CGFLoat
// convenience for: frame.size.height
```

### Center
```Swift
func centerInSuperview()
func centerHorizontally()
func centerVertically()
```

### Size
```Swift
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
```

### Border
```Swift
var borderColor: UIColor
// convenience for: UIColor(CGColor: layer.borderColor)
var borderWidth: CGFLoat
// convenience for: layer.borderWidth
func borderWithDashPattern(lineDashPattern: [Int], borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat?)
// applies a stroked border
```

### Rounded Corner
```Swift
var cornerRadius: CGFLoat
// convenience for: layer.cornerRadius
func roundCornersToCircle()
// rounds corners to circle
func roundCornersToCircle(#borderColor: UIColor, borderWidth: CGFloat)
// rounds corners to circle with border
func roundCorners(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?)
// rounds corner to a radius amount with border
```

### Shadow
```Swift
var shadowColor: UIColor
// convenience for: UIColor(CGColor: layer.shadowColor)
var shadowOffset: CGSize
// convenience for: layer.shadowOffset
var shadowOpacity: Float
// convenience for: layer.shadowOpacity
var shadowRadius: CGFloat
// convenience for: layer.shadowRadius
func shadow(color: UIColor = UIColor.blackColor(), offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 6, opacity: Float = 1, isMasked: Bool = false)
// sets all shadow properties in one call


### Autolayout
```Swift
func prepForAnimation()
// sets setTranslatesAutoresizingMaskIntoConstraints to true
```
