module ColorConversion
  class NullConverter < ColorConverter

    def self.matches?(color)
      true
    end

    private
    
    def to_rgb(string)
      {}
    end
  end
end