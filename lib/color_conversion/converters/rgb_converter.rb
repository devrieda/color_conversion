module ColorConversion
  class RgbConverter < ColorConverter

    def self.matches?(args)
      false
    end
    
    private
    
    def to_rgb 
      {}
    end
  end
end