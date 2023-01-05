# frozen_string_literal: true

module HexletCode
  module Html
    class Tag
      SINGLE_TAGS = %i[input].freeze

      def self.generate(tag, **attributes, &block)
        content = block.nil? ? '' : block.call
        tag_html = "<#{tag}#{attributes_to_html attributes}>"

        return tag_html if SINGLE_TAGS.include? tag

        tag_html + "#{content}</#{tag}>"
      end

      def self.attributes_to_html(attributes)
        return '' if attributes.empty?

        html = attributes.map { |name, value| "#{name}=\"#{value}\"" }
                         .join ' '
        " #{html}"
      end
    end
  end
end
