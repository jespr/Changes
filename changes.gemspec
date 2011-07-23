# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "changes/version"

Gem::Specification.new do |s|
  s.name        = "changes"
  s.version     = Changes::VERSION
  s.authors     = ["Jesper Christiansen"]
  s.email       = ["jesper@creativegenius.dk"]
  s.homepage    = "http://www.github.com/jespr/changes"
  s.summary     = %q{Adds logging of changes to your model}
  s.description = %q{Adds logging of changes to your model, so you can see a list of changes - and what the values were changed from}

  s.rubyforge_project = "changes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
