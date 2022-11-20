# frozen_string_literal: true

module Raoh
  class Attribute
    def self.gem_version
      Gem::Version.new VERSION::STRING
    end

    module VERSION
      MAJOR = 1
      MINOR = 0
      TINY  = 0

      STRING = [MAJOR, MINOR, TINY].compact.join('.')
    end
  end
end
