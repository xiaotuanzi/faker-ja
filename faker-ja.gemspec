# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faker-ja/version'

Gem::Specification.new do |spec|
  spec.name          = "faker-ja"
  spec.version       = Faker::Japanese::VERSION
  spec.authors       = ["AKIYOSHI, Rigaku"]
  spec.email         = ["akiyoshi.rigaku@gmail.com"]
  spec.summary       = %q{An Japanese extension for faker gem.}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -- lib/*`.split("\n") + %w(License.txt README.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "faker"
end
