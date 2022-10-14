# frozen_string_literal: true

# frozen_float_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeFloat < Minitest::Test
  def test_getter_float
    attribute = RaohType::Type.new(Float)
    attribute.set(123.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_transform_downcase
    attribute = RaohType::Type.new(Float, transform: %i[abs])
    attribute.set(-123.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_immutable
    attribute = RaohType::Type.new(Float, immutable: true)
    attribute.set(123.5)
    attribute.set(321.5)
    assert attribute.get == 123.5
  end

  def test_getter_float_is_nil
    attribute = RaohType::Type.new(Float)
    assert attribute.get.nil?
  end

  def test_getter_float_has_default
    attribute = RaohType::Type.new(Float, default: 987.5)
    assert attribute.get == 987.5
  end

  def test_getter_string_cast_as_float
    attribute = RaohType::Type.new(Float)
    attribute.set('543.5')
    assert attribute.get == 543.5
  end

  def test_getter_string_cast_as_negative_float
    attribute = RaohType::Type.new(Float)
    attribute.set('-543.5')
    assert attribute.get == -543.5
  end

  def test_getter_float_cast_as_float_and_transform
    attribute = RaohType::Type.new(Float, transform: %i[abs])
    attribute.set('-963.5')
    assert attribute.get == 963.5
  end
end
