# frozen_string_literal: true

module HexletCode
  module Html
    class Tag
      SINGLE_TAGS = %i[input].freeze

      def initialize(tag, **attrs, &body)
        @tag = tag
        @attrs = attrs
        @body = body ? yield : []
      end

      def html
        tag_html = "<#{@tag}#{attrs_to_html @attrs}>"

        return tag_html if SINGLE_TAGS.include? @tag

        tag_html + "#{@body}</#{@tag}>"
      end

      private

      def attrs_to_html(attrs)
        attrs.map { |name, value| " #{name}=\"#{value}\"" }
             .join
      end
    end
  end
end
