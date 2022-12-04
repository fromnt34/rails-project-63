# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/module/html/html'

module HexletCode
  class Tag
    def self.build(tag, **attributes, &)
      HTML::Element.new(tag, **attributes, &).to_s
    end
  end

  def self.form_for(user, **attributes, &)
    HTML::SpecialElements::Form.new(user, **attributes, &).to_s
  end
end
