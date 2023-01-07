# frozen_string_literal: true

module HexletCode
  module Form
    DEFAULT_ATTRS = {
      action: '#',
      method: 'post'
    }.freeze

    def self.generate(object, **attrs, &block)
      attrs[:action] = attrs.delete :url if attrs.key? :url

      @form_render_object = render_object :form, **DEFAULT_ATTRS.merge(attrs)
      @form_render_object_body = @form_render_object[:body]

      @object = object

      yield(self) if block

      @form_render_object
    end

    def self.input(name, **options)
      options[:name] = name
      options[:value] = @object.public_send name

      @form_render_object_body.push render_object(:input, options)
    end

    def self.submit(value = 'Save')
      @form_render_object_body.push render_object(:input, type: :submit, value:)
    end

    def self.render_object(tag, render_options = nil, **attrs, &body)
      {
        tag:,
        attrs:,
        body: body ? [body.call] : [],
        render_options:
      }
    end
  end
end
