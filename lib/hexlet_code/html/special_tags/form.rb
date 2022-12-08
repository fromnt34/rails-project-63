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
          (Html::Tag.new('form', **@attributes) { @content }).to_s
        end

        def field(name, **options)
          label = (Html::Tag.new('label', for: name) { name.to_s.capitalize }).to_s

          as = options.fetch(:as, 'input').to_s
          input = input_as as, name, options

          @content += label + input
        end

        alias input field

        def submit(value = 'Save')
          @content += Html::Tag.new('input', type: 'submit', value:).to_s
        end

        private

        def input_as(as, input_name, input_options)
          input_options[:name] = input_name

          if as == 'text'
            block_value = @object.public_send input_name

            input_options[:cols] ||= 20
            input_options[:rows] ||= 40

            (Html::Tag.new('textarea', **input_options.except(:as)) { block_value }).to_s
          else # as == 'input'
            input_options[:type] ||= input_options.fetch :type, 'text'
            input_options[:value] = @object.public_send input_name

            Html::Tag.new('input', **input_options).to_s
          end
        end
      end
    end
  end
end
