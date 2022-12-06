# frozen_string_literal: true

module HexletCode
  module Html
    module SpecialElements
      class Form
        def initialize(for_object, **attributes, &block)
          @for_object = for_object

          @attributes = attributes
          @attributes[:action] ||= '#'
          @attributes[:method] ||= 'post'

          @content = ''

          block&.call self
        end

        def to_s
          (Html::Element.new('form', **@attributes) { @content }).to_s
        end

        def field(name, **options)
          label = (Html::Element.new('label', for: name) { name.to_s.capitalize }).to_s

          tag = input_tag options[:as]
          options.delete :as
          input = input_as tag, name, options

          @content += label + input
        end

        alias input field

        def submit(value = 'Save')
          @content += Html::Element.new('input', type: 'submit', value:).to_s
        end

        private

        def input_tag(as)
          as_and_tags = {
            text: 'textarea'
          }

          as_and_tags.fetch as, 'input'
        end

        def input_as(tag, input_name, input_options)
          input_options[:type] ||= input_options.fetch input_name, 'text' if tag == 'input'

          input_options[:name] = input_name

          if tag == 'textarea'
            block_value = @for_object.public_send input_name

            input_options[:cols] ||= 20
            input_options[:rows] ||= 40

            (Html::Element.new(tag, **input_options) { block_value }).to_s
          else
            input_options[:value] = @for_object.public_send input_name

            Html::Element.new(tag, **input_options).to_s
          end
        end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
