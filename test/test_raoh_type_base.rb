# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeBase < Minitest::Test
  def test_has_version_number
    refute_nil RaohType.gem_version
  end
end
