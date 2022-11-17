# frozen_array_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeHash < Minitest::Test
  def test_getter_hash
    hash = Sample.hash_symbol_string
    attribute = Raoh::Attribute.new(Hash)
    attribute.set(hash)
    assert attribute.get == hash.dup
  end

  def test_getter_array_immutable
    hash = Sample.hash_symbol_string
    hash_bis = Sample.hash_string_string
    attribute = Raoh::Attribute.new(Hash, immutable: true)
    attribute.set(hash)
    attribute.set(hash_bis)
    assert attribute.get == hash.dup
  end
end
