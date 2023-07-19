# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sower/version'

Gem::Specification.new do |s|
  s.name        = 'sower'
  s.version     = Sower::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'A Ruby gem to simplify Seed data creation for Rails applications.'
  s.email       = 'consult@rolemodelsoftware.com'
  s.homepage    = 'https://github.com/RoleModel/sower'
  s.description = 'A Ruby gem to simplify Seed data creation for Rails applications.'
  s.authors     = ['Jeremy Walton']
  s.license     = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.6.0'
end
