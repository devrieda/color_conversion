module ColorConversion
  class ColorConverter
    attr_reader :rgb

    # keep track of subclasses for factory
    class << self
      attr_reader :converters
    end

    @converters = []

    def self.inherited(subclass)
      ColorConverter.converters << subclass
    end

    def self.factory(color)
      converter = ColorConverter.converters.find do |klass| 
        klass.matches?(color)
      end
      converter.new(color) if converter
    end
    
    def initialize(color)
      @rgb = to_rgb(color)
    end
  end
end