module ColorConversion
  class RgbConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:r) && color.include?(:g) && color.include?(:b)
    end
    
    private
    
    def to_rgba(rgb)
      r = rgb[:r].to_f
      g = rgb[:g].to_f
      b = rgb[:b].to_f
      a = (rgb[:a] || 1.0).to_f

      {r: r, g: g, b: b, a: a}
    end
  end
end