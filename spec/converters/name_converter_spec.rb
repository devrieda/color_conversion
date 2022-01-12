require 'spec_helper'

describe NameConverter do 
  describe ".matches?" do 
    it "should match args with name string" do 
      expect(NameConverter.matches?("blue")).to be true
    end

    it "should match args with color insensitive string" do 
      expect(NameConverter.matches?("RoyalBlue")).to be true
      expect(NameConverter.matches?("royalblue")).to be true
    end

    it "should not match args without name string" do 
      expect(NameConverter.matches?("#ffffff")).to be false
    end
  end
  
  describe ".rgb" do 
    it "should convert to rgb" do 
      conv = NameConverter.new("blue")
      rgba = {r: 0, g: 0, b: 255, a: 1.0}
      expect(conv.rgba).to eq rgba
    end
  end
end
