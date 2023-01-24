# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_service/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_service'
  spec.version       = ActiveService::VERSION
  spec.authors       = ['Anderson']
  spec.email         = ['andyferreira92@gmail.com']

  spec.summary       = 'Standardizes Service Objects'
  spec.description   = 'Standardizes Service Objects.'
  spec.homepage      = 'https://https://github.com/petlove/active_service'
  spec.license       = 'MIT'
  spec.files         = Dir['{lib}/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.1'

  spec.add_runtime_dependency 'awesome_print'

  spec.add_development_dependency 'dotenv', '~> 2.7.5'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '>= 0.74.0'
  spec.add_development_dependency 'rubocop-performance', '>= 1.4.1'
  spec.add_development_dependency 'simplecov', '>= 0.17.0'
end
