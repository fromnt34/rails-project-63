# frozen_string_literal: true

module HTML
  module SpecialElements
    class Form
      def initialize(user, **attributes)
        @user = user

        @attributes = attributes
        @attributes[:action] ||= "#"
        @attributes[:method] = "post"

        @content = ""

        yield(self) if block_given?
      end

      def to_s
        if @content.nil?
          (::HTML::Element.new "form", **@attributes).to_s
        else
          (::HTML::Element.new("form", **@attributes) { @content }).to_s
        end
      end

      def field(type, **options)
        tag = field_tag options[:as]
        options.delete :as

        @content += field_as tag, type, options
      end

      alias input field

      private

      def field_tag(field_as)
        field_as_and_tags = {
          text: "textarea"
        }

        field_as_and_tags.fetch field_as, "input"
      end

      # rubocop:disable Metrics/MethodLength
      def field_as(as_tag, field_type, field_options)
        if as_tag == "input"
          # will use if field type not string/input type not text
          field_types_and_input_types = {
            # example:
            # age: :number
          }

          field_options[:type] = field_types_and_input_types.fetch field_type, "text"
        end

        field_options[:name] = field_type

        if as_tag == "textarea"
          block_value = @user.public_send field_type

          field_options[:cols] = 20
          field_options[:rows] = 40

          (::HTML::Element.new(as_tag, **field_options) { block_value }).to_s
        else
          field_options[:value] = @user.public_send field_type

          ::HTML::Element.new(as_tag, **field_options).to_s
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
