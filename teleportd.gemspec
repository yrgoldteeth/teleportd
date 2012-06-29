# -*- encoding: utf-8 -*-
require File.expand_path('../lib/teleportd/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas Fine"]
  gem.email         = ["nicholas.fine@gmail.com"]
  gem.description   = %q{Ruby Wrapper Library for Teleportd API}
  gem.summary       = %q{Ruby Wrapper Library for Teleportd API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "teleportd"
  gem.require_paths = ["lib"]
  gem.version       = Teleportd::VERSION

  gem.add_runtime_dependency 'json', '~> 1.7.1'
  gem.add_runtime_dependency 'active_support'
  gem.add_runtime_dependency 'i18n'
  gem.add_runtime_dependency 'curb'
  gem.add_development_dependency 'pry'
end
