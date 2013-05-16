module ColorConversion
  class CmykConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:c) && color.include?(:m) && 
      color.include?(:y) && color.include?(:k)
    end

    private

    def to_rgb(cmyk)
      c = cmyk[:c].to_f / 100.0
      m = cmyk[:m].to_f / 100.0
      y = cmyk[:y].to_f / 100.0
      k = cmyk[:k].to_f / 100.0

      r = (255 * (1.0 - [1.0, c * (1.0 - k) + k].min)).round
      g = (255 * (1.0 - [1.0, m * (1.0 - k) + k].min)).round
      b = (255 * (1.0 - [1.0, y * (1.0 - k) + k].min)).round

      {r: r, g: g, b: b}
    end
  end
end