require 'spec_helper'

describe Color do 
  
  describe ".new with color string" do 

    it "should initialize color by lower hex" do 
      color = Color.new("#3366cc")
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by hex with hash" do 
      color = Color.new("#3366CC")
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by short hex" do 
      color = Color.new("#36C")
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by rgb string" do 
      color = Color.new("rgb(51, 102, 204)")
    end

    it "should initialize color by rgba string" do 
      color = Color.new("rgba(51, 102, 204, 0.2)")
    end

    it "should initialize color by hsl string" do 
      color = Color.new("hsl(225, 73%, 57%)")
    end

    it "should initialize color by hsla string" do 
      color = Color.new("hsla(225, 73%, 57%, 0.5)")      
    end
    
    it "should initialize color by textual string" do 
      color = Color.new("royalblue")
    end

    it "should initialize color by textual string case" do 
      color = Color.new("RoyalBlue")
    end
  end


  describe ".new" do 
    it "should initialize color by rgb" do 
      color = Color.new(r: 51, g: 102, b: 204)
    end

    it "should initialize color by rgba" do 
      color = Color.new(r: 51, g: 102, b: 204, a: 0.5)
    end

    it "should initialize color by hsl" do 
      color = Color.new(h: 225, s: 73, l: 57)
    end

    it "should initialize color by hsla" do 
      color = Color.new(h: 225, s: 73, l: 57, a: 0.5)
    end
    
    it "should initialize color by hsv" do 
      color = Color.new(h: 220, s: 75, v: 80)
    end

    it "should initialize color by hsb" do 
      color = Color.new(h: 220, s: 75, b: 80)
    end

    it "should initialize color by cmyk" do 
      color = Color.new(c: 87, m: 69, y: 13, k: 1)
    end
  end
end
