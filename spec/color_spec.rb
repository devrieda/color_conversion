require 'spec_helper'

describe Color do 
  
  describe ".new" do 
    
    it "should initialize color by rgb hash" do 
      color = Color.new(r: 255, g: 255, b: 255)
    end
    
    it "should initialize color by rgba hash" do 
      color = Color.new(r: 255, g: 255, b: 255, a: 0.5)
    end

    it "should initialize color by hsl hash" do 
      color = Color.new(h: 0, s: 100, l: 100)
    end

    it "should initialize color by hsla hash" do 
      color = Color.new(h: 0, s: 100, l: 100, a: 0.5)
    end

    it "should initialize color by lower hex" do 
      color = Color.new("#ffffff")
    end

    it "should initialize color by hex without hash" do 
      color = Color.new("FFFFFF")
    end

    it "should initialize color by hex with hash" do 
      color = Color.new("#FFFFFF")
    end

    it "should initialize color by short hex" do 
      color = Color.new("#C3C")
    end

    it "should initialize color by rgb string" do 
      color = Color.new("rgb(255,255,255)")
    end

    it "should initialize color by rgb string with spaces" do 
      color = Color.new("rgb( 255, 255, 255 )")
    end

    it "should initialize color by rgba string" do 
      color = Color.new("rgba(255,255,255,0.2)")
    end

    it "should initialize color by rgba string with spaces" do 
      color = Color.new("rgba(255, 255, 255, 0.2)")
    end

    it "should initialize color by hsl string" do 
      color = Color.new("hsl(0,100%,100%)")
    end

    it "should initialize color by hsl string with spaces" do 
      color = Color.new("hsl(0, 100%, 100%)")
    end

    it "should initialize color by hsla string" do 
      color = Color.new("hsla(0,100%,100%,0.5)")
      
    end

    it "should initialize color by hsla string with spaces" do 
      color = Color.new("hsla(0, 100%, 100%, 0.5)")
    end
    
    it "should initialize color by textual string" do 
      color = Color.new("white")
    end

  end

end
