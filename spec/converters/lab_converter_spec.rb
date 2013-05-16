require 'spec_helper'

describe LabConverter do 
  describe ".matches?" do 
    it "should match args with lab hash" do 
      expect(LabConverter.matches?(l: 44, a: 11, b: -59)).to be_true
    end

    it "should not match args without lab hash" do 
      expect(LabConverter.matches?(h: 225, s: 73, l: 57)).to be_false
    end
    
    it "should not match a string" do 
      expect(LabConverter.matches?("#ffffff")).to be_false
    end
  end
end