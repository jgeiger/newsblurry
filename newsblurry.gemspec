# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "newsblurry/version"

Gem::Specification.new do |s|
  s.name    = "newsblurry"
  s.version = Newsblurry::VERSION
  s.platform = Gem::Platform::RUBY

  s.authors  = ["Joey Geiger"]
  s.email    = "jgeiger@gmail.com"
  s.homepage = "http://github.com/jgeiger/newsblurry"

  s.summary     = "Newsblurry is a Ruby client for the Newsblur API."
  s.description = "Access your Newsblur feed using Ruby."
  s.licenses    = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "httparty"

  s.add_development_dependency "webmock"
  s.add_development_dependency "pry"
end
