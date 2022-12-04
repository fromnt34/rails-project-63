# frozen_string_literal: true

module HTML
  module SpecialElements
    class Form
      def initialize(user, **attributes, &block)
        @user = user

        @attributes = attributes
        @attributes[:action] ||= '#'
        @attributes[:method] = 'post'

        @content = ''

        block&.call self
      end

      def to_s
        (::HTML::Element.new('form', **@attributes) { @content }).to_s
      end

      def field(type, **options)
        label = (::HTML::Element.new('label', for: type) { type.to_s.capitalize }).to_s

        tag = input_tag options[:as]
        options.delete :as
        input = input_as tag, type, options

        @content += label + input
      end

      alias input field

      def submit(value = 'Save')
        @content += ::HTML::Element.new('input', type: 'submit', value:).to_s
      end

      private

      def input_tag(as)
        as_and_tags = {
          text: 'textarea'
        }

        as_and_tags.fetch as, 'input'
      end

      def input_as(tag, input_type, input_options)
        if tag == 'input'
          # will use if input type is not text
          input_types = {
            # example:
            # age: :number
          }

          input_options[:type] = input_types.fetch input_type, 'text'
        end

        input_options[:name] = input_type

        if tag == 'textarea'
          block_value = @user.public_send input_type

          input_options[:cols] ||= 20
          input_options[:rows] ||= 40

          (::HTML::Element.new(tag, **input_options) { block_value }).to_s
        else
          input_options[:value] = @user.public_send input_type

          ::HTML::Element.new(tag, **input_options).to_s
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
