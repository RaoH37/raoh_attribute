# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeBase < Minitest::Test
  def test_has_version_number
    refute_nil Raoh::Attribute.gem_version
  end

  def test_self_chain
    attribute = Raoh::Attribute.new(String).set('Maxime')
    assert attribute.get == 'Maxime'
  end
end
