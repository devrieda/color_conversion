require 'spec_helper'

describe HslConverter do 
  describe ".matches?" do 
    it "should match args with hsl hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, l: 57)).to be true
    end

    it "should match args with hsla hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, l: 57, a: 0.5)).to be true
    end

    it "should not match args without hsl hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, v: 57)).to be false
    end
    
    it "should not match a string" do 
      expect(HslConverter.matches?("#ffffff")).to be false
    end
  end
  
  describe ".rgba" do 
    it "should convert hsl to rgba" do 
      conv = HslConverter.new(h: 225, s: 73, l: 57)
      rgba = {r: 65, g: 105, b: 225, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

    it "should convert hsla to rgba" do 
      conv = HslConverter.new(h: 225, s: 73, l: 57, a: 0.5)
      rgba = {r: 65, g: 105, b: 225, a: 0.5}
      expect(conv.rgba).to eq rgba
    end

    it "should convert hsl string to rgba" do 
      conv = HslConverter.new(h: "225", s: "73%", l: "57%", a: "0.5")
      rgba = {r: 65, g: 105, b: 225, a: 0.5}
      expect(conv.rgba).to eq rgba
    end

    it 'should return equal values when saturation is 0' do
      conv = HslConverter.new(h: "225", s: "0%", l: "20%", a: "0.5")
      rgba = {r: 51, g: 51, b: 51, a: 0.5}
      expect(conv.rgba).to eq rgba
    end
  end
end
