module ColorConversion
  class HslConverter < ColorConverter

    def self.matches?(args)
      false
    end

    private
    
    def to_rgb(hsl)
      {}
    end
  end
end