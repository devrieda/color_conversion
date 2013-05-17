require 'spec_helper'

describe HsvConverter do 
  describe ".matches?" do 
    it "should match args with hsv hash" do 
      expect(HsvConverter.matches?(h: 225, s: 73, v: 57)).to be_true
    end

    it "should not match args without hsv hash" do 
      expect(HsvConverter.matches?(h: 225, s: 73, l: 57)).to be_false
    end
    
    it "should not match a string" do 
      expect(HsvConverter.matches?("#ffffff")).to be_false
    end
  end
  
  describe ".rgba" do 
    it "should convert to rgba" do 
      conv = HsvConverter.new(h: 220, s: 75, v: 80)
      rgba = {r: 51, g: 102, b: 204, a: 1.0}
      expect(conv.rgba).to eq rgba
    end
  end
end