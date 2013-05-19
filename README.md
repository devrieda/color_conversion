## Color Conversion

This gem provides conversions for colors to and from Hex, RGB, and HSL. 

## Examples

Create a new color:
```ruby
# from hex
color = Color.new("#FFFFFF")
color = Color.new("#FFF")

# from rgb and rgba
color = Color.new(r: 255, g: 255, b: 255)
color = Color.new(r: 255, g: 255, b: 255, a: 0.5)

# from hsl and hsla
color = Color.new(h: 0, s: 100, l: 100)
color = Color.new(h: 0, s: 100, l: 100, a: 0.5)

# from textual color
color = Color.new("white")

# from a css declaration
color = Color.new("rgb(255,255,255)")
color = Color.new("hsl(0,100%,100%)")
```


Convert to RGB
```ruby
Color.new("white").rgb
=> {:r=>255, :g=>255, :b=>255}
```

Convert to Hex
```ruby
Color.new("white").hex
=> "#FFFFFF"
```

Convert to HSL
```ruby
Color.new("white").hsl
=> {:h=>0, :s=>100, :l=>100}
```

Convert to Name
```ruby
Color.new("#FFFFFF").name
=> "white"
```


## Installation

To install ColorConversion, add the gem to your Gemfile: 

```ruby
gem "color_conversion"
```

## LICENSE

Copyright (c) 2013 Derek DeVries

Released under the [MIT License](http://www.opensource.org/licenses/MIT)
