# frozen_string_literal: true

require_relative 'extends/type_bool'

module RaohType
  class Type
    attr_reader :klass, :transform, :immutable, :default, :metadata

    def initialize(klass, transform: %i[], immutable: false, default: nil, metadata: {})
      @obj = nil
      @klass = klass
      @immutable = immutable
      @metadata = metadata

      extend(Bool) if klass == TrueClass || klass == FalseClass

      make_transform(transform)
      make_default(default)
    end

    def set(obj)
      return self if @immutable && !@obj.nil?

      classify(obj)

      do_transform
    end

    def get
      @obj || @default
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
      @obj = Convertor.convert(obj, @klass)
      @obj.freeze if @immutable

      self
    end

    def do_transform
      return self if @transform.empty?

      @transform.select { |method_name| @obj.respond_to?(method_name) }.each do |method_name|
        @obj = @obj.send(method_name)
      end

      self
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
