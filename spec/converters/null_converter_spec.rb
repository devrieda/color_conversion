require 'spec_helper'

describe NullConverter do 
  describe ".matches?" do 
    it "should always match" do 
      expect(NullConverter.matches?("blue")).to be true
      expect(NullConverter.matches?(r: 51, g: 102, b: 204)).to be true
    end
  end
  
  describe ".rgba" do 
    it "should throw an error" do 
      expect {
        conv = NullConverter.new("asdf")
        conv.rgba 
      }.to raise_error(InvalidColorError)
    end
  end
end
