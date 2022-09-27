# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeString < Minitest::Test
  def test_has_version_number
    refute_nil RaohType.gem_version
  end

  def test_getter_string
    attribute = RaohType::Type.new(String)
    attribute.set('Maxime')
    assert attribute.get == 'Maxime'
  end

  def test_getter_string_transform_downcase
    attribute = RaohType::Type.new(String, transform: %i[downcase!])
    attribute.set('Maxime')
    assert attribute.get == 'maxime'
  end

  def test_getter_string_transform_upcase
    attribute = RaohType::Type.new(String, transform: %i[upcase!])
    attribute.set('Maxime')
    assert attribute.get == 'MAXIME'
  end

  def test_getter_string_immutable
    attribute = RaohType::Type.new(String, immutable: true)
    attribute.set('Maxime')
    attribute.set('MAXIME')
    assert attribute.get == 'Maxime'
  end

  def test_getter_string_is_nil
    attribute = RaohType::Type.new(String)
    assert attribute.get.nil?
  end

  def test_getter_string_has_default
    attribute = RaohType::Type.new(String, default: 'Maxime')
    assert attribute.get == 'Maxime'
  end

  def test_getter_integer_cast_as_string
    attribute = RaohType::Type.new(String)
    attribute.set(123)
    assert attribute.get == '123'
  end

  def test_getter_integer_cast_as_string_and_transform
    attribute = RaohType::Type.new(String, transform: %i[reverse!])
    attribute.set(123)
    assert attribute.get == '321'
  end
end
