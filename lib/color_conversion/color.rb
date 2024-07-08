module ColorConversion
  class Color
    extend Forwardable
    def_delegators :@converter, :rgb, :hex, :hsl, :hsv, :hsb, :cmyk, :alpha

    def initialize(color)
      @converter = ColorConverter.factory(color)
    end

    def ==(other)
      return false unless other.is_a?(Color)

      rgb == other.rgb && alpha == other.alpha
    end
  end
end
