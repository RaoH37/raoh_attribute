# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeDate < Minitest::Test
  def test_getter_date
    date = Sample.date
    attribute = RaohType::Type.new(Date)
    attribute.set(date)
    assert attribute.get == date.dup
  end

  def test_getter_string_cast_as_date
    date, str = Sample.date_and_string
    attribute = RaohType::Type.new(Date)
    attribute.set(str)
    assert attribute.get == date
  end

  def test_getter_array_cast_as_date
    date, array = Sample.date_and_array
    attribute = RaohType::Type.new(Date)
    attribute.set(array)
    assert attribute.get == date
  end
end
