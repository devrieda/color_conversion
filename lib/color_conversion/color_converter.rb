module ColorConversion
  class ColorConverter
    attr_reader :rgba

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
      @rgba = to_rgba(color)
    end
  end
end