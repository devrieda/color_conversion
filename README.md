## Color Conversion

This gem provides conversions for colors to and from Hex, RGB, and HSL. 

## Examples

Initialize a color:
```ruby
# from hex
color = Color.new("#3366cc")
color = Color.new("#36c")

# from rgb(a)
color = Color.new(r: 51, g: 102, b: 204)
color = Color.new(r: 51, g: 102, b: 204, a: 0.5)

# from hsl(a)
color = Color.new(h: 225, s: 73, l: 57)
color = Color.new(h: 225, s: 73, l: 57, a: 0.5)

# from hsv/hsb
color = Color.new(h: 220, s: 75, v: 80)
color = Color.new(h: 220, s: 75, b: 80)

# from cmyk
color = Color.new(c: 74, m: 58, y: 22, k: 3)

# from textual color
color = Color.new("blue")

# from a css rgb(a) string
color = Color.new("rgb(51, 102, 204)")
color = Color.new("rgba(51, 102, 204, 0.5)")

# from a css hsl(a) string
color = Color.new("hsl(225, 73%, 57%)")
color = Color.new("hsl(225, 73%, 57%, 0.5)")
```

Conversions

```ruby
color = Color.new(r: 51, g: 102, b: 204, a: 0.5)

color.alpha
=> 0.5

color.rgb
=> {:r=>51, :g=>102, :b=>204}

color.hsl
=> {:h=>220, :s=>60, :l=>50}

color.hsv
=> {:h=>220, :s=>75, :v=>80}

color.hsb
=> {:h=>220, :s=>75, :b=>80}

color.cmyk
=> {:c=>75, :m=>50, :y=>0, :k=>20}

color.hex
=> "#3366cc"
```


## Installation

To install ColorConversion, add the gem to your Gemfile: 

```ruby
gem "color_conversion"
```

## LICENSE

Copyright (c) 2013 Derek DeVries

Released under the [MIT License](http://www.opensource.org/licenses/MIT)
