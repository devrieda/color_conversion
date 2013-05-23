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
      @r, @g, @b = rgb_array_frac

      {h: hue, s: hsl_saturation, l: hsl_lightness}
    end

    def hsv
      @r, @g, @b = rgb_array

      {h: hue, s: hsv_saturation, v: hsv_value}
    end
    
    def hsb
      hsb = hsv
      hsb[:b] = hsb.delete(:v)
      hsb
    end
    
    def cmyk
      @r, @g, @b = rgb_array_frac

      k = [1.0 - @r, 1.0 - @g, 1.0 - @b].min
      c = (1.0 - @r - k) / (1.0 - k)
      m = (1.0 - @g - k) / (1.0 - k)
      y = (1.0 - @b - k) / (1.0 - k)

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
    
    
    protected

    def rgb_array
      [@rgba[:r].to_f, @rgba[:g].to_f, @rgba[:b].to_f]
    end
    
    def rgb_array_frac
      [@rgba[:r] / 255.0, @rgba[:g] / 255.0, @rgba[:b] / 255.0]
    end
    
    def min
      [@r, @g, @b].min
    end
    
    def max
      [@r, @g, @b].max
    end
    
    def delta
      max - min
    end

    def hue
      h = if max == min
        0
      elsif @r == max
        (@g - @b) / delta
      elsif @g == max
        2 + (@b - @r) / delta
      elsif @b == max
        4 + (@r - @g) / delta
      end

      h = [h * 60, 360].min      
      h += 360 if h < 0
      h.round
    end

    # hsv
    def hsv_saturation
      sat = max == 0 ? 0 : (delta / max * 1000) / 10.0
      sat.round
    end
    
    def hsv_value
      val = ((max / 255.0) * 1000) / 10.0
      val.round
    end

    # hsl
    def hsl_saturation
      s = if max == min
        0
      elsif hsl_lightness / 100.0 <= 0.5
        delta / (max + min)
      else
        delta / (2.0 - max - min)
      end

      (s * 100).round
    end
    
    def hsl_lightness
      light = (min + max) / 2.0 * 100
      light.round
    end

  end
end