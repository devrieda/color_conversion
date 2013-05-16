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
  
  describe ".rgb" do 
    it "should convert to rgb" do 
    end
  end
end