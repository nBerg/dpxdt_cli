# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dpxdt_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "dpxdt_cli"
  spec.version       = DpxdtCli::VERSION
  spec.authors       = ["Nina Berg"]
  spec.email         = ["nikb100@gmail.com"]
  spec.summary       = %q{CLI tool to help work with ccn dpxdt configs}
  spec.description   = %q{longer description goes here}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "deep_merge"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
end
