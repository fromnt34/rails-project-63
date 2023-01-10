# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :attrs, :inputs

    DEFAULT_ATTRS = {
      action: '#',
      method: 'post'
    }.freeze

    def initialize(object, **attrs, &block)
      attrs[:action] = attrs[:url] if attrs.key? :url
      attrs = attrs.except :url

      @attrs = DEFAULT_ATTRS.merge attrs
      @inputs = []

      @object = object

      yield(self) if block
    end

    def input(name, **attrs)
      @inputs.push input_structure(
        name:,
        value: @object.public_send(name),
        **attrs
      )
    end

    def submit(value = 'Save')
      @inputs.push input_structure(type: :submit, value:)
    end

    private

    def input_structure(**attrs)
      attrs
    end
  end
end
