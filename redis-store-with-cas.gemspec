# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'redis/store_with_cas/version'

Gem::Specification.new do |s|
  s.name        = 'redis-store-with-cas'
  s.version     = Redis::Store::StoreWithCas::VERSION
  s.authors     = ['Rajko Albrecht']
  s.email       = ['ral@alwins-world.de']
  s.homepage    = 'http://redis-store.org/redis-store'
  s.summary     = %q{Extend redis store for Ruby frameworks with cas}
  s.description = %q{Extend the redis store with CAS (compare-and-swap) functionality for better cache integrity support}

  s.rubyforge_project = 'redis-store-with-cas'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.license       = 'MIT'

  s.add_dependency 'redis', '>= 2.2', '< 4'
  s.add_dependency 'redis-store', '>= 1.1.0', '< 2'

  s.add_development_dependency 'rake',     '~> 10'
  s.add_development_dependency 'bundler',  '~> 1.3'
  s.add_development_dependency 'mocha',    '~> 0.14.0'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'git',      '~> 1.2'
  s.add_development_dependency 'pry-nav',  '~> 0.2.4'
  s.add_development_dependency 'pry',      '~> 0.10.4'
  s.add_development_dependency 'redis-store-testing'

end
