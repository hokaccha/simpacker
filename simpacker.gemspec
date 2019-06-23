lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simpacker/version"

Gem::Specification.new do |spec|
  spec.name          = "simpacker"
  spec.version       = Simpacker::VERSION
  spec.authors       = ["Kazuhito Hokamura"]
  spec.email         = ["k.hokamura@gmail.com"]

  spec.summary       = "Integrate modern JavaScript build system with Rails."
  spec.description   = "Integrate modern JavaScript build system with Rails."
  spec.homepage      = "https://github.com/hokaccha/simpacker"
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|example)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 4.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "~> 5.2"
  spec.add_development_dependency "minitest", "~> 5.1"
end
