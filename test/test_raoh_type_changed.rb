# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeChanged < Minitest::Test
  def test_unset_not_changed
    attribute = RaohType::Type.new(String)
    refute_nil attribute.changed?
    assert !attribute.changed?
  end

  def test_string_not_changed
    attribute = RaohType::Type.new(String)
    attribute.set('Maxime')
    attribute.set('Maxime')
    refute_nil attribute.changed?
    assert !attribute.changed?
  end

  def test_first_set_not_changed
    attribute = RaohType::Type.new(String)
    attribute.set('Maxime')
    refute_nil attribute.changed?
    assert !attribute.changed?
  end

  def test_string_changed
    attribute = RaohType::Type.new(String)
    attribute.set('Maxime')
    attribute.set('Désécot')
    refute_nil attribute.changed?
    assert attribute.changed?
  end
end
