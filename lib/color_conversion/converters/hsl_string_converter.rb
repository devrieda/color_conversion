module ColorConversion
  class HslStringConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)
      
      color.include?("hsl(") || color.include?("hsla(")
    end

    private
    
    def to_rgba(hsl)
      matches = hsl.match(/hsla?\(([0-9\.,%\s]+)\)/)
      raise InvalidColorError unless matches

      h, s, l, a = matches[1].split(",").map do |color| 
        color.gsub("%", "").strip
      end
      raise InvalidColorError unless h && s && l

      HslConverter.new(h: h, s: s, l: l, a: a).rgba
    end
  end
end