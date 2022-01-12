require 'spec_helper'

describe HexConverter do 
  describe ".matches?" do 
    it "should match args with hex string" do 
      expect(HexConverter.matches?("#FFFFFF")).to be true
    end

    it "should match args with short hex string" do 
      expect(HexConverter.matches?("#FFF")).to be true
    end

    it "should match args with lower case hex string" do 
      expect(HexConverter.matches?("#ffffff")).to be true
    end

    it "should not match args without hex string" do 
      expect(HexConverter.matches?("asdf")).to be false
    end

    it "should not match args without hex string" do 
      expect(HexConverter.matches?(h: 225, s: 73, l: 57)).to be false
    end
  end

  describe ".rgba" do 
    it "should convert to rgba" do 
      conv = HexConverter.new("#3366cc")
      rgba = {r: 51, g: 102, b: 204, a: 1.0}
      expect(conv.rgba).to eq rgba
    end
  end
end
