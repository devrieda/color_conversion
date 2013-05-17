module ColorConversion
  class RgbStringConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)

      color.include?("rgb(") || color.include?("rgba(")
    end

    private
    
    def to_rgba(rgb)
      matches = rgb.match(/rgba?\(([0-9\.,\s]+)\)/)
      raise InvalidColorError unless matches

      r, g, b, a = matches[1].split(",").map {|color| color.strip }
      raise InvalidColorError unless r && g && b

      {r: r.to_i, 
       g: g.to_i, 
       b: b.to_i, 
       a: (a || 1.0).to_f}
    end
  end
end