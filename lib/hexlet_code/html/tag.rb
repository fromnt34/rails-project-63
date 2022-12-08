# frozen_string_literal: true

module HexletCode
  module Html
    class Tag
      SINGLE_TAGS = %w[input].freeze

      def initialize(tag, **attributes, &block)
        @tag_name = tag
        html_attributes = attributes.empty? ? '' : " #{attributes_to_html attributes}"
        @content = block.nil? ? '' : block.call
        @tag = "<#{tag}#{html_attributes}>"
      end

      def to_s
        if SINGLE_TAGS.include? @tag_name
          @tag
        else
          @tag + "#{@content}</#{@tag_name}>"
        end
      end

      private

      def attributes_to_html(attributes)
        attributes.map { |name, value| "#{name}=\"#{value}\"" }
                  .join ' '
      end
    end
  end
end
