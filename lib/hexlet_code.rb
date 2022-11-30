# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/module/html/html"

module HexletCode
  class Tag
    def self.build(tag, **attributes, &block)
      if block_given?
        HTML::Element.new(tag, **attributes, &block).to_s
      else
        HTML::Element.new(tag, **attributes).to_s
      end
    end
  end

  def self.form_for(user, **attributes, &block)
    if block_given?
      HTML::SpecialElements::Form.new(user, **attributes, &block).to_s
    else
      HTML::SpecialElements::Form.new(user, **attributes).to_s
    end
  end
end
