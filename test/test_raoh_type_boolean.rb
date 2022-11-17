
# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeBoolean < Minitest::Test
  def test_getter_true
    attribute = Raoh::Attribute.new(TrueClass)
    attribute.set(true)
    assert attribute.get
  end

  def test_getter_false
    attribute = Raoh::Attribute.new(TrueClass)
    attribute.set(false)
    assert attribute.get == false
  end

  def test_getter_string_true_cast_as_boolean
    attribute = Raoh::Attribute.new(TrueClass)
    attribute.set('TRUE')
    assert attribute.get
  end

  def test_getter_string_false_cast_as_boolean
    attribute = Raoh::Attribute.new(TrueClass)
    attribute.set('FALSE')
    assert attribute.get == false
  end
end
