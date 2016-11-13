# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apply/version'

Gem::Specification.new do |spec|
  spec.name          = "apply"
  spec.version       = Apply::VERSION
  spec.authors       = ["John Carney"]
  spec.email         = ["john+apply@carney.id.au"]

  spec.summary       = %q{Apply yourself selectively.}
  spec.description   = %q{Wraps single-argument procs in conditional closures.}
  spec.homepage      = "https://https://github.com/johncarney/apply"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
end
