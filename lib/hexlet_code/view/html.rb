# frozen_string_literal: true

module HexletCode
  module View
    module Html
      autoload :Form, 'hexlet_code/view/html/form'

      SINGLE_TAGS = %i[input].freeze

      # rubocop:disable Metrics/AbcSize
      def self.render(object)
        return object unless object.is_a? Hash

        tag = object[:tag]

        # Скорее всего это можно вынести с помощью const_get
        if tag == :input && object[:render_options]
          render_options = object[:render_options]

          name = render_options[:name]
          label = ::HexletCode::Form.render_object(:label, for: name) { name.to_s.capitalize }

          type = render_options.fetch(:as, 'input').capitalize
          input = const_get("Form::Inputs::#{type}").generate(render_options.except(:as))

          return render(label) + render(input)
        end

        attrs = object[:attrs]
        body = build_body object[:body]

        tag_to_html tag, attrs, body
      end
      # rubocop:enable Metrics/AbcSize

      def self.build_body(body)
        body.reduce('') { |acc, elem| acc + render(elem) }
      end

      def self.tag_to_html(tag, attrs, body)
        tag_html = "<#{tag}#{attrs_to_html attrs}>"

        return tag_html if SINGLE_TAGS.include? tag

        tag_html + "#{body}</#{tag}>"
      end

      def self.attrs_to_html(attrs)
        return '' if attrs.empty?

        attrs.map { |name, value| " #{name}=\"#{value}\"" }
             .join
      end
    end
  end
end
