module ColorConversion
  class Color
    extend Forwardable
    def_delegators :@converter, :rgb, :hex, :hsl, :hsv, :hsb, :cymk, :alpha

    def initialize(color)
      @converter = ColorConverter.factory(color)
    end
  end
end