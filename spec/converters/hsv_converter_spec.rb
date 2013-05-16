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
end