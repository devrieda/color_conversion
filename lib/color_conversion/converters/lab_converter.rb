module ColorConversion
  class LabConverter < ColorConverter

    def self.matches?(args)
      false
    end

    private
    
    def to_rgb(lab)
      {}
    end
  end
end