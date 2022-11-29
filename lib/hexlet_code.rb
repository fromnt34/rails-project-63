# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/module/html/html"

module HexletCode
  class Tag
    def self.build(tag, **attributes)
      if block_given?
        # todo
        # rubocop:disable Style/ExplicitBlockArgument
        (HTML::Element.new(tag, **attributes) { yield }).to_s
        # rubocop:enable Style/ExplicitBlockArgument
      else
        HTML::Element.new(tag, **attributes).to_s
      end
    end
  end

  def self.form_for(user, **attributes)
    HTML::SpecialElements::Form.new user, **attributes
  end
end
