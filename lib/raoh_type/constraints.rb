# frozen_string_literal: true

module RaohType
  module Constraints
    def Inclusion
      def initialize(list, message_tpl)
        @list = list
        @message_tpl = message_tpl
      end
    end
  end
end
