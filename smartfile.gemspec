# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'
 
Gem::Specification.new do |s|
  s.name        = "smartfile"
  s.version     = "0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan L. Johnson"]
  s.email       = ["rjs6143@gmail.com"]
  s.homepage    = "http://ryanjohnson.mobi"
  s.summary     = "SmartFile API Wrapper"
  s.description = "Easily use the SmartFile APIs within your ruby or rails project."
  s.files       = Dir.glob("{lib}/**/*") + %w(README.md ROADMAP.md CHANGELOG.md)
  s.test_files  = Dir["test/**/*"] 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"
  s.add_development_dependency 'minitest', '~> 2.2.0'
  s.add_development_dependency 'http', '~> 0.6.0'
  s.add_development_dependency 'webmock'

 

end
