require 'spec_helper'

describe HslConverter do 
  describe ".matches?" do 
    it "should match args with hsl hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, l: 57)).to be_true
    end

    it "should match args with hsla hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, l: 57, a: 0.5)).to be_true
    end

    it "should not match args without hsl hash" do 
      expect(HslConverter.matches?(h: 225, s: 73, v: 57)).to be_false
    end
    
    it "should not match a string" do 
      expect(HslConverter.matches?("#ffffff")).to be_false
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
  end
end