# frozen_string_literal: true

# frozen_float_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeFloat < Minitest::Test
  def test_getter_float
    attribute = Raoh::Attribute.new(Float)
    attribute.set(123.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_transform_downcase
    attribute = Raoh::Attribute.new(Float, transform: %i[abs])
    attribute.set(-123.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_immutable
    attribute = Raoh::Attribute.new(Float, immutable: true)
    attribute.set(123.5)
    attribute.set(321.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_is_nil
    attribute = Raoh::Attribute.new(Float)
    assert attribute.get.nil?
  end

  def test_getter_float_has_default
    attribute = Raoh::Attribute.new(Float, default: 987.5)
    assert attribute.get == 987.5
  end

  def test_getter_string_cast_as_float
    attribute = Raoh::Attribute.new(Float)
    attribute.set('543.5')
    assert attribute.get == 543.5
  end

  def test_getter_string_cast_as_negative_float
    attribute = Raoh::Attribute.new(Float)
    attribute.set('-543.5')
    assert attribute.get == -543.5
  end

  def test_getter_float_cast_as_float_and_transform
    attribute = Raoh::Attribute.new(Float, transform: %i[abs])
    attribute.set('-963.5')
    assert attribute.get == 963.5
  end
end
