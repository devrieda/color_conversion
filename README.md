## Color Conversion

This gem provides conversions for colors to and from Hex, RGB, and HSV. 

_This gem is in an extremely experimental state right now_

## Examples

Create a new color:
```ruby
# from hex
color = Color.new("#FFFFFF")

# from rgb
color = Color.new(r: 255, g: 255, b: 255)

# from hsv
color = Color.new(h: 0.0, s: 0.0, v: 1.0)

# from textual color
color = Color.new("white")

# from a css declaration
color = Color.new("rgb(255,255,255)")
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

Convert to HSV
```ruby
Color.new("white").hsv
=> {:h=>0.0, :s=>0.0, :v=>1.0}
```

Convert to Textual
```ruby
Color.new("#FFFFFF").text
=> "white"
```


## Installation

To install ColorConversion, add the gem to your Gemfile: 

```ruby
gem "color_conversion", "~> 0.0.1"
```

## LICENSE

Copyright (c) 2013 Derek DeVries

Released under the [MIT License](http://www.opensource.org/licenses/MIT)
