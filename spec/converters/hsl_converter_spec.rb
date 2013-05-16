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
  
  describe ".rgb" do 
    it "should convert to rgb" do 
    end
  end
end