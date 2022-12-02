# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/module/html/html"

module HexletCode
  class Tag
    def self.build(tag, **attributes, &block)
      HTML::Element.new(tag, **attributes, &block).to_s
    end
  end

  def self.form_for(user, **attributes, &block)
    HTML::SpecialElements::Form.new(user, **attributes, &block).to_s
  end
end
