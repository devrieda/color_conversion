require 'spec_helper'

describe ColorConverter do 
  
  describe ".rgb" do 
    it "converts color to rgb" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204)
      
      rgb = {r: 51, g: 102, b: 204}
      expect(conv.rgb).to eq rgb
    end
  end
  
  describe ".hex" do 
    it "converts color to hex" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204)      
      expect(conv.hex).to eq "#3366cc"
    end
  end
  
  describe ".hsl" do 
    it "converts color to hsl" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204)
      
      hsl = {h: 220, s: 60, l: 50}
      expect(conv.hsl).to eq hsl
    end
  end
  
  describe ".hsv" do 
    it "converts color to hsv" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204)
      
      hsv = {h: 220, s: 75, v: 80}
      expect(conv.hsv).to eq hsv
    end
  end
  
  describe ".hsb" do 
    it "converts color to hsb" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204)
      
      hsb = {h: 220, s: 75, b: 80}
      expect(conv.hsb).to eq hsb
    end
  end

  describe ".cmyk" do 
    it "converts color to cmyk" do 
      conv = RgbConverter.new(r: 64, g: 104, b: 193)

      cmyk = {c: 67, m: 46, y: 0, k: 24}
      expect(conv.cmyk).to eq cmyk
    end
  end
  
  describe ".alpha" do 
    it "finds alpha for color" do 
      conv = RgbConverter.new(r: 51, g: 102, b: 204, a: 0.5)
      expect(conv.alpha).to eq 0.5
    end
  end
end
