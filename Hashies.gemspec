# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hashies/version'

Gem::Specification.new do |spec|
  spec.name          = "hashies"
  spec.version       = Hashies::VERSION
  spec.authors       = ["Alex Rehsitd"]
  spec.email         = ["qblake.public@gmail.com"]
  spec.description   = %q{gem description}
  spec.summary       = %q{gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
