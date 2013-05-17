module ColorConversion
  class HsvConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:h) && color.include?(:s) && 
      ( color.include?(:v) || color.include?(:b) )
    end

    private
    
    def to_rgba(hsv)
      {}
    end
  end
end