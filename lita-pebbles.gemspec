# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/pebbles/version'

Gem::Specification.new do |spec|
  spec.name          = "lita-pebbles"
  spec.version       = Lita::Pebbles::VERSION
  spec.authors       = ["fukayatsu"]
  spec.email         = ["fukayatsu@gmail.com"]
  spec.summary       = %q{A Lita handlers for fun :)}
  spec.description   = %q{A Lita handlers for fun :)}
  spec.homepage      = "https://github.com/fukayatsu/lita-pebbles"
  spec.license       = "MIT"

  spec.metadata = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.0"
  spec.add_runtime_dependency 'pebbles-suddenly_death_string'
  spec.add_runtime_dependency 'flippy'
  spec.add_runtime_dependency 'rufus-scheduler'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
