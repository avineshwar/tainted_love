# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tainted_love/version'

Gem::Specification.new do |spec|
  spec.name          = 'tainted_love'
  spec.version       = TaintedLove::VERSION
  spec.authors       = ['Benoit Cote-Jodoin']
  spec.email         = ['benoit.cotejodoin@shopify.com']

  spec.summary       = 'TaintedLove is a dynamic taint reporter'
  spec.homepage      = 'https://github.com/Shopify/tainted_love'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/Shopify/tainted_love'
    spec.metadata['changelog_uri'] = 'https://github.com/Shopify/tainted_love'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency('sinatra', '~> 2.0.5')
  spec.add_development_dependency('bundler', '~> 1.17')
  spec.add_development_dependency('rake', '~> 10.0')
  spec.add_development_dependency('rspec', '~> 3.0')
  spec.add_development_dependency('rubocop', '~> 0.65.0')
  spec.add_development_dependency('yard', '~> 0.9.18')
end
