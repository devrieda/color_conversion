module ColorConversion
  class HexConverter < ColorConverter

    def self.matches?(color)
      color.to_s.include?("#")
    end

    private

    def to_rgb(hex)
      hex = normalize_hex(hex)

      {:r => hex[0,2].hex,
       :g => hex[2,2].hex,
       :b => hex[4,2].hex}
    end

    def normalize_hex(hex)
      hex = hex.gsub("#", "")
      (hex.length == 3 ? hex[0,1]*2 + hex[1,1]*2 + hex[2,1]*2: hex).downcase
    end
  end
end