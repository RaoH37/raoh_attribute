# frozen_string_literal: true

require_relative 'extends/type_bool'

module Raoh
  class Attribute
    attr_reader :klass, :transform, :immutable, :default, :metadata

    def initialize(klass, options = {})
      @obj = nil
      @initial_obj = nil
      @klass = klass
      @immutable = options.fetch(:immutable, false)
      @metadata = options.fetch(:metadata, {})
      @constraints = Constraints.new(options.fetch(:constraints, {}))

      extend(Bool) if [TrueClass, FalseClass].include?(klass)

      make_transform(options.fetch(:transform, %i[]))
      make_default(options.fetch(:default, nil))
    end

    def set(obj)
      return self if obj == @obj || (@immutable && !@obj.nil?)

      @obj = do_transform(classify(obj))
      @constraints.check!(@obj)
      @obj.freeze if @immutable
      @initial_obj = @obj.dup if @initial_obj.nil? && !@obj.nil?

      self
    end

    def get
      @obj || @default
    end

    def changed?
      return false if @obj.nil?

      @obj != @initial_obj
    end

    def was
      @initial_obj
    end

    private

    def make_transform(transform)
      transform = [transform] unless transform.is_a?(Array)
      @transform = transform.map(&:to_sym)
    end

    def make_default(default)
      @default = default if default.is_a?(klass)
    end

    def classify(obj)
      Convertor.convert(obj, @klass)
    end

    def do_transform(obj)
      return obj if @transform.empty?

      @transform.select { |method_name| obj.respond_to?(method_name) }.each do |method_name|
        obj = obj.send(method_name)
      end

      obj
    end

    def method_missing(method_name, *args, &block)
      return unless @obj.respond_to?(method_name)

      @obj.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      @obj.respond_to?(method_name) || super
    end

    def to_s
      @obj.to_s
    end
  end
end
