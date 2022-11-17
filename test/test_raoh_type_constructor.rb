# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeConstructor < Minitest::Test
  def test_transform_is_a_array_of_string
    attribute = Raoh::Attribute.new(String, transform: %w[downcase! reverse!])
    assert attribute.transform.is_a?(Array)
    assert attribute.transform.map(&:class).uniq == [Symbol]
  end

  def test_symbol_transform
    attribute = Raoh::Attribute.new(String, transform: :downcase!)
    attribute.set('Maxime')
    assert attribute.get == 'maxime'
  end

  def test_string_transform
    attribute = Raoh::Attribute.new(String, transform: 'downcase!')
    attribute.set('Maxime')
    assert attribute.get == 'maxime'
  end
end
