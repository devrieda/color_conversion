module ColorConversion
  class NullConverter < ColorConverter

    def self.matches?(color)
      true
    end

    private
    
    def to_rgba(color)
      raise InvalidColorError
    end
  end
end