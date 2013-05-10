module ColorConversion
  class StringConverter < ColorConverter

    def self.matches?(args)
      false # args.is_a? String
    end

    private
    
    def to_rgb(string)
      {}
    end
  end
end