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
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by rgba string" do 
      color = Color.new("rgba(51, 102, 204, 0.2)")
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
      expect(color.alpha).to eq 0.2
    end

    it "should initialize color by hsl string" do 
      color = Color.new("hsl(225, 73%, 57%)")
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
    end

    it "should initialize color by hsla string" do 
      color = Color.new("hsla(225, 73%, 57%, 0.5)")      
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
      expect(color.alpha).to eq 0.5
    end
    
    it "should initialize color by textual string" do 
      color = Color.new("royalblue")
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
    end

    it "should initialize color by textual string case" do 
      color = Color.new("RoyalBlue")
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
    end
  end


  describe ".new" do 
    it "should initialize color by rgb" do 
      color = Color.new(r: 51, g: 102, b: 204)
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by rgba" do 
      color = Color.new(r: 51, g: 102, b: 204, a: 0.5)
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
      expect(color.alpha).to eq 0.5
    end

    it "should initialize color by hsl" do 
      color = Color.new(h: 225, s: 73, l: 57)
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
    end

    it "should initialize color by hsla" do 
      color = Color.new(h: 225, s: 73, l: 57, a: 0.5)
      expect(color.rgb).to eq(r: 65, g: 105, b: 225)
      expect(color.alpha).to eq 0.5
    end
    
    it "should initialize color by hsv" do 
      color = Color.new(h: 220, s: 75, v: 80)
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by hsb" do 
      color = Color.new(h: 220, s: 75, b: 80)
      expect(color.rgb).to eq(r: 51, g: 102, b: 204)
    end

    it "should initialize color by cmyk" do 
      color = Color.new(c: 74, m: 58, y: 22, k: 3)
      expect(color.rgb).to eq(r: 64, g: 104, b: 193)
    end
  end
end
