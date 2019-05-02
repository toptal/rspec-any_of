lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/any_of/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-any_of'
  spec.version       = RSpec::AnyOf::VERSION
  spec.authors       = ['Arkadiy Zabazhanov']
  spec.email         = ['open-source@toptal.com']

  spec.summary       = "rspec-any_of-#{RSpec::AnyOf::VERSION}"
  spec.description   = 'HTML equivalence RSpec matcher'
  spec.homepage      = 'https://github.com/toptal/rspec-any_of'

  spec.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rspec-expectations', '~> 3.0'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
