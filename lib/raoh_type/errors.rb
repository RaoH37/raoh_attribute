# frozen_string_literal: true

module RaohType
  class Error < StandardError; end

  class CastError < StandardError
    def initialize(obj, klass)
      super("#{obj} can't be cast as #{klass}")
    end
  end

  class ConstraintError < StandardError; end
end
