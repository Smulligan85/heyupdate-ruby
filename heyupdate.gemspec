# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heyupdate/version'

Gem::Specification.new do |spec|
  spec.name          = "heyupdate-ruby"
  spec.version       = Heyupdate::VERSION
  spec.authors       = ["Raymond Cudjoe,Hook Engine,Sean Mulligan"]
  spec.email         = ["rkcudjoe@gmail.com","sean.mulligan85@gmail.com","rkcudjoe@hookengine.com"]

  spec.summary       = %q{Ruby API wrapper for the HeyUpdate API v1}
  spec.homepage      = "https://heyupdate.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0", ">= 3.0.3"
  spec.add_development_dependency "dotenv", "~> 2.1"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "webmock", "~> 2.1.0", ">= 2.1.0"

  spec.add_runtime_dependency "faraday", "~> 0.9.2"
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.10.0'
  spec.add_runtime_dependency "json", "~> 1.8", ">= 1.8.3"
end
