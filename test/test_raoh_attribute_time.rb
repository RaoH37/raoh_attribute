# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeTime < Minitest::Test
  def test_getter_time
    time = Sample.time
    attribute = Raoh::Attribute.new(Time)
    attribute.set(time)
    assert attribute.get == time.dup
  end

  def test_getter_string_cast_as_time
    time, str = Sample.time_and_string
    attribute = Raoh::Attribute.new(Time)
    attribute.set(str)
    assert attribute.get == time
  end

  def test_getter_array_cast_as_time
    time, array = Sample.time_and_array
    attribute = Raoh::Attribute.new(Time)
    attribute.set(array)
    assert attribute.get == time
  end
end
