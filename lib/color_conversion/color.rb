module ColorConversion
  class Color
    extend Forwardable
    def_delegators :@converter, :rgb, :hex, :hsl, :hsv, :hsb, :cmyk, :alpha

    def initialize(color)
      @converter = ColorConverter.factory(color)
    end
  end
end