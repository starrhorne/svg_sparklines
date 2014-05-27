# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svg_sparklines/version'

Gem::Specification.new do |spec|
  spec.name          = "svg_sparklines"
  spec.version       = SvgSparklines::VERSION
  spec.authors       = ["Starr Horne"]
  spec.email         = ["snhorne@gmail.com"]
  spec.description   = %q{Svg sparkline generator}
  spec.summary       = %q{Svg sparkline generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3"
end
