# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'raoh_attribute'

require 'minitest/autorun'

module Sample
  class << self
    def array_integer
      (0..9).to_a.sample((4..9).to_a.sample)
    end

    def hash_symbol_string
      { first_name: 'maxime', last_name: 'désécot' }
    end

    def hash_string_string
      { 'first_name' => 'maxime', 'last_name' => 'désécot' }
    end

    def date
      Date.new(year, month, day)
    end

    def date_and_string
      date = Date.new(year, month, day)
      [date, date.strftime('%Y%m%d')]
    end

    def date_and_array
      a = [year, month, day]
      date = Date.new(*a)
      [date, a]
    end

    def time_and_string
      t = time
      [t, t.strftime('%Y%m%d%H%M%S')]
    end

    def time_and_array
      a = [year, month, day, hour, minute, second]
      t = Time.new(*a)
      [t, a]
    end

    def time
      Time.new(year, month, day, hour, minute, second)
    end

    def year
      (1984..2099).to_a.sample
    end

    def month
      (1..12).to_a.sample
    end

    def day
      (1..28).to_a.sample
    end

    def hour
      (0..23).to_a.sample
    end

    def minute
      (0..59).to_a.sample
    end

    def second
      minute
    end
  end
end