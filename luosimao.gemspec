# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luosimao/version'

Gem::Specification.new do |spec|
  spec.name          = "luosimao"
  spec.version       = Luosimao::VERSION
  spec.authors       = ["Villins"]
  spec.email         = ["linshao512@gmail.com"]
  spec.summary       = %q{ a warpper of luosimao send message }
  spec.description   = %q{  a warpper of luosimao send message}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
