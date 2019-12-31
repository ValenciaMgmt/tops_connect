# frozen_string_literal: true

# Copyright (c) 2019 Valencia Management Group
# All rights reserved.

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tops_connect/version'

Gem::Specification.new do |spec|
  spec.name = 'tops_connect'
  spec.version = TopsConnect::VERSION
  spec.authors = ['Steven Hoffman']
  spec.email = ['shoffman@valenciamgmt.com']

  spec.summary = 'Make use of the Tops Connect API'
  spec.homepage = 'https://github.com/ValenciaMgmt/tops_connect'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'webmock', '~> 3.4'

  spec.add_dependency 'httparty', '~> 0.16'
end
