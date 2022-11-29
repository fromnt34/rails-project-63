# frozen_string_literal: true

module HTML
  module SpecialElements
    class Form
      def initialize(user, **attributes)
        @user = user

        @attributes = attributes
        @attributes[:action] ||= "#"
        @attributes[:method] = "post"
      end

      def to_s
        (::HTML::Element.new "form", **@attributes).to_s
      end
    end
  end
end
