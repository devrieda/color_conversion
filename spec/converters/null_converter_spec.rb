require 'spec_helper'

describe NullConverter do 
  describe ".matches?" do 
    it "should always match" do 
      expect(NullConverter.matches?("blue")).to be_true
      expect(NullConverter.matches?(r: 51, g: 102, b: 204)).to be_true
    end
  end
end