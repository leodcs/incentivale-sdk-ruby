lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'incentivale/version'

Gem::Specification.new do |spec|
  spec.name          = 'incentivale-sdk-ruby'
  spec.version       = Incentivale::VERSION
  spec.authors       = ['Leonardo Santos']
  spec.email         = ['aleotory@gmail.com']

  spec.description   = 'Gem to wrap incentivale.com.br API v3'
  spec.summary       = 'Gem to wrap incentivale.com.br API v3'
  spec.homepage      = 'https://github.com/leodcs/incentivale-sdk-ruby'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'json'
  spec.add_dependency 'recursive-open-struct'
  spec.add_dependency 'plissken'
  spec.add_dependency 'awrence'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
