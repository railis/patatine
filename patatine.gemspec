Gem::Specification.new do |spec|
  spec.name        = 'patatine'
  spec.version     = Bundler::VERSION
  spec.licenses    = ['MIT']
  spec.authors     = ["Dominik Sito"]
  spec.email       = ["dominik.sito@gmail.com"]
  spec.homepage    = "http://bundler.io"
  spec.summary     = %q{}
  spec.description = %q{}

  spec.required_ruby_version     = '>= 1.9.3'
  spec.required_rubygems_version = '>= 2.2.1'

  spec.add_development_dependency 'rspec', '~> 2.99.0.beta1'

  spec.files       = `git ls-files -z`.split("\x0")
  spec.test_files  = spec.files.grep(%r{^spec/})

  spec.executables   = %w(pat)
  spec.require_paths = ["lib"]
end
