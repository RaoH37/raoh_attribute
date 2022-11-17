# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeString < Minitest::Test
  def test_getter_string
    attribute = Raoh::Attribute.new(String)
    attribute.set('Maxime')
    assert attribute.get == 'Maxime'
  end

  def test_getter_string_transform_downcase
    attribute = Raoh::Attribute.new(String, transform: %i[downcase!])
    attribute.set('Maxime')
    refute attribute.get == 'Maxime'
    assert attribute.get == 'maxime'
  end

  def test_getter_string_transform_upcase
    attribute = Raoh::Attribute.new(String, transform: %i[upcase!])
    attribute.set('Maxime')
    refute attribute.get == 'Maxime'
    assert attribute.get == 'MAXIME'
  end

  def test_getter_string_immutable
    attribute = Raoh::Attribute.new(String, immutable: true)
    attribute.set('Maxime')
    attribute.set('MAXIME')
    assert attribute.get == 'Maxime'
  end

  def test_getter_string_is_nil
    attribute = Raoh::Attribute.new(String)
    assert attribute.get.nil?
  end

  def test_getter_string_has_default
    attribute = Raoh::Attribute.new(String, default: 'Maxime')
    assert attribute.get == 'Maxime'
  end

  def test_getter_integer_cast_as_string
    attribute = Raoh::Attribute.new(String)
    attribute.set(123)
    assert attribute.get == '123'
  end

  def test_getter_integer_cast_as_string_and_transform
    attribute = Raoh::Attribute.new(String, transform: %i[reverse!])
    attribute.set(123)
    assert attribute.get == '321'
  end
end
