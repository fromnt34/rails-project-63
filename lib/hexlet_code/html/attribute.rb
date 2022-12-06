# frozen_string_literal: true

module HexletCode
  module Html
    class Attribute
      # rubocop:disable Style/ClassVars
      @@template = '%s="%s"'
      # rubocop:enable Style/ClassVars

      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s
        format @@template, @name, @value
      end
    end
  end
end
