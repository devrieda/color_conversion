module ColorConversion
  class RgbStringConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)

      color.include?("rgb(") || color.include?("rgba(")
    end

    private
    
    def to_rgb(hsv)
      {}
    end
  end
end