module ColorConversion
  class HslConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:h) && color.include?(:s) && color.include?(:l)
    end

    private
    
    def to_rgb(hsl)
      {}
    end
  end
end