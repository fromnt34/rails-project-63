# frozen_string_literal: true

module HexletCode
  module Html
    class Tag
      attr_accessor :attributes

      TEMPLATE = '<%<tag>s%<attributes>s>'
      CLOSE_TAG_TEMPLATE = '</%s>'

      SINGLE_TAGS = %i[input].freeze

      def initialize(name)
        @name = name
      end

      def open_tag
        format TEMPLATE, { tag: @name, attributes: build_attributes(@attributes) }
      end

      def close_tag
        format CLOSE_TAG_TEMPLATE, @name
      end

      def to_s
        intermediate_build = format TEMPLATE, { tag: @name, attributes: build_attributes(@attributes) }

        if SINGLE_TAGS.include? @name.to_sym
          intermediate_build
        else
          intermediate_build + format(CLOSE_TAG_TEMPLATE, @name)
        end
      end

      private

      def build_attributes(attributes)
        attributes.nil? ? '' : " #{attributes}"
      end
    end
  end
end
