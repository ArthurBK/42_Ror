# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taillste/version'

Gem::Specification.new do |spec|
  spec.name          = "taillste"
  spec.version       = Taillste::VERSION
  spec.authors       = ["sballet"]
  spec.email         = ["sballet@student.42.fr"]

  spec.summary       = %q{Gem a but pedagogique}
  spec.license       = "MIT"


  spec.files         = [".travis.yml",
 "Gemfile",
 "LICENSE.txt",
 "README.md",
 "Rakefile",
 "bin/console",
 "bin/setup",
 "lib/taillste.rb",
 "lib/taillste/version.rb",
 "taillste.gemspec",
 "test/taillste_test.rb",
 "test/test_helper.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
