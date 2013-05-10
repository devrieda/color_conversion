module ColorConversion
  class HsvConverter < ColorConverter

    def self.matches?(args)
      false
    end

    private
    
    def to_rgb(hsv)
      {}
    end
  end
end