require 'spec_helper'

describe HsvConverter do 
  describe ".matches?" do 
    it "should match args with hsv hash" do 
      expect(HsvConverter.matches?(h: 225, s: 73, v: 57)).to be true
    end

    it "should match args with hsb hash" do 
      expect(HsvConverter.matches?(h: 225, s: 73, b: 57)).to be true
    end

    it "should not match args without hsv hash" do 
      expect(HsvConverter.matches?(h: 225, s: 73, l: 57)).to be false
    end
    
    it "should not match a string" do 
      expect(HsvConverter.matches?("#ffffff")).to be false
    end
  end
  
  describe ".rgba" do 
    it "should convert hsv to rgba" do 
      conv = HsvConverter.new(h: 220, s: 75, v: 80)
      rgba = {r: 51, g: 102, b: 204, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

    it "should convert hsb to rgba" do 
      conv = HsvConverter.new(h: 220, s: 75, b: 80)
      rgba = {r: 51, g: 102, b: 204, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

  end
end
