# frozen_string_literal: true

module Raoh
  module Bool
    BOOL_STR_A = %w[true false].freeze
    BOOL_NUM_A = [1, 0].freeze
    def make_default(default)
      @default = default if !!default == default
    end

    def classify(obj)
      return obj if !!obj == obj

      case obj
      when String
        tmp_obj = obj.downcase
        return nil unless BOOL_STR_A.include?(tmp_obj)

        return tmp_obj == BOOL_STR_A.first

      when Numeric
        return nil unless BOOL_NUM_A.include?(obj)

        return obj.to_i == BOOL_NUM_A.first
      end

      nil
    end

    def get
      return @default if @obj.nil?

      @obj
    end
  end
end
