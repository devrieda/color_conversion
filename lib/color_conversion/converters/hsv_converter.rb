module ColorConversion
  class HsvConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:h) && color.include?(:s) && 
      ( color.include?(:v) || color.include?(:b) )
    end

    private
    
    def to_rgba(hsv)
      h = hsv[:h] / 60.0
      s = hsv[:s] / 100.0
      v = (hsv[:v] || hsv[:b]) / 100.0
      hi = h.floor % 6.0

      f = h - h.floor
      p = (255 * v * (1 - s)).round
      q = (255 * v * (1 - (s * f))).round
      t = (255 * v * (1 - (s * (1 - f)))).round
      v = (255 * v).round
      
      case hi
        when 0 then {r: v, g: t, b: p, a: 1.0}
        when 1 then {r: q, g: v, b: p, a: 1.0}
        when 2 then {r: p, g: v, b: t, a: 1.0}
        when 3 then {r: p, g: q, b: v, a: 1.0}
        when 4 then {r: t, g: p, b: v, a: 1.0}
        when 5 then {r: v, g: p, b: q, a: 1.0}
      end
    end
  end
end