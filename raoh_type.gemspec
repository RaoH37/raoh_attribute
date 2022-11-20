# frozen_string_literal: true

require_relative 'lib/attribute/version'

Gem::Specification.new do |spec|
  spec.name = 'raoh_attribute'
  spec.version = Raoh::Attribute.gem_version
  spec.authors = ['Maxime Désécot']
  spec.email = ['maxime.desecot@gmail.com']

  spec.summary = 'RAOH Attribute'
  spec.description = 'Simple class to automatically convert and transform an object into another type'
  spec.homepage = 'https://github.com/RaoH37/raoh_attribute'
  spec.license = 'GPL-3.0'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.require_paths = ['lib']
end
