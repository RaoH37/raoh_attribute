# frozen_string_literal: true

require_relative 'test_helper'
require 'mocha/minitest'

class TestRaohTypeConstraints < Minitest::Test
  def test_constraint_min_size_ok
    attribute = RaohType::Type.new(String, constraints: { min_size: 3 })
    attribute.set('Maxime')
    assert attribute.get == 'Maxime'
  end

  def test_constraint_min_size_ko
    attribute = RaohType::Type.new(String, constraints: { min_size: 20 })
    assert_raises(RaohType::ConstraintError) do
      attribute.set('Maxime')
    end
  end

  def test_constraint_max_size_ok
    attribute = RaohType::Type.new(Array, constraints: { max_size: 10 })
    attribute.set([1,2,3,4,5])
    assert attribute.get == [1,2,3,4,5]
  end

  def test_constraint_max_size_ko
    attribute = RaohType::Type.new(Array, constraints: { max_size: 3 })
    assert_raises(RaohType::ConstraintError) do
      attribute.set([1,2,3,4,5])
    end
  end

  def test_constraint_min_value_ok
    attribute = RaohType::Type.new(Integer, constraints: { min_value: 10 })
    attribute.set(20)
    assert attribute.get == 20
  end

  def test_constraint_min_value_ko
    attribute = RaohType::Type.new(Integer, constraints: { min_value: 20 })
    assert_raises(RaohType::ConstraintError) do
      attribute.set(10)
    end
  end

  def test_constraint_max_value_ok
    attribute = RaohType::Type.new(Float, constraints: { max_value: 10 })
    attribute.set(5)
    assert attribute.get == 5
  end

  def test_constraint_max_value_ko
    attribute = RaohType::Type.new(Float, constraints: { max_value: 20 })
    assert_raises(RaohType::ConstraintError) do
      attribute.set(100.0)
    end
  end

  def test_constraint_format_ok
    attribute = RaohType::Type.new(String, constraints: { format: URI::MailTo::EMAIL_REGEXP })
    attribute.set('maxime.desecot@gmail.com')
    assert attribute.get == 'maxime.desecot@gmail.com'
  end

  def test_constraint_format_ko
    attribute = RaohType::Type.new(String, constraints: { format: URI::MailTo::EMAIL_REGEXP })
    assert_raises(RaohType::ConstraintError) do
      attribute.set('Maxime')
    end
  end

  def test_constraint_only_ok
    attribute = RaohType::Type.new(String, constraints: { only: %w[Frodo Bilbo Aragorn Galadriel Gandalf] })
    attribute.set('Aragorn')
    assert attribute.get == 'Aragorn'
  end

  def test_constraint_only_ko
    attribute = RaohType::Type.new(String, constraints: { only: %w[Frodo Bilbo Aragorn Galadriel Gandalf] })
    assert_raises(RaohType::ConstraintError) do
      attribute.set('Maxime')
    end
  end

  def test_constraint_except_ok
    attribute = RaohType::Type.new(String, constraints: { only: %w[Frodo Bilbo Aragorn Galadriel Gandalf] })
    attribute.set('Galadriel')
    assert attribute.get == 'Galadriel'
  end

  def test_constraint_except_ko
    attribute = RaohType::Type.new(String, constraints: { only: %w[Frodo Bilbo Aragorn Galadriel Gandalf] })
    assert_raises(RaohType::ConstraintError) do
      attribute.set('Maxime')
    end
  end
end
