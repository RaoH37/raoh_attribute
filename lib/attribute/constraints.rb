# frozen_string_literal: true

module Raoh
  class Constraints
    OPTIONS = {
      min_size: nil,
      max_size: nil,
      min_value: nil,
      max_value: nil,
      format: nil,
      only: [],
      except: []
    }.freeze
    def initialize(options)
      # @min_size = options.fetch(:min_size, nil)
      # @max_size = options.fetch(:max_size, nil)
      # @min_value = options.fetch(:min_value, nil)
      # @max_value = options.fetch(:max_value, nil)
      # @format = options.fetch(:format, nil)
      # @only = options.fetch(:only, [])
      # @except = options.fetch(:except, [])

      OPTIONS.each do |key, value|
        options_value = options.fetch(key, value)
        instance_variable_set("@#{key}", options_value)
      end
    end

    def check!(obj)
      check_size(obj)
      check_value(obj)
      check_format(obj)
      check_inclusion(obj)
    end

    private

    def check_size(obj)
      return unless (!@min_size.nil? && obj.size < @min_size) || (!@max_size.nil? && obj.size > @max_size)

      raise ConstraintError, "#{obj} violates size constraints [#{@min_size}..#{@max_size}]"
    end

    def check_value(obj)
      return unless (!@min_value.nil? && obj < @min_value) || (!@max_value.nil? && obj > @max_value)

      raise ConstraintError, "#{obj} violates range constraints [#{@min_value}..#{@max_value}]"
    end

    def check_format(obj)
      return if @format.nil?

      raise ConstraintError, "#{obj} violates regex constraints #{@format}" unless @format.match?(obj)
    end

    def check_inclusion(obj)
      return if @only.empty? && @except.empty?

      raise ConstraintError, "#{obj} violates inclusion constraints #{@except}" if @except.include?(obj)

      return if @only.empty?

      raise ConstraintError, "#{obj} violates inclusion constraints #{@only}" unless @only.include?(obj)
    end
  end
end
