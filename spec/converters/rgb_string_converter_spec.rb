require 'spec_helper'

describe RgbStringConverter do 
  describe ".matches?" do 
    it "should match args with rgb string" do 
      expect(RgbStringConverter.matches?("rgb(51, 102, 204)")).to be_true
    end

    it "should match args with rgba string" do 
      expect(RgbStringConverter.matches?("rgba(51, 102, 204, 0.2)")).to be_true
    end

    it "should not match args without rgb string" do 
      expect(RgbStringConverter.matches?(r: 51, g: 102, b: 204)).to be_false
    end
  end
  
  describe ".rgb" do 
    it "should convert to rgb" do 
    end
  end
end