# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grandstream/version'

Gem::Specification.new do |spec|
  spec.name          = "grandstream_camera"
  spec.version       = Grandstream::VERSION
  spec.authors       = ["Joe Bellus"]
  spec.email         = ["joe@5sigma.io"]
  spec.summary       = %q{A client interface to the HTTP Api for grandstream IP cameras}
  spec.description   = %q{Grandstream IP camera HTTP api for setting and retrieving camera options and performing various tasks.}
  spec.homepage      = "https://github.com/ViaoV/grandstream_camera"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
