require 'spec_helper'

describe HslStringConverter do 
  describe ".matches?" do 
    it "should match args with hsl string" do 
      expect(HslStringConverter.matches?("hsl(225, 73%, 57%)")).to be_true
    end

    it "should match args with hsla string" do 
      expect(HslStringConverter.matches?("hsla(225, 73%, 57%, 0.5)")).to be_true
    end

    it "should not match args without hsl string" do 
      expect(HslStringConverter.matches?(h: 225, s: 73, l: 57)).to be_false
    end
  end
  
  describe ".rgba" do 
    it "should convert hsl to rgba" do 
      conv = HslStringConverter.new("hsl(225, 73%, 57%)")
      rgba = {r: 65, g: 105, b: 225, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

    it "should convert hsla to rgba" do 
      conv = HslStringConverter.new("hsla(225, 73%, 57%, 0.5)")
      rgba = {r: 65, g: 105, b: 225, a: 0.5}
      expect(conv.rgba).to eq rgba
    end
  end
end