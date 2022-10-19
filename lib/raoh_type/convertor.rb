# frozen_string_literal: true

require 'date'
require 'time'

module RaohType
  class Convertor
    class << self
      METHOD_CONVERTOR_H = {
        String => :convert_as_string,
        Integer => :convert_as_integer,
        Float => :convert_as_float,
        Array => :convert_as_array,
        Hash => :convert_as_hash,
        Time => :convert_as_time,
        Date => :convert_as_date,
        DateTime => :convert_as_datetime
      }.freeze

      def convert(obj, klass)
        # without .dup, obj is frozen
        return obj.dup if obj.is_a?(klass)

        method_convertor = METHOD_CONVERTOR_H[klass]
        raise StandardError, 'no such method convertor' if method_convertor.nil?

        new_obj = send(method_convertor, obj)
        raise StandardError, "method convertor doesn't know how to convert #{obj}" if new_obj.nil?

        new_obj
      rescue StandardError => e
        STDERR.puts e.message
        raise CastError.new(obj, klass)
      end

      def convert_as_string(obj)
        return obj.map(&:to_s).join if obj.is_a?(Array)
        return obj.to_s if obj.respond_to?(:to_s)

        raise StandardError
      end

      def convert_as_integer(obj)
        return obj.to_i if obj.respond_to?(:to_i)
        return obj.map(&:to_s).join.to_i if obj.is_a?(Array)

        raise StandardError
      end

      def convert_as_float(obj)
        return obj.to_f if obj.respond_to?(:to_f)
        return obj.map(&:to_s).join.to_f if obj.is_a?(Array)

        raise StandardError
      end

      def convert_as_array(obj)
        return obj.to_a if obj.respond_to?(:to_a)

        [obj]
      end

      def convert_as_hash(obj)
        return obj.to_h if obj.respond_to?(:to_h)

        raise StandardError
      end

      def convert_as_time(obj)
        return Time.new(*obj) if obj.is_a?(Array)
        return Time.parse(obj) if obj.is_a?(String)
        return Time.at(obj) if obj.is_a?(Numeric)

        raise StandardError
      end

      def convert_as_date(obj)
        return obj.to_date if obj.respond_to?(:to_date)
        return Date.new(*obj) if obj.is_a?(Array)
        return Date.parse(obj) if obj.is_a?(String)
        return Time.at(obj).to_date if obj.is_a?(Numeric)

        raise StandardError
      end

      def convert_as_datetime(obj)
        return obj.to_datetime if obj.respond_to?(:to_datetime)
        return DateTime.new(*obj) if obj.is_a?(Array)
        return DateTime.parse(obj) if obj.is_a?(String)
        return Time.at(obj).to_datetime if obj.is_a?(Numeric)

        raise StandardError
      end
    end
  end
end
