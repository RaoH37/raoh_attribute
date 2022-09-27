# frozen_string_literal: true

module RaohType
  class Convertor
    class << self
      # maybe use class => Array[Symbol]
      @@class_method_convertor_h = {
        String => :to_s,
        Integer => :to_i,
        Float => :to_f
      }

      def convert(obj, klass)
        # without .dup, obj is frozen
        return obj.dup if obj.is_a?(klass)

        method_convertor = @@class_method_convertor_h[klass]
        return nil if method_convertor.nil?
        return nil unless obj.respond_to?(method_convertor)

        obj.send(method_convertor)
      end

      # def string_convert(obj)
      #   return obj if obj.is_a?(String)
      #   return obj.to_s if obj.respond_to?(:to_s)
      #
      #   nil
      # end
    end
  end
end
