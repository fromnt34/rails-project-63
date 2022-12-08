# frozen_string_literal: true

module HexletCode
  module Html
    module SpecialTags
      class Form
        def initialize(object, **attributes, &block)
          @object = object

          @attributes = attributes
          @attributes[:action] ||= '#'
          @attributes[:method] ||= 'post'

          @content = ''

          block&.call self
        end

        def to_s
          Html::Tag.generate('form', **@attributes) { @content }
        end

        def field(name, **options)
          label = Html::Tag.generate('label', for: name) { name.to_s.capitalize }

          type = options.fetch(:as, 'input').capitalize
          options = options.except(:as)
          value = @object.public_send name
          input = SpecialTags.const_get("FormInputs::#{type}").generate name, options, value

          @content += label + input
        end

        alias input field

        def submit(value = 'Save')
          @content += Html::Tag.generate 'input', type: 'submit', value:
        end
      end
    end
  end
end
