module ColorConversion
  class LabConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:l) && color.include?(:a) && color.include?(:b)
    end

    private
    
    def to_rgb(lab)
      {}
    end
  end
end