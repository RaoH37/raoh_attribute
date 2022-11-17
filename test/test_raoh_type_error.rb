# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeError < Minitest::Test
  def test_cast_error
    attribute = Raoh::Attribute.new(Integer)
    assert_raises(Raoh::CastError) { attribute.set({}) }
  end

  def test_cast_error_hash
    attribute = Raoh::Attribute.new(Hash)
    assert_raises(Raoh::CastError) { attribute.set([1, 2, 3, 4, 5]) }
  end
end
