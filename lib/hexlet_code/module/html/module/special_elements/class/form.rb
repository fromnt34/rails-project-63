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

      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      def input(type, **options)
        field_as_and_tags = {
          text: "textarea"
        }

        # will use if field type not string/input type not text
        field_types_and_input_types = {
          # example:
          # age: :number
        }

        tag = field_as_and_tags.fetch options[:as], "input"
        options[:type] = field_types_and_input_types.fetch type, "text" if tag == "input"

        options[:name] = type

        block_value = nil
        if tag == "textarea"
          block_value = @user.public_send type

          options[:cols] = 20
          options[:rows] = 40
        else
          options[:value] = @user.public_send type
        end

        options.delete :as

        @content += if block_value.nil?
                      ::HTML::Element.new(tag, **options).to_s
                    else
                      (::HTML::Element.new(tag, **options) { block_value }).to_s
                    end
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
