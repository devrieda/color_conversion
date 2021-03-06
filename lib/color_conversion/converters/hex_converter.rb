module ColorConversion
  class HexConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)

      color.include?("#") && [4, 7].include?(color.length)
    end

    private

    def to_rgba(hex)
      hex = normalize_hex(hex)

      {:r => hex[0,2].hex,
       :g => hex[2,2].hex,
       :b => hex[4,2].hex, 
       :a => 1.0}
    end

    def normalize_hex(hex)
      hex = hex.gsub("#", "")
      (hex.length == 3 ? hex[0,1]*2 + hex[1,1]*2 + hex[2,1]*2: hex).downcase
    end
  end
end