# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'b2b_center_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'b2b_center_api'
  spec.version       = B2bCenterApi::VERSION
  spec.authors       = ['Archakov Aleksandr']
  spec.email         = ['archakov@gmail.com']
  spec.description   = %q{API for b2b-center.}
  spec.summary       = %q{B2B Center API}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
