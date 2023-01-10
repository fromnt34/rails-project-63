# frozen_string_literal: true

module HexletCode
  module Html
    autoload :Form, 'hexlet_code/html/form'
    autoload :Tag, 'hexlet_code/html/tag'

    # rubocop:disable Metrics/AbcSize
    def self.render(object)
      return object unless object.is_a? Hash

      tag = object[:tag]
      attrs = object[:attrs]

      if tag == :input && attrs[:type] != :submit
        name = attrs[:name]
        label = Tag.new(:label, for: name) { name.capitalize }.html

        type = attrs.fetch(:as, 'input').capitalize
        input = const_get("Form::Inputs::#{type}").generate(attrs.except(:as))

        return label + input
      end

      body = build_body object[:body]

      Tag.new(tag, **attrs) { body }.html
    end
    # rubocop:enable Metrics/AbcSize

    def self.build_body(body)
      body.reduce('') { |acc, elem| acc + render(elem) }
    end
  end
end
