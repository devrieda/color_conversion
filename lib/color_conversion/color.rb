module ColorConversion
  class Color
    
    def initialize(color)
      @rgb = ColorConverter.factory(color).rgb
    end

    # conversions

    def rgb
      @rgb
    end

  end
end