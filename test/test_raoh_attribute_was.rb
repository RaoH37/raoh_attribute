# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeString < Minitest::Test
  def test_was_nil
    attribute = Raoh::Attribute.new(String)
    assert attribute.was.nil?
  end

  def test_was_not_changed
    attribute = Raoh::Attribute.new(String)
    attribute.set('maxime')
    assert attribute.was == 'maxime'
    assert attribute.was == attribute.get
  end

  def test_was_after_changed
    attribute = Raoh::Attribute.new(String)
    attribute.set('maxime')
    attribute.set('désécot')
    assert attribute.was == 'maxime'
  end
end
