# frozen_string_literal: true

module RaohType
  class Type
    attr_reader :metadata

    def initialize(klass, transform: %i[], immutable: false, default: nil, metadata: {})
      @obj = nil
      @klass = klass
      @transform = transform
      @immutable = immutable
      @default = default
      @metadata = metadata
    end

    def set(obj)
      return self if @immutable && !@obj.nil?

      classify(obj)
      transform
    end

    def get
      @obj || @default
    end

    private

    def classify(obj)
      @obj = Convertor.convert(obj, @klass)

      self
    end

    def transform
      return self if @transform.empty?

      @transform.select { |method_name| @obj.respond_to?(method_name) }.each do |method_name|
        @obj = @obj.send(method_name)
      end

      self
    end

    def method_missing(method, *args, &block)
      return unless @obj.respond_to?(method)

      @obj.send(method, *args, &block)
    end

    def to_s
      @obj.to_s
    end
  end
end
