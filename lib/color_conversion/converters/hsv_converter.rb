module ColorConversion
  class HsvConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:h) && color.include?(:s) && color.include?(:v)
    end

    private
    
    def to_rgb(hsv)
      {}
    end
  end
end