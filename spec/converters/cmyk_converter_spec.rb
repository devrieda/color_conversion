require 'spec_helper'

describe CmykConverter do 
  describe ".matches?" do 
    it "should match args with cmyk hash" do 
      expect(CmykConverter.matches?(c: 87, m: 69, y: 13, k: 1)).to be_true
    end

    it "should not match args without cmyk hash" do 
      expect(CmykConverter.matches?(h: 225, s: 73, v: 57)).to be_false
    end
    
    it "should not match a string" do 
      expect(CmykConverter.matches?("#ffffff")).to be_false
    end
  end
  
  describe ".rgba" do 
    it "should convert to rgba" do 
      conv = CmykConverter.new(c: 74, m: 58, y: 22, k: 3)
      rgba = {r: 64, g: 104, b: 193, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

    it "should convert cymk strings to rgba" do 
      conv = CmykConverter.new(c: "74", m: "58", y: "22", k: "3")
      rgba = {r: 64, g: 104, b: 193, a: 1.0}
      expect(conv.rgba).to eq rgba
    end
  end
end
