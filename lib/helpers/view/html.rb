# frozen_string_literal: true

module View
  module Html
    SINGLE_TAGS = %i[input].freeze

    def self.render(object)
      return object unless object.is_a?(RenderObject)

      tag = object.tag
      attrs = object.attrs
      body = ''
      object.body.each do |element|
        body += render element
      end

      tag_html = "<#{tag}#{attrs_to_html attrs}>"

      return tag_html if SINGLE_TAGS.include? tag

      tag_html + "#{body}</#{tag}>"
    end

    def self.attrs_to_html(attrs)
      return '' if attrs.empty?

      html = attrs.map { |name, value| "#{name}=\"#{value}\"" }
                  .join ' '
      " #{html}"
    end
  end
end
