module ColorConversion
  class ColorConverter
    attr_reader :rgba

    # keep track of subclasses for factory
    class << self
      attr_reader :converters
    end

    @converters = []

    def self.inherited(subclass)
      ColorConverter.converters << subclass
    end

    def self.factory(color)
      converter = ColorConverter.converters.find do |klass| 
        klass.matches?(color)
      end
      converter.new(color) if converter
    end
    
    def initialize(color)
      @rgba = to_rgba(color)
    end
    
    def rgb
      {r: @rgba[:r], g: @rgba[:g], b: @rgba[:b]}
    end
    
    def hex      
      "#" + ("%02x" % @rgba[:r] + "%02x" % @rgba[:g] + "%02x" % @rgba[:b])
    end
    
    def hsl
      r = @rgba[:r] / 255.0
      g = @rgba[:g] / 255.0
      b = @rgba[:b] / 255.0
      min = [r, g, b].min
      max = [r, g, b].max
      delta = max - min

      h = if max == min
        0
      elsif r == max
        (g - b) / delta 
      elsif g == max
        2 + (b - r) / delta 
      elsif b == max
        4 + (r - g) / delta
      end
      
      h = [h * 60, 360].min
      h += 360 if h < 0
      l = (min + max) / 2.0

      s = if (max == min)
        0
      elsif (l <= 0.5)
        delta / (max + min)
      else
        delta / (2.0 - max - min)
      end

      {h: h.round, s: (s * 100).round, l: (l * 100).round}
    end
    
    def hsv
      r = @rgba[:r].to_f
      g = @rgba[:g].to_f
      b = @rgba[:b].to_f
      min = [r, g, b].min
      
      max = [r, g, b].max
      delta = (max - min).to_f
      
      s = max == 0 ? 0 : (delta / max * 1000) / 10.0
      
      h = if max == min
        0
      elsif r == max
        (g - b) / delta
      elsif g == max
        2 + (b - r) / delta 
      elsif b == max
        4 + (r - g) / delta
      end
      
      h = [h * 60, 360].min      
      h += 360 if h < 0

      v = ((max / 255.0) * 1000) / 10.0

      {h: h.round, s: s.round, v: v.round}
    end
    
    def hsb
      hsb = hsv
      hsb[:b] = hsb.delete(:v)
      hsb
    end
    
    def cmyk
      r = @rgba[:r] / 255.0
      g = @rgba[:g] / 255.0
      b = @rgba[:b] / 255.0

      k = [1.0 - r, 1.0 - g, 1.0 - b].min
      c = (1.0 - r - k) / (1.0 - k)
      m = (1.0 - g - k) / (1.0 - k)
      y = (1.0 - b - k) / (1.0 - k)

      {c: (c * 100).round, 
       m: (m * 100).round, 
       y: (y * 100).round, 
       k: (k * 100).round}
    end

    def alpha
      @rgba[:a]
    end
    
    def name
      NameConverter.name_for_rgb(rgb)
    end

  end
end