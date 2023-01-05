# frozen_string_literal: true

module HexletCode
  module Form
    autoload :RenderObject, 'hexlet_code/render_object'
    autoload :FormInputs, 'hexlet_code/form/form_inputs'

    DEFAULT_ATTRS = {
      action: '#',
      method: 'post'
    }.freeze

    def self.generate(object, **attrs, &block)
      @form_render_object = RenderObject.new :form, **DEFAULT_ATTRS.merge(attrs)

      @object = object

      block&.call self

      @form_render_object
    end

    def self.input(name, **options)
      label = RenderObject.new(:label, for: name) { name.to_s.capitalize }

      type = options.fetch(:as, 'input').capitalize
      options[:name] = name
      options = options.except(:as)
      value = @object.public_send name
      input = const_get("FormInputs::#{type}").generate(options, value)

      @form_render_object.push label, input
    end

    def self.submit(value = 'Save')
      @form_render_object.push RenderObject.new(:input, type: :submit, value:)
    end
  end
end
