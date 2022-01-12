require 'spec_helper'

describe RgbStringConverter do 
  describe ".matches?" do 
    it "should match args with rgb string" do 
      expect(RgbStringConverter.matches?("rgb(51, 102, 204)")).to be true
    end

    it "should match args with rgba string" do 
      expect(RgbStringConverter.matches?("rgba(51, 102, 204, 0.2)")).to be true
    end

    it "should not match args without rgb string" do 
      expect(RgbStringConverter.matches?(r: 51, g: 102, b: 204)).to be false
    end
  end
  
  describe ".rgb" do 
    it "should convert rgb to rgba" do 
      conv = RgbStringConverter.new("rgb(51, 102, 204)")
      rgba = {r: 51, g: 102, b: 204, a: 1.0}
      expect(conv.rgba).to eq rgba
    end

    it "should convert rgba to rgba" do 
      conv = RgbStringConverter.new("rgba(51, 102, 204, 0.5)")
      rgba = {r: 51, g: 102, b: 204, a: 0.5}
      expect(conv.rgba).to eq rgba
    end

    it "should raise error for invalid color values" do 
      expect {
        conv = RgbStringConverter.new("rgba(foo)")
        conv.rgba 
      }.to raise_error(InvalidColorError)
    end

    it "should raise error for missing values" do 
      expect {
        conv = RgbStringConverter.new("rgba(51, 102)")
        conv.rgba 
      }.to raise_error(InvalidColorError)
    end
  end
end
