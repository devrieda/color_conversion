# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_conversion/version'

Gem::Specification.new do |gem|
  gem.name          = "color_conversion"
  gem.version       = ColorConversion::VERSION
  gem.summary       = %q{Convert colors to hex/rgb/hsv}
  gem.description   = gem.summary

  gem.required_ruby_version = '>= 1.9.3'
  gem.license       = "MIT"

  gem.authors       = ["Derek DeVries"]
  gem.email         = ["derek@sportspyder.com"]
  gem.homepage      = "https://github.com/devrieda/color_conversion"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("rake")
  gem.add_development_dependency("rspec", "~> 2.9")

  # guard
  gem.add_development_dependency("guard", "~> 1.7")
  gem.add_development_dependency("guard-rspec", "~> 2.5")
  gem.add_development_dependency("rb-fsevent", "~> 0.9")
end
