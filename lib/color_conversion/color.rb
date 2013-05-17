module ColorConversion
  class Color
    attr_reader :rgb, :alpha
    
    def initialize(color)
      rgba   = ColorConverter.factory(color).rgba
      @alpha = rgba.delete(:a)
      @rgb   = rgba
    end

    # conversions
    
    def cymk
    end
    
    def lab
    end
    
    def hsl
    end
    
    def hsv
    end
  end
end