# frozen_array_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeArray < Minitest::Test
  def test_getter_array
    array = Sample.array_integer
    attribute = RaohType::Type.new(Array)
    attribute.set(array)
    assert attribute.get == array.dup
  end

  def test_getter_array_transform_downcase
    array = Sample.array_integer
    attribute = RaohType::Type.new(Array, transform: %i[reverse])
    attribute.set(array)
    assert attribute.get == array.dup.reverse
  end

  def test_getter_array_immutable
    array = Sample.array_integer
    array_bis = Sample.array_integer
    attribute = RaohType::Type.new(Array, immutable: true)
    attribute.set(array)
    attribute.set(array_bis)
    assert attribute.get == array.dup
  end

  def test_getter_array_is_nil
    attribute = RaohType::Type.new(Array)
    assert attribute.get.nil?
  end

  def test_getter_array_has_default
    array = Sample.array_integer
    attribute = RaohType::Type.new(Array, default: array)
    assert attribute.get == array.dup
  end

  def test_getter_array_has_wrong_default
    attribute = RaohType::Type.new(Array, default: 123)
    assert attribute.get.nil?
  end

  def test_getter_string_cast_as_array
    attribute = RaohType::Type.new(Array)
    attribute.set('543')
    assert attribute.get == ['543']
  end
end
