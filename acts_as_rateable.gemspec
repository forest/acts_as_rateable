# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_rateable/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_rateable"
  s.version     = ActsAsRateable::VERSION
  s.authors     = ["Jason Rust"]
  s.email       = ["jason@lessonplanet.com"]
  s.homepage    = ""
  s.summary     = %q{Rails plugin providing a rating interface for ActiveRecord models}
  s.description = %q{Rails plugin providing a rating interface for ActiveRecord models}

  s.rubyforge_project = "lessonplanet-acts_as_rateable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
