# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acqinc/version'

Gem::Specification.new do |spec|
  spec.name          = "acqinc"
  spec.version       = Acqinc::VERSION
  spec.authors       = ["Nathaniel Hoag"]
  spec.email         = ["info@nathanielhoag.com"]
  spec.summary       = %q{Get a simple list of modules considered to be incompatible on Acquia Cloud}
  spec.description   = %q{Get a simple list of modules considered to be incompatible on Acquia Cloud}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'logger', '~> 1.2'
  spec.add_dependency 'mechanize', '~> 2.7'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
