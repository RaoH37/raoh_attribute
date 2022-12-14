# frozen_integer_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeInteger < Minitest::Test
  def test_getter_integer
    attribute = Raoh::Attribute.new(Integer)
    attribute.set(123)
    assert attribute.get == 123
  end

  def test_getter_integer_transform_downcase
    attribute = Raoh::Attribute.new(Integer, transform: %i[abs])
    attribute.set(-123)
    assert attribute.get == 123
  end

  def test_getter_integer_immutable
    attribute = Raoh::Attribute.new(Integer, immutable: true)
    attribute.set(123)
    attribute.set(321)
    assert attribute.get == 123
  end

  def test_getter_integer_is_nil
    attribute = Raoh::Attribute.new(Integer)
    assert attribute.get.nil?
  end

  def test_getter_integer_has_default
    attribute = Raoh::Attribute.new(Integer, default: 987)
    assert attribute.get == 987
  end

  def test_getter_string_cast_as_integer
    attribute = Raoh::Attribute.new(Integer)
    attribute.set('543')
    assert attribute.get == 543
  end

  def test_getter_array_cast_as_integer
    attribute = Raoh::Attribute.new(Integer)
    attribute.set([1, 2, 3])
    assert attribute.get == 123
  end

  def test_getter_string_cast_as_negative_integer
    attribute = Raoh::Attribute.new(Integer)
    attribute.set('-543')
    assert attribute.get == -543
  end

  def test_getter_integer_cast_as_integer_and_transform
    attribute = Raoh::Attribute.new(Integer, transform: %i[abs])
    attribute.set('-963')
    assert attribute.get == 963
  end
end
