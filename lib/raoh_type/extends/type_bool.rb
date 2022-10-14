# frozen_string_literal: true

module RaohType
  module Bool
    def make_default(default)
      @default = default if !!default == default
    end

    def classify(obj)
      if !!obj == obj
        @obj = obj
      elsif obj.is_a?(String)
        case obj.downcase
        when 'true'
          @obj = true
        when 'false'
          @obj = false
        end
      elsif obj.is_a?(Numeric)
        case obj
        when 0
          @obj = false
        when 1
          @obj = true
        end
      end

      self
    end

    def get
      return @default if @obj.nil?

      @obj
    end
  end
end
