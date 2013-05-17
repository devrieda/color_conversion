module ColorConversion
  class HslStringConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)
      
      color.include?("hsl(") || color.include?("hsla(")
    end

    private
    
    def to_rgba(hsv)
      {}
    end
  end
end