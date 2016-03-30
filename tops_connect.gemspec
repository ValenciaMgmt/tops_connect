# frozen_string_literal: true
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tops_connect/version'

Gem::Specification.new do |spec|
  spec.name          = 'tops_connect'
  spec.version       = TopsConnect::VERSION
  spec.authors       = ['Steven Hoffman']
  spec.email         = ['shoffman@valenciamgmt.com']

  spec.summary       = 'Make use of the Tops Connect API'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
                       .reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '>= 10'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'httparty', '~> 0.13'
end
