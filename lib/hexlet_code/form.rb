# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :render_object

    DEFAULT_ATTRS = {
      action: '#',
      method: 'post'
    }.freeze

    def initialize(object, **attrs, &block)
      attrs[:action] = attrs[:url] if attrs.key? :url
      attrs = attrs.except :url

      @render_object = generate_render_object :form, **DEFAULT_ATTRS.merge(attrs)
      @body = @render_object[:body]

      @object = object

      yield(self) if block
    end

    def input(name, **options)
      @body.push generate_render_object(
        :input,
        name:,
        value: @object.public_send(name),
        **options
      )
    end

    def submit(value = 'Save')
      @body.push generate_render_object(:input, type: :submit, value:)
    end

    private

    def generate_render_object(tag, **attrs, &body)
      {
        tag:,
        attrs:,
        body: body ? [body.call] : []
      }
    end
  end
end
