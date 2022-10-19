# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeError < Minitest::Test
  def test_cast_error
    attribute = RaohType::Type.new(Integer)
    assert_raises(RaohType::CastError) { attribute.set({}) }
  end

  def test_cast_error_hash
    attribute = RaohType::Type.new(Hash)
    assert_raises(RaohType::CastError) { attribute.set([1,2,3,4,5]) }
  end
end
