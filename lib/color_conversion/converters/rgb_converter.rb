module ColorConversion
  class RgbConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:r) && color.include?(:g) && color.include?(:b)
    end
    
    private
    
    def to_rgba(rgb)
      rgb.merge(:a => rgb[:a] || 1.0)
    end
  end
end