module ColorConversion
  class HslConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(Hash)

      color.include?(:h) && color.include?(:s) && color.include?(:l)
    end

    private
    
    def to_rgba(hsl)
      h = hsl[:h].to_s.gsub(/[^0-9\.]/, "").to_f / 360.0
      s = hsl[:s].to_s.gsub(/[^0-9\.]/, "").to_f / 100.0
      l = hsl[:l].to_s.gsub(/[^0-9\.]/, "").to_f / 100.0
      a = hsl[:a] ? hsl[:a].to_s.gsub(/[^0-9\.]/, "").to_f : 1.0

      return greyscale(l, a) if s == 0

      t2 = if l < 0.5
        l * (1 + s)
      else
        l + s - l * s
      end

      t1 = 2 * l - t2

      rgb = [0, 0, 0]

      (0..2).each do |i|
        t3 = h + 1 / 3.0 * - (i - 1)
        t3 < 0 && t3 += 1
        t3 > 1 && t3 -= 1

        val = if 6 * t3 < 1
          t1 + (t2 - t1) * 6 * t3
        elsif 2 * t3 < 1
          t2
        elsif 3 * t3 < 2
          t1 + (t2 - t1) * (2 / 3.0 - t3) * 6
        else
          t1
        end

        rgb[i] = (val * 255).round
      end
      
      {r: rgb[0], g: rgb[1], b: rgb[2], a: a}
    end

    def greyscale(luminosity, alpha)
      rgb_equal_value = (luminosity * 255).round
      { r: rgb_equal_value, g: rgb_equal_value, b: rgb_equal_value, a: alpha }
    end

  end
end