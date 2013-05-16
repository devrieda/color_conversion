require 'spec_helper'

describe NameConverter do 
  describe ".matches?" do 
    it "should match args with name string" do 
      expect(NameConverter.matches?("blue")).to be_true
    end

    it "should match args with color insensitive string" do 
      expect(NameConverter.matches?("RoyalBlue")).to be_true
      expect(NameConverter.matches?("royalblue")).to be_true
    end

    it "should not match args without name string" do 
      expect(NameConverter.matches?("#ffffff")).to be_false
    end
  end
  
  describe ".rgb" do 
    it "should convert to rgb" do 
    end
  end
end