# frozen_string_literal: true

module HexletCode
  module Html
    class Attribute
      TEMPLATE = '%s="%s"'

      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s
        format TEMPLATE, @name, @value
      end
    end
  end
end
