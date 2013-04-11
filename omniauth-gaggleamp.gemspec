# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-gaggleamp/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-gaggleamp"
  spec.version       = OmniAuth::GaggleAMP::VERSION
  spec.authors       = ["GaggleAMP"]
  spec.email         = ["info@gaggleamp.com"]
  spec.description   = %q{A GaggleAMP OAuth2 strategy for OmniAuth.}
  spec.summary       = %q{A GaggleAMP OAuth2 strategy for OmniAuth.}
  spec.homepage      = "https://github.com/GaggleAMP/omniauth-gaggleamp"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth", "~> 1.0"
  spec.add_runtime_dependency "omniauth-oauth2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "simplecov"
end
